close all; clear all; clc;
apThisFile = fileparts(mfilename('fullpath'));
cd(apThisFile);

matfile = dirmf('.mat');

analyse_exam(fullfile(matfile.folder,matfile.name),40,'test')
