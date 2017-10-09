%% This files creates/checks everything expect for the exam.
clear all;
diary(fullfile(pwd,'log',['logCW_' mfilename '_' datetimetxt() '.txt']));
datetime
ver
dispPlatform
dbstop if error
global BASEFOLDER;
global gWeekNames;
gWeekNames = {'week1'};

InitAll

%% Generate MC files and copy all clean_source/assignments -> root/assignments
%To Do give some output to user
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
disp('Generate MC files and copy all clean_source/assignments -> root/assignments')
tic
apFin = fullfile(BASEFOLDER,'assignments');
% removeShitFromDir(apFin);
CreateAndCopyQuestions(BASEFOLDER,apFin,gWeekNames);
disp('Created MC-Questions')
toc

%% Execute generated all assignments script
disp('execute generate all script');
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
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
    bCreateWeekAssignments();
catch err
    disp(err)
    error('in bCreateWeekAssignments');
end
toc

%% TEST if all INcorrect solutions files pass
disp('Copy certain testfiles to directory submitted');
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
tic
apTestFiles = fullfile(pwd,'fortesting','week1','correct_0');
apFinDes = fullfile(pwd,STUDENTSUBFOLDER,'week1');
removeShitFromDir(apFinDes);
copyfiles(apTestFiles,apFinDes);
disp('Execute check assignments');
try
    if ~isequal(cCheckStudentSubmissions(),1)
        error('The average grade is not equal to 1');
    end
catch err
    disp(err);
    error(' cCheckStudentSubmissions() did not work properly');
end
toc

%% TEST if all correct solutions files pass
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
apTestFiles = fullfile(pwd,'fortesting','week1','correct_100');
apFinDes = fullfile(pwd,STUDENTSUBFOLDER,'week1');
removeShitFromDir(apFinDes);
copyfiles(apTestFiles,apFinDes);
disp('Execute check assignments');
tic
try
    if ~isequal(cCheckStudentSubmissions(),10)
        error('The average grade is not equal to 10');
    end
catch
end
toc
cd(BASEFOLDER)

datetime
diary off

%% Backup if all is working
if askuser('Is all in working order?',true)
    buAll
end


return;

%% Check manually copied submitted files 
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
disp('Check manually copied submitted files');
tic
try
    if ~isequal(cCheckStudentSubmissions(),1)
        error('The average grade is not equal to 1');
    end
catch
end
toc





