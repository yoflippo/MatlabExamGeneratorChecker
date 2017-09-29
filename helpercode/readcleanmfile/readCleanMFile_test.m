clear all; close all; clc;
endFile = 'test';
testData = {'testData_ReadCleanMFile1.m' 'testData_ReadCleanMFile2.m' };

%% Expect a file called 'data.txt' in close proximity, get abs. path
pathThisFile = fileparts(mfilename('fullpath'));
absPathData = fullfile(pathThisFile,testData{1});
fullNameCopTestdata = 'copy.m';
absPathDataCopy = fullfile(pathThisFile,fullNameCopTestdata);


%% TEST: reading all lines of file
% Copy shizzel
copyfile(absPathData,absPathDataCopy);
fclose('all');
delete(endFile)

TXTFILE = readCleanMFile(absPathDataCopy);

assert(~isempty(strfind(TXTFILE,'%')));
assert(~isempty(strfind(TXTFILE,' ')));
delete(absPathDataCopy);
makeMFileFromCells(endFile,TXTFILE);
open(endFile)

%% TEST: reading empty file
% Copy shizzel
absPathData = fullfile(pathThisFile,testData{2});
copyfile(absPathData,absPathDataCopy);
fclose('all');

TXTFILE = readCleanMFile(absPathDataCopy);
assert(~isempty(TXTFILE));

delete([endFile '.m'])

%% Finally
delete(absPathDataCopy)