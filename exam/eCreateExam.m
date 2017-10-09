%% A script that creates an exam based on the weekly assignments.
% This script uses the clean_source/assignment folder, but nothing else of
% the old. The scripts used in creating the exam are decoupled of the base
% scripts. However, this does not mean that the helpercode is not used.

clear all
YEAR = 2017;

%% Go to path of this file
BASEFOLDEREX = fileparts(mfilename('fullpath'));
cd(BASEFOLDEREX)
BASEFOLDER = GetPathOneLevelUp(BASEFOLDEREX);
addpath(genpath(fullfile(BASEFOLDEREX,'exam_helper')));
addpath(genpath(fullfile(BASEFOLDER,'helpercode')));

%% Make a dir of this exam, with some extra directories, create some handy variables
nmCurrExamDir = ['exam_' datetimetxt() ];
apCurrExam = fullfile(BASEFOLDEREX,'Created',nmCurrExamDir);
mkdirIf(apCurrExam);
mkdirIf(fullfile(apCurrExam,'fortesting'));
apCurrExamLog = fullfile(apCurrExam,'log');
mkdirIf(apCurrExamLog);
weekNames = {'week1'};

%% Some log settings
diary(fullfile(apCurrExamLog,['log_' mfilename '_' datetimetxt() '.txt']));
datetime
ver
dispPlatform
clc
dbstop if error

%% Generate MC files
cd(BASEFOLDEREX)
apCurrExamClean = fullfile(apCurrExam,'assignments');
removeShitFromDir(apCurrExamClean);
CreateAndCopyQuestions(BASEFOLDER,apCurrExamClean,weekNames);
disp('Created MC-Questions')
apFin = fullfile(apCurrExam,'exam');

%% Redo the hashing of the copied questions/assignments , make a custom file for this purpose
% 1 - Make sure a dic is made of all these files not just weekX
% 2 - Add the generation date to every exam file 
% Try to find a way to extract separate parts of the rehashing script

% check if a dictionary can contain everything needed bashed on only the
% hash of a file.
exam_addHashAndHeader

%% Find ways to select folders
% Important is to control the numbers of vragen/scripts/functions
% IDEAS:
% -     Search for the number of Types of questions to make a selection.

% -     Combine all assignments together in one pool and extract a certain
% -     Give a number of each question
% -     Rename the files and the internals of a file (maybe by using regex???)
% --    test the working of a functionfile if name of function and name file
%       are different

%% Creat a checking script
% -     unzip all zip-files in submitted
% -     Check for studentnumber
% --    Find a way the student enters the studentnumber twice
% -     loop through files

%% Finally, Clean up
rmpath(genpath(fullfile(BASEFOLDEREX,'exam_helper')));