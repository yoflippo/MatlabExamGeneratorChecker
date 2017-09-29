clear all; close all; clc;

%% Expect a file called 'data.txt' in close proximity, get abs. path
pathThisFile = fileparts(mfilename('fullpath'));
absPathData = fullfile(pathThisFile,'testDataReadCleanMFile.m');
fullNameCopTestdata = 'copy.m';
absPathDataCopy = fullfile(pathThisFile,fullNameCopTestdata);

%% Copy shizzel
copyfile(absPathData,absPathDataCopy);
fclose('all');

%% TEST: reading all lines of file
TXTFILE = readCleanMFile(absPathDataCopy);

assert(~isempty(strfind(TXTFILE,'%')));
assert(~isempty(strfind(TXTFILE,' ')));
delete(absPathDataCopy);