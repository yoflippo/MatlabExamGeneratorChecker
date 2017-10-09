clear all; close all; clc;

%% Expect a file called 'data.txt' in close proximity, get abs. path
pathThisFile = fileparts(mfilename('fullpath'));
absPathData = fullfile(pathThisFile,'data.txt');
absPathDataCopy = fullfile(pathThisFile,'datacopy.txt');

%% 
copyfile(absPathData,absPathDataCopy);
fclose('all'); pause(0.1);
lnmbr = 50;
txt = 'LAST LINE';
WriteLineOfFile(absPathDataCopy,lnmbr,txt);

%% TEST: reading all lines of file
TXTFILE = readTxtFile(absPathDataCopy);

assert(isequal(txt,TXTFILE{lnmbr}));
delete(absPathDataCopy);