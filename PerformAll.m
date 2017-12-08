%% This files creates/checks every assignment and file
clear all;
dbstop if error
global gWeekNames;
Weeks = 4;  % Adjust me!!!
cnt = 1;
for nW = 1:length(Weeks)
    gWeekNames{cnt,nW} = ['week' num2str(Weeks(nW))];
    cnt = cnt +1 ;
end
warning off
rmpath(genpath(fileparts(mfilename('fullpath'))));
warning on
addpath(genpath('helpercode'));
InitAll
buAll(pwd,'')
% Fill in week to test
weekToCorrect = 2;
weekNr = num2str(weekToCorrect);
weekName = ['week' weekNr];

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
    bCreateWeekAssignments(con,Weeks);
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
return;

%% Check manually copied submitted files
% BU Cleaned submitted files from students before checking
cd(con.BASEFOLDER)
tmp
cd(con.STUDENTSUBFOLDER)
zip(fullfile(con.BASEFOLDER,'submitted_bu',['bu_beforeChecking_wk' num2str(weekToCorrect) '_' datetimetxt() '.zip' ]),fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER))
cd(con.BASEFOLDER)
disp('Check manually copied submitted files');
try
    cCheckStudentSubmissions(weekToCorrect)
catch err
    error([mfilename ': ' err.message]);
end
diary off