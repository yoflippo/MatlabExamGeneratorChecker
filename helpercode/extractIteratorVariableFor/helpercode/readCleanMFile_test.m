clear all; close all; clc;
tic
nmCopy = 'copy.m';
testData = {'testData_ReadCleanMFile1.m' 'testData_ReadCleanMFile2.m' };

%% Expect a file called 'data.txt' in close proximity, get abs. path
pathThisFile = fileparts(mfilename('fullpath'));
apData = fullfile(pathThisFile,testData{1});
apDataCopy = fullfile(pathThisFile,nmCopy);


%% TEST: reading all lines of file
% Copy shizzel
copyfile(apData,apDataCopy);
fclose('all');

TXTFILE = readCleanMFile(apDataCopy);

assert(~isempty(strfind(TXTFILE,'%')));
assert(~isempty(strfind(TXTFILE,' ')));
delete(apDataCopy);
makeMFileFromCells(nmCopy,TXTFILE);
open(nmCopy)

%% TEST: reading empty file
% Copy shizzel
apData = fullfile(pathThisFile,testData{2});
copyfile(apData,apDataCopy);
fclose('all');

TXTFILE = readCleanMFile(apDataCopy);
assert(isempty(TXTFILE));
delete(apDataCopy);

%% TEST: new functionality
% Copy shizzel
apData = fullfile(pathThisFile,testData{1});
copyfile(apData,apDataCopy);
fclose('all');
clear TXTFILE;
TXTFILE = readCleanMFile('-ap',apDataCopy);
delete(apDataCopy);
assert(~isempty(strfind(TXTFILE,'%')));
assert(~isempty(strfind(TXTFILE,' ')));


%% TEST: new functionality with creation of copied file to leave old file intact
apData = fullfile(pathThisFile,testData{1});
copyfile(apData,apDataCopy);
fclose('all');
clear TXTFILE;
TXTFILE = readCleanMFile('-ap',apDataCopy,'-mc');
delete(apDataCopy);
apCopiedFile = replace(apDataCopy,'.m','_COPY.m');
if exist(apCopiedFile)
    delete(apCopiedFile);
    assert(true)
else
    assert(false)
end
assert(~isempty(strfind(TXTFILE,'%')));
assert(~isempty(strfind(TXTFILE,' ')));


%% TEST: no spaces
apData = fullfile(pathThisFile,testData{1});
copyfile(apData,apDataCopy);
fclose('all');
clear TXTFILE;
[TXTFILE a NOSPACES] = readCleanMFile('-ap',apDataCopy,'-mc','-ns');
delete(apDataCopy);
apCopiedFile = replace(apDataCopy,'.m','_COPY.m');
if exist(apCopiedFile)
    delete(apCopiedFile);
    assert(true)
else
    assert(false)
end
% % % % assert(~all(ismember(NOSPACES,' ')));
toc

%% TEST: UPPER
apData = fullfile(pathThisFile,testData{1});
copyfile(apData,apDataCopy);
fclose('all');
clear TXTFILE;
[TXTFILE a NOSPACES] = readCleanMFile('-ap',apDataCopy,'-mc','-ns','-upper');
delete(apDataCopy);
apCopiedFile = replace(apDataCopy,'.m','_COPY.m');
if exist(apCopiedFile)
    delete(apCopiedFile);
    assert(true)
else
    assert(false)
end
% % % % assert(~all(ismember(NOSPACES,' ')));
toc