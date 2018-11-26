%% This files creates/checks every assignment and file
clear all;
dbstop if error

%% Initialisation
clc; close all; close all hidden;
fclose('all');
addpath(genpath('helpercode'));
global DEBUGOUTPUT;
DEBUGOUTPUT = 1;
% make zero to delete base folder
con = ConstantsClass('PATH',GetPathOneLevelUp(mfilename('fullpath')),...
    'NumberOfBonusAssignments',2,...
    'WeeksForAssignment',{1:3,4:6});

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

%% Select the right BONUSASSNUMBER.
con.BONUSASSNUMBER = 1; % Adjust me!!!
nmCurrBonusAss = con.BONUSASSNAME(con.BONUSASSNUMBER);
BonusAssignmentWeeks = con.BONUSASSIGNMENTS{con.BONUSASSNUMBER};

%% Comment me if no re-generation needs to
WeekAssignmentsToGenerate = BonusAssignmentWeeks;

%% START
if exist('WeekAssignmentsToGenerate','var')
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
    
    if input('Do you want to (re)generate the assignments? (yes=1/no=0)')
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
    end
    
    %% Check if all 'checking' files are in working order when files are SOL/CHECK files are not equal
    cd(con.NAMEASSIGNMENTFOLDER)
    if ~isequal(length(dirmf(con.CHECKPOSTFIX)),length(dirmf(con.SOLPOSTFIX)))
        disp('Check if al "checking" files are in working order');
        assert(CheckSolCheckDirFunc(fullfile(con.BASEFOLDER,'assignments')));
    end
    
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
    
    studentFolderOutput = dir('studentnumber*/*.txt');
    % go to the folder with studentnumbers. It is assumed to be a list with
    
    stdnmbFile = fullfile(studentFolderOutput(1).folder,studentFolderOutput(1).name);
    studentNumbers = load(stdnmbFile);
    
    cd(con.NAMEASSIGNMENTFOLDER)
    save(con.STUDENTNUMBERMAT,'studentNumbers');
    cd(con.BASEFOLDER)
    
    %% Execute create week assignment scripts for individual students
    disp('Execute create week assignment scripts');
    if ~isequal(pwd,con.BASEFOLDER)
        cd(con.BASEFOLDER)
    end
    tic
    try
        CreateBonusAssignments(con);
    catch err
        error([mfilename ' in CreateBonusAssignments: ' newline  err.message])
    end
    toc
    
    %% TEST if all INcorrect solutions files pass
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
        if ~isequal(cCheckStudentSubmissions(nmCurrBonusAss),10)
            error('The average grade is not equal to 10');
        end
    catch err
        error([mfilename ': ' err.message]);
    end
    toc
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
cd(con.BASEFOLDER)
prePerform
disp('Check manually copied submitted files');
try
    cCheckStudentSubmissions(con,BonusAssignmentWeeks)
catch err
    error([mfilename ': ' err.message]);
end
diary off
warning off
rmpath(genpath(fileparts(mfilename('fullpath'))));
addpath(genpath('helpercode'));
warning on