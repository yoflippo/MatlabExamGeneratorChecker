%% A script that creates an exam based on the weekly assignments.
% This script uses the clean_source/assignment folder, but nothing else of
% the old. The scripts used in creating the exam are decoupled of the base
% scripts. However, this does not mean that the helpercode is not used.

clear all
nOfMulChoiceAssignment = 40;
nOfScriptsFunctions = 19;
weekNames = {'week1' 'week2' 'week3' 'week4'}; 

%% Go to path of this file
mfilename('fullpath')
ap.BASEFOLDEREX = fileparts(mfilename('fullpath'));
ap.BASEFOLDER = fileparts(ap.BASEFOLDEREX);
warning off; rmpath(genpath(ap.BASEFOLDER)); warning on;
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
ap.Submitted = fullfile(ap.CurrExam,'submitted');
mkdirIf(ap.Submitted);
ap.CurrExamLog = fullfile(ap.CurrExam,'log');
mkdirIf(ap.CurrExamLog);
ap.Assignments = fullfile(ap.CurrExam,'assignments');
mkdirIf(ap.Assignments);
ap.ExamSrcDir = fullfile(ap.CurrExam,nm.Exam);
mkdirIf(fullfile(ap.CurrExam,'bonus'));
ap.SUBMITTEDUNZIPPED = fullfile(ap.CurrExam,'submitted_unzipped');
mkdirIf(ap.SUBMITTEDUNZIPPED);
rmpath(genpath(ap.EXAMHELPERHEADER));
% Copy the check exam script
copyfile(fullfile(ap.EXAMHELPERHEADER,'checkExam_base.m'),fullfile(ap.CurrExam,['_' nm.CurrExamDir]))

%% Some log settings
diary(fullfile(ap.CurrExamLog,['log_' mfilename '_' datetimetxt() '.txt']));
datetime
ver
dispPlatform
clc
dbstop if error

%% Generate MC files keep original files intact
cd(ap.BASEFOLDEREX)
removeShitFromDir(ap.Assignments);
CreateAndCopyQuestions(ap,weekNames);
disp('Created MC-Questions')

%% Redo the hashing of the copied questions/assignments 
exam_addHashAndHeader(ap,weekNames,nm)
disp('Added Hash and info to assignments')

%% Create a struct with randomized assignments
cd(ap.BASEFOLDEREX)
ap.AssignmentsWk = fullfile(ap.Assignments,weekNames{1});
AssInfo = getExamQuestionInfo(ap.Assignments);
disp('Created a randomized struct with all the assignments')

%% Assign randomized assignments for exam
cd(ap.CurrExam);
% right number.
sAssignedtmp1 = createMCQ(AssInfo,nOfMulChoiceAssignment,nm);
% Create a number of script/function assignments
sAssignedtmp2 = createFuncScriptAss(AssInfo,nOfScriptsFunctions,nm);
sAssigned = [sAssignedtmp1 sAssignedtmp2];
disp(['Points for this exam: '  num2str(sum([sAssigned.points]))]);
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
nmFinalExamFolder = 'ToetsBiostaticaMatlab';
mkdirIf(nmFinalExamFolder)
cd(nmFinalExamFolder)
ap.CurrZipFile = fullfile(ap.CurrExam,[nm.CurrExamDir '.zip']);
ap.CurrZipFinalFile = fullfile(pwd,[nm.CurrExamDir '.zip']);
% zip(ap.CurrZipFile,ap.ExamSrcDir);
zip(ap.CurrZipFinalFile,ap.ExamSrcDir);
cd(ap.CurrExam)

%% Check the zip-files in folder submitted
copyfile(ap.CurrZipFile,ap.Submitted);

% NOTE: IETS DOEN AAN MOGELIJK VALSPELEN DOORDAT STUDENTEN KOPIEEN TOEVOEGEN
% OPLOSSING, 

%% Create testing files for a few students
generateTestExams(ap.CurrExam);


%% Check test exams without solutions
cd(ap.CurrExam)
removeShitFromDir(ap.Submitted)
copyfiles(fullfile('Test_Exams','exams'),ap.SUBMITTEDUNZIPPED);
grades = checkExam();
if mean(grades(:,2)) > 1
    error('The exam grade should be 1')
else
    disp('CHECK OK!');
end
cd ..

%% Check test exams WITH solutions
cd(ap.CurrExam)
removeShitFromDir(ap.Submitted)
copyfiles(fullfile('Test_Exams','exams_SOL'),ap.SUBMITTEDUNZIPPED);
grades = checkExam();
if mean(grades(:,2)) < 10
    error('The exam grade should be a TEN!!')
else
    disp('CHECK OK!');
end
cd ..

%% Make a backup
cd(ap.BASEFOLDER)
dos(['start WinRaR a -r -m5 -mt16 ' [ap.BASEFOLDER '_BU'] filesep datetimetxt() 'beforeExam ' pwd filesep '*.*'])

%% Finally, Clean up
disp('Finally, Clean up');
warning off
fclose('all');
rmpath(genpath(ap.BASEFOLDEREX));
rmpath(genpath(ap.HELPERCODE));
rmpath(genpath(ap.CurrExam));
rmpath(genpath(ap.Assignments));
warning on