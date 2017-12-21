clear all; close all; clc;

% Create copy of testdata
currPath = fileparts(mfilename('fullpath'));
cd(currPath)
nmOri = 'source_test_files';
nmSrc = 'testDataSrc';
nmDes = 'testDataDes';
apOri = fullfile(currPath,nmOri);
apSrc = fullfile(currPath,nmSrc);
apDes = fullfile(currPath,nmDes);

rmdirIf(apSrc);
rmdirIf(apDes);
mkdirIf(apSrc);
mkdirIf(apDes);
copyfiles(apOri,apSrc);

% TEST 0
unzip_all(apSrc,apDes);
removeShitFromDir(apSrc);
zip_all(apDes,apSrc)
disp('Check if the files in the source are the same as in destination');
keyboard
removeShitFromDir(apSrc)
rmdirIf(apSrc);
removeShitFromDir(apDes)
rmdirIf(apDes);