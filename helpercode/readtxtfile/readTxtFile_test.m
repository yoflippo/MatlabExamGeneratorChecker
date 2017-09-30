clear all; close all; clc;

%% Expect a file called 'data.txt' in close proximity, get abs. path
pathThisFile = fileparts(mfilename('fullpath'));
apData = fullfile(pathThisFile,'data.txt');
apDataCopy = fullfile(pathThisFile,'datacopy.txt');

%% 
copyfile(apData,apDataCopy);
fclose('all'); pause(0.1);
lnmbr = 50;
txt = 'LAST LINE';
WriteLineOfFile(apDataCopy,lnmbr,txt);

%% TEST: reading all lines of file
TXTFILE = readTxtFile(apDataCopy);
assert(isequal(txt,TXTFILE{lnmbr}));


%% TEST: reada file with separator
[TXTFILE BELOW] = readTxtFile(apDataCopy,'%~>');
assert(~isempty(BELOW))

%% TEST: separator with empty file
apEmpty = fullfile(pathThisFile,'empty.txt');
[TXTFILE BELOW] = readTxtFile(apEmpty,'%~>');
assert(isempty(TXTFILE))
assert(isempty(BELOW))
%% FINISH
delete(apDataCopy);