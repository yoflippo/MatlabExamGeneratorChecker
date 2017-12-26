clear all; close all; clc;

% Create copy of testdata
currPath = fileparts(mfilename('fullpath'));
cd(currPath)

nmOri = 'original_writeToExcelFiles';
nmSrc = 'testDataSrc';
nmExcel = 'MT-P-BIOSTAT-17_20-12-2017_13_08.xls';
nmMat1 = 'grades.mat';
% nmMat2 = 'grades2.mat';

apOri = fullfile(currPath,nmOri);
apSrc = fullfile(currPath,nmSrc);
apExc = fullfile(apSrc,nmExcel);
apMat1 = fullfile(apSrc,nmMat1);
% apMat2 = fullfile(apSrc,nmMat2);

rmdirIf(apSrc);
mkdirIf(apSrc);
copyfiles(apOri,apSrc);

WriteResultsToExcel(apExc,apMat1);
% WriteResultsToExcel(apExc,apMat2);
winopen(apExc)
