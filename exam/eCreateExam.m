%% A script that creates an exam based on the weekly assignments.
% This script uses the clean_source/assignment folder, but nothing else of
% the old. The scripts used in creating the exam are decoupled of the base
% scripts. However, this does not mean that the helpercode is not used.

clear all; %use with care

%Go to path of this file
apThisFile = fileparts(mfilename('fullpath'));
cd(apThisFile)
BASEFOLDER = GetPathOneLevelUp(apThisFile);

%% Make a dir of this exam
nmCurrExamDir = ['exam_' datetimetxt() ];
mkdir(nmCurrExamDir)

%% Some log settings
diary(fullfile(pwd,nmCurrExamDir,['log_CW_' mfilename '_' datetimetxt() '.txt']));
datetime
ver
dispPlatform
dbstop if error
weekNames = {'week1' 'week2'};
BASEFOLDEREX = fileparts(mfilename('fullpath'));


%% Regenerate files but this time for the EXAM folder
%To Do give some output to user
if ~isequal(pwd,BASEFOLDEREX)
    cd(BASEFOLDEREX)
end

% % % % % %% Why???? should I redo everything or Why not????
% % % % % %NOT: everything should be fine ass is
% % % % % %NOT: all needed files are present
% % % % % 
% % % % % %REDO: all hash codes and dics are in different files which will take som
% % % % % %redoing
% % % % % %REDO: to have full control of what is needed
% % % % % %REDO: newly created files, for the exam can be used now.


%% Generate MC files
apFin = fullfile(BASEFOLDEREX,nmCurrExamDir,'assignments');
removeShitFromDir(apFin);
CreateAndCopyQuestions(BASEFOLDER,apFin,weekNames);
disp('Created MC-Questions')


%% Redo the hashing of these files, make a custom file for this purpose
% 1- Make sure a dic is made of all these files not just weekX
% Try to find a way to extract separate parts of the rehashing script

% check if a dictionary can contain everything needed bashed on only the
% hash of a file.

%% Find ways to select folders
% Important is to control the numbers of vragen/scripts/functions
% IDEAS:
% - Search for the number of Types of questions to make a selection.

% 1 - Get folders with vragen/opdrachten and make a random selection
%?but how to control the number of ass's?
%+

% 2 - Make a preselection manually of certain folders
%-Not automatically

% 3 - Combine all MC questions together in one pool and extract a certain
% number of them.
% Do the same thing for scripts 
% Do the same thing for functions


