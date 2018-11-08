%% This files creates/checks every assignment and file
clear all;
dbstop if error
global gWeekNames;

%% READ ME
WeekAssignmentsToGenerate = 1;  % Comment me if no re-generation needs to
% happen!!!
InitAll

% Select week to correct, it is assumed that 4 weeks are used.
weekToCorrect = 1; % Adjust me!!! (1-4)
weekNr = num2str(weekToCorrect);
weekName = ['week' weekNr];

%% START
if exist('WeekAssignmentsToGenerate','var')
    cnt = 1;
    for nW = 1:length(WeekAssignmentsToGenerate)
        gWeekNames{nW} = ['week' num2str(WeekAssignmentsToGenerate(nW))];
    end
    
    warning off
    rmpath(genpath(fileparts(mfilename('fullpath'))));
    addpath(genpath('helpercode'));
    warning on
    
%     buAll(pwd,'')
    
    %% Do some logging for debugging purposes
    diary(fullfile(pwd,'log',['logCW_' mfilename '_' datetimetxt() '.txt']));
    datetime
    ver
    dispPlatform
    
    %% Generate MC files and copy all clean_source/assignments -> root/assignments
    %To Do give some output to user
    cd(con.BASEFOLDER)
    disp('Generate MC files and copy all clean_source/assignments -> root/assignments')
    tic
    CreateAndCopyQuestions(con,gWeekNames);
    disp('Created MC-Questions')
    toc
    
    %% Clean the submitted folder
    apCleanSubmitted{1} = fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER,weekName);
    apCleanSubmitted{2} = [apCleanSubmitted{1} '_unzipped'];
    apCleanSubmitted{3} = [apCleanSubmitted{1} '_wrongsubmissions'];
    apCleanSubmitted{4} = [apCleanSubmitted{1} '_send'];
    for nCS = 1:length(apCleanSubmitted)
        removeShitFromDir(apCleanSubmitted{nCS});
    end
    
    %% Execute generated all assignments script
    disp('execute generate all script');
    cd(con.BASEFOLDER)
    tic
    try
        aGenerateEverythingForCourse(gWeekNames);
    catch err
        %Has to be a warning to continue
        warning([mfilename ': E0 ' err.message newline ' aGenerateEverythingForCourse did not finish correctly']);
        keyboard
    end
    toc
    
    %% Check if all 'checking' files are in working order when files are SOL/CHECK files are not equal
    cd(con.NAMEASSIGNMENTFOLDER)
    if ~isequal(length(dirmf(con.CHECKPOSTFIX)),length(dirmf(con.SOLPOSTFIX)))
        disp('Check if al "checking" files are in working order');
        assert(CheckSolCheckDirFunc(fullfile(con.BASEFOLDER,'assignments')));
    end
    
    %% Execute create week assignment scripts for individual students
    disp('execute create week assignment scripts');
    if ~isequal(pwd,con.BASEFOLDER)
        cd(con.BASEFOLDER)
    end
    tic
    try
        bCreateWeekAssignments(con,WeekAssignmentsToGenerate);
    catch err
        error([mfilename ' in bCreateWeekAssignments: ' newline  err.message])
    end
    toc
    
    %% TEST if all INcorrect solutions files pass
    disp('Copy certain testfiles to directory submitted');
    cd(con.BASEFOLDER)
    tic
    apTestFiles = fullfile(pwd,'fortesting',weekName,'correct_0');
    apFinDes = fullfile(pwd,con.STUDENTSUBFOLDER,weekName);
    removeShitFromDir(apFinDes);
    copyfiles(apTestFiles,apFinDes);
    disp('Execute check assignments');
    try
        if ~isequal(cCheckStudentSubmissions(weekToCorrect),1)
            error('The average grade is not equal to 1');
        end
    catch err
        error([mfilename ', did not work properly: ' err.message]);
    end
    toc
    
    %% TEST if all correct solutions files pass
    cd(con.BASEFOLDER)
    disp(weekName);
    apTestFiles = fullfile(pwd,'fortesting',weekName,'correct_100');
    apFinDes = fullfile(pwd,con.STUDENTSUBFOLDER,weekName);
    removeShitFromDir(apFinDes);
    copyfiles(apTestFiles,apFinDes);
    disp('Execute check assignments');
    tic
    try
        if ~isequal(cCheckStudentSubmissions(weekToCorrect),10)
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
end %Generation of week assignment + re-randomization

%% Check manually copied submitted files
cd(con.BASEFOLDER)
prePerform
disp('Check manually copied submitted files');
try
    cCheckStudentSubmissions(weekToCorrect)
catch err
    error([mfilename ': ' err.message]);
end
diary off
warning off
rmpath(genpath(fileparts(mfilename('fullpath'))));
addpath(genpath('helpercode'));
warning on