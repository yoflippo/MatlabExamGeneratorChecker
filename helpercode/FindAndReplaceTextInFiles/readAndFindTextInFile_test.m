close all; clear all; clc;


%% EXPECT CORRECT BEHAVIOR
pathOfThisFile =  fileparts(mfilename('fullpath'));
source = fullfile(pathOfThisFile,'templateData');
des = fullfile(pathOfThisFile,'vraag_1');
removeShitFromDir(des);
copyfiles(source,des)
des = fullfile(pathOfThisFile,'vraag_1','vraag_1_46ff614bffcfdd07653f632390cfd664_.m');
% test a file in the testdata folder
assert(readAndFindTextInFile(des,'Voorbeeld antwoord:'),'1 should give a result')
[bl n] = readAndFindTextInFile(des,'Voorbeeld antwoord:')
assert(~readAndFindTextInFile(des,'Voorbeeld antwoord :'),'1 should give a result')
