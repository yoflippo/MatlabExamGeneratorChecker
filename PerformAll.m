%% This files creates/checks every assignment and file
%% Initialisation
clear all; clc; close all; close all hidden; fclose('all');
dbstop if error

addpath(genpath('helpercode'));
global DEBUGOUTPUT; DEBUGOUTPUT = 1;
con = ConstantsClass();

%% ACTION: Select the right BONUSASSNUMBER.
con.BONUSASSNUMBER = 2; % Adjust me!!! See: ConstantsClass.m
nmCurrBonusAss = con.BONUSASSNAME(con.BONUSASSNUMBER);
BonusAssignmentWeeks = con.BONUSASSIGNMENTS{con.BONUSASSNUMBER};

%% Check for the existence of needed supporting scripts/function files
debugOutput(DEBUGOUTPUT,'Check for the existence of needed supporting scripts/function files');
for i = 1:length(con.LISTWITHNEEDEDFOLDERS)
    try
        cd(con.LISTWITHNEEDEDFOLDERS{i});
        cd ..
    catch err
        error(['PLEASE ADJUST YOUR CURRENT LOCATION (Current Folder)' ...
            'The folder: ' con.LISTWITHNEEDEDFOLDERS{i} ' was not found']);
    end
end

%% START
if input(['Do you want to (re)generate the assignments (replaces all files in directory "assignments" ? ' ...
        newline 'This is something you will do only once per Bonusassignment  (yes=1/no=0)'])
    cnt = 1;
    warning off
    rmpath(genpath(fileparts(mfilename('fullpath'))));
    addpath(genpath('helpercode'));
    warning on
    
    %% Do some logging for debugging purposes
    diary(fullfile(pwd,'log',['logCW_' mfilename '_' datetimetxt() '.txt']));
    datetime
    ver
    dispPlatform
    
    
    %% Generate theses and copy all clean_source/assignments -> BASEFOLDER/assignments
    %To Do give some output to user
    cd(con.BASEFOLDER)
    disp('Generate MC files and copy all clean_source/assignments -> root/assignments')
    tic
    CreateAndCopyQAssignments(con);
    disp('Created MC-Questions')
    cd(con.BASEFOLDER)
    toc
    
    %% Execute generated all assignments script, SHOULD BE EXECUTED ONLY ONCE
    disp('execute generate all script');
    cd(con.BASEFOLDER)
    tic
    try
        GiveHashesToAssignments(con,DEBUGOUTPUT);
    catch err
        %Has to be a warning to continue
        warning([mfilename ': E0 ' err.message newline ' GiveHashesToAssignments did not finish correctly']);
        keyboard
    end
    toc
    
    %     %% Check if all 'checking' files are in working order when files are SOL/CHECK files are not equal
    %     cd(con.BASEFOLDER)
    %     cd(con.NAMEASSIGNMENTFOLDER)
    %     if ~isequal(length(dirmf(con.CHECKPOSTFIX)),length(dirmf(con.SOLPOSTFIX)))
    %         disp('Check if al "checking" files are in working order');
    %         assert(CheckSolCheckDirFunc(fullfile(con.BASEFOLDER,'assignments')));
    %     end
    
    %% Clean the submitted folder
    cd(con.BASEFOLDER)
    
    apCleanSubmitted{1} = fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER,...
        con.BONUSASSNAME(con.BONUSASSNUMBER));
    apCleanSubmitted{2} = [apCleanSubmitted{1} '_unzipped'];
    apCleanSubmitted{3} = [apCleanSubmitted{1} '_wrongsubmissions'];
    apCleanSubmitted{4} = [apCleanSubmitted{1} '_send'];
    for nCS = 1:length(apCleanSubmitted)
        removeShitFromDir(apCleanSubmitted{nCS});
    end
    
    %% Read the student number and convert the list to e-mailadresses
    debugOutput(DEBUGOUTPUT,'Read the student number and convert the list to e-mailadresses',1);
    
    % go to the folder with studentnumbers. It is assumed to be a list with
    apDirStudentNumbers = fullfile(con.BASEFOLDER,'studentnumbers');
    cd(apDirStudentNumbers);
    
    % Remove non-unique students
    opts = delimitedTextImportOptions("NumVariables", 1);
    opts.DataLines = [1, Inf];
    opts.Delimiter = ",";
    opts.VariableNames = "VarName1";
    opts.VariableTypes = "string";
    opts = setvaropts(opts, 1, "WhitespaceRule", "preserve");
    opts = setvaropts(opts, 1, "EmptyFieldRule", "auto");
    opts.ExtraColumnsRule = "ignore";
    opts.EmptyLineRule = "read";
    studentnumbers1 = readtable("studentnumbers.txt", opts);
    studentnumbers1 = table2array(studentnumbers1);
    clear opts
    
    % Replace studentnumbers.txt
    studentNumbers = unique(studentnumbers1);
    delete('studentnumbers.txt');
    writetxtfile(fullfile(pwd,'studentnumbers.txt'),studentNumbers)
    
    disp(['Number of students: ' num2str(length(studentNumbers))]);
    cd(con.BASEFOLDER);
    cd(con.NAMEASSIGNMENTFOLDER);
    save(con.STUDENTNUMBERMAT,'studentNumbers');
    cd(con.BASEFOLDER)
    
    %% Creat Bonus assignments for individual students
    disp('Execute create week assignment scripts');
    cd(con.BASEFOLDER)
    try
        CreateBonusAssignments(con); %also generates testfiles
    catch err
        error([mfilename ' in CreateBonusAssignments: ' newline  err.message])
    end
    
    %% TEST if all INcorrect solutions files pass
    if input('Do you want to test all generated files? (Yes=1,No=0)')
        
        disp('Copy certain testfiles to directory submitted');
        cd(con.BASEFOLDER)
        tic
        apTestFiles = fullfile(pwd,'fortesting',nmCurrBonusAss,'correct_0');
        apFinDes = fullfile(pwd,con.STUDENTSUBFOLDER,nmCurrBonusAss);
        removeShitFromDir(apFinDes);
        copyfiles(apTestFiles,apFinDes);
        disp('Execute check assignments');
        try
            if ~isequal(cCheckStudentSubmissions(con,nmCurrBonusAss),1)
                error('The average grade is not equal to 1');
            end
        catch err
            error([mfilename ', did not work properly: ' err.message]);
        end
        removeShitFromDir(apFinDes);
        removeShitFromDir([apFinDes '_unzipped']);
        toc
        
        %% TEST if all correct solutions files pass
        cd(con.BASEFOLDER)
        apTestFiles = fullfile(pwd,'fortesting',nmCurrBonusAss,'correct_100');
        apFinDes = fullfile(pwd,con.STUDENTSUBFOLDER,nmCurrBonusAss);
        removeShitFromDir(apFinDes);
        copyfiles(apTestFiles,apFinDes);
        disp('Execute check assignments');
        tic
        try
            if ~isequal(cCheckStudentSubmissions(con,nmCurrBonusAss),10)
                error('The average grade is not equal to 10');
            end
        catch err
            error([mfilename ': ' err.message]);
        end
        toc
        removeShitFromDir(apFinDes);
        removeShitFromDir([apFinDes '_unzipped']);
    end
    
    cd(con.BASEFOLDER)
    
    %% Backup if all is working
    datetime
    diary off
    disp('Making a backup');
    buAll(con.BASEFOLDER,'')
    warning off
    rmpath(genpath(fileparts(mfilename('fullpath'))));
    addpath(genpath('helpercode'));
    warning on
    return;
end %Generation of week assignment


%% Check manually copied submitted files
if input('Do you want to copy the zipped files from the students to use for checking? (Yes=1,No=0)')
    submittedThisWeek = fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER,nmCurrBonusAss);
    removeShitFromDir(submittedThisWeek)
    removeShitFromDir([submittedThisWeek  '_checked'])
    copyfiles([submittedThisWeek  '_unzipped'],submittedThisWeek)
end
cd(con.BASEFOLDER)
disp('Check manually copied submitted files');
try
    [averageGrade, studentMatrix] = cCheckStudentSubmissions(con,nmCurrBonusAss);
    [strOV, strStudGrad] = AnalyseBonusAssignments(con);
catch err
    error([mfilename ': ' err.message]);
end
cd(fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER))
save(['WorkSpace' mfilename 'AfterChecking' nmCurrBonusAss datetimetxt '.mat'])
diary off
warning off
rmpath(genpath(fileparts(mfilename('fullpath'))));
addpath(genpath('helpercode'));
warning on
cd(con.BASEFOLDER)
clc
disp([mfilename ': All done!'])