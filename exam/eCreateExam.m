%% A script that creates an exam based on the weekly assignments.
% This script uses the clean_source/assignment folder, but nothing else of
% the old. The scripts used in creating the exam are decoupled of the base
% scripts. However, this does not mean that the helpercode is not used.

clear all
nOfMulChoiceAssignment = 40;
nOfScriptsFunctions = 10;
weekNames = {'week1' 'week2'}; % fill with the other weeks

%% Go to path of this file
mfilename('fullpath')
ap.BASEFOLDEREX = fileparts(mfilename('fullpath'));
cd(ap.BASEFOLDEREX)
ap.BASEFOLDER = fileparts(ap.BASEFOLDEREX);
ap.EXAMHELPER = fullfile(ap.BASEFOLDEREX,'exam_helper');
addpath(genpath(ap.EXAMHELPER));
ap.HELPERCODE = fullfile(ap.BASEFOLDER,'helpercode');
ap.EXAMHELPERHEADER = fullfile(ap.EXAMHELPER,'exam_header');
addpath(genpath(ap.HELPERCODE));

%% Make a dir of this exam, with some extra directories, create some handy variables
nm.Exam = 'Tentamen';
nm.CurrExamDir = [nm.Exam '_' datetimetxt() ];
ap.CurrExam = fullfile(ap.BASEFOLDEREX,'Created',nm.CurrExamDir);
mkdirIf(ap.CurrExam);
mkdirIf(fullfile(ap.CurrExam,'submitted'));
ap.CurrExamLog = fullfile(ap.CurrExam,'log');
mkdirIf(ap.CurrExamLog);
ap.Assignments = fullfile(ap.CurrExam,'assignments');
mkdirIf(ap.Assignments);
ap.ExamSrcDir = fullfile(ap.CurrExam,nm.Exam);

%% Some log settings
diary(fullfile(ap.CurrExamLog,['log_' mfilename '_' datetimetxt() '.txt']));
datetime
ver
dispPlatform
clc
dbstop if error

%% Generate MC files
cd(ap.BASEFOLDEREX)
removeShitFromDir(ap.Assignments);
CreateAndCopyQuestions(ap,weekNames);
disp('Created MC-Questions')

%% Redo the hashing of the copied questions/assignments , make a custom file for this purpose
% 1 - Make sure a dic is made of all these files not just weekX
% 2 - Add the generation date to every exam file
% Try to find a way to extract separate parts of the rehashing script

% check if a dictionary can contain everything needed bashed on only the
% hash of a file.
exam_addHashAndHeader(ap,weekNames,nm)
disp('Added Hash and info to assignments')

%% Create a struct with randomized assignments
cd(ap.BASEFOLDEREX)
ap.AssignmentsWk = fullfile(ap.Assignments,weekNames{1});
AssInfo = getExamQuestionInfo(ap.Assignments);
cd(ap.CurrExam);
disp('Created a randomized struct with all the assignments')

%% Rename the files so that the string 'opdracht_X' in an assignment gets the
% right number.
sAssignedtmp1 = createMCQ(AssInfo,nOfMulChoiceAssignment,nm);
% Create a number of script/function assignments
sAssignedtmp2 = createFuncScriptAss( AssInfo, nOfScriptsFunctions,nm );
sAssigned = [sAssignedtmp1 sAssignedtmp2];
clear sAssignedtmp1 sAssignedtmp2 ans;
save('Workspace.mat');

%% Add files to help the student
ap.CurrExam_ExamDir = fullfile(ap.CurrExam,nm.Exam);
cd(ap.CurrExam_ExamDir);
% Copy files for start of Exam
ap.CurrExam_FirstAss = fullfile(ap.CurrExam_ExamDir,'deelopdracht_0');
mkdirIf(ap.CurrExam_FirstAss);
removeShitFromDir(ap.CurrExam_FirstAss);
copyfile(fullfile(ap.EXAMHELPERHEADER,'StartTentamen.m'),ap.CurrExam_FirstAss);

% Copy AfrondenTentamen
ap.CurrExam_LastAss = fullfile(ap.CurrExam_ExamDir,'deelopdracht_3');
mkdirIf(ap.CurrExam_LastAss);
removeShitFromDir(ap.CurrExam_LastAss);
copyfile(fullfile(ap.EXAMHELPERHEADER,'AfrondenTentamen.m'),ap.CurrExam_LastAss);
cd(ap.CurrExam);

%% Create a checking script
cd(ap.CurrExam)
zip(fullfile(ap.CurrExam,[nm.CurrExamDir '.zip']),ap.ExamSrcDir);

% -     unzip all zip-files in submitted
% -     Check for studentnumber
% --    Find a way the student enters the studentnumber twice
% -     loop through files


%% Finally, Clean up
warning off
fclose('all');
rmpath(genpath(ap.BASEFOLDEREX));
rmpath(genpath(ap.HELPERCODE));
rmpath(genpath(ap.CurrExam));
warning on