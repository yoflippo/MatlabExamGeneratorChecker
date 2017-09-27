close all; clear all; clc;


%% EXPECT CORRECT BEHAVIOR
pathOfThisFile =  fileparts(mfilename('fullpath'));
source = fullfile(pathOfThisFile,'templateData');
des = fullfile(pathOfThisFile,'vraag_1');
removeShitFromDir(des);
copyfiles(source,des)
des = fullfile(pathOfThisFile,'vraag_1','vraag_1_46ff614bffcfdd07653f632390cfd664_.m');
% test a file in the testdata folder
[bool linenumber txt] = readAndFindTextInFile(des,'Voorbeeld antwoord:');
assert(bool,'1 should give a result')
assert(linenumber==23,'1 should give a result')
assert(readAndFindTextInFile(des,'Voorbeeld antwoord :'),'1 should give a result')
