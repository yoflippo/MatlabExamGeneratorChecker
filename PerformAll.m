%% This files creates/checks every assignment and file
clear all

dbstop if error
global BASEFOLDER;
global gWeekNames;
Weeks = 1:2;  % Adjust me!!!
for nW = Weeks
    gWeekNames{1,nW} = ['week' num2str(nW)]; 
end
addpath(genpath('helpercode'));
InitAll

%% Do some logging for debugging purposes
diary(fullfile(pwd,'log',['logCW_' mfilename '_' datetimetxt() '.txt']));
datetime
ver
dispPlatform

%% Generate MC files and copy all clean_source/assignments -> root/assignments
%To Do give some output to user
cd(BASEFOLDER)
disp('Generate MC files and copy all clean_source/assignments -> root/assignments')
tic
apFin = fullfile(BASEFOLDER,'assignments');
% removeShitFromDir(apFin);
CreateAndCopyQuestions(BASEFOLDER,apFin,gWeekNames);
disp('Created MC-Questions')
toc

%% Execute generated all assignments script
disp('execute generate all script');
cd(BASEFOLDER)
tic
try
    run('aGenerateEverythingForCourse.m')
catch err
    disp(err);
    warning([mfilename ': aGenerateEverythingForCourse did not finish correctly']);
end
toc

%% Check if al 'checking' files are in working order
disp('Check if al "checking" files are in working order');
assert(CheckSolCheckDirFunc(fullfile(BASEFOLDER,'assignments')));

%% Execute create week assignment scripts for individual students
disp('execute create week assignment scripts');
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
tic
try
    bCreateWeekAssignments(Weeks);
catch err
    disp(err)
    error('in bCreateWeekAssignments');
end
toc


%% Fill in week to test
weekToCorrect = 1;
weekNr = num2str(weekToCorrect);
weekName = ['week' weekNr];


%% TEST if all correct solutions files pass
cd(BASEFOLDER)
apTestFiles = fullfile(pwd,'fortesting',weekName,'correct_100');
apFinDes = fullfile(pwd,STUDENTSUBFOLDER,weekName);
removeShitFromDir(apFinDes);
copyfiles(apTestFiles,apFinDes);
disp('Execute check assignments');
tic
try
    if ~isequal(cCheckStudentSubmissions(weekToCorrect),10)
        error('The average grade is not equal to 10');
    end
catch err
    error([mfilename ': ' err]);
end
toc
cd(BASEFOLDER)


%% TEST if all INcorrect solutions files pass
disp('Copy certain testfiles to directory submitted');
cd(BASEFOLDER)
tic
apTestFiles = fullfile(pwd,'fortesting',weekName,'correct_0');
apFinDes = fullfile(pwd,STUDENTSUBFOLDER,weekName);
removeShitFromDir(apFinDes);
copyfiles(apTestFiles,apFinDes);
disp('Execute check assignments');
try
    if ~isequal(cCheckStudentSubmissions(weekToCorrect),1)
        error('The average grade is not equal to 1');
    end
catch err
    disp(err);
    error(' cCheckStudentSubmissions(week) did not work properly');
end
toc
datetime
diary off


%% Backup if all is working
disp('Making a backup');
buAll
return;


%% Check manually copied submitted files
cd(BASEFOLDER)
disp('Check manually copied submitted files');
tic
try
    if ~isequal(cCheckStudentSubmissions(weekToCorrect),1)
        error('The average grade is not equal to 1');
    end
catch
end
toc





