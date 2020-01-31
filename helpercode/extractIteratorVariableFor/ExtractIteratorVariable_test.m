clear all; close all; clc;
testData = {'testData_ReadCleanMFile1.m' 'testData_ReadCleanMFile2.m' };

%% Expect a file called 'data.txt' in close proximity, get abs. path
pathThisFile = fileparts(mfilename('fullpath'));
apData = fullfile(pathThisFile,'helpercode',testData{1});

%% TEST: reading all lines of file
var = ExtractIteratorVariableFor(readCleanMFile(apData))