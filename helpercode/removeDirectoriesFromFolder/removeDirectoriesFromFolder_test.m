clear all; close all; clc;

% test if Current Folder contains this file
filesInCurDir = dir(pwd);
blFileFound = false;
for i = 1:length(filesInCurDir)
    if contains(filesInCurDir(i).name,mfilename)
        blFileFound = true;
    end
end

if ~blFileFound
    error('This script is not in the Current Folder, PLEASE CHANGE THIS');
end
% add the files in this folder
addpath(genpath(pwd))
% copy the exampledata to working folder
copyfile('exampledata','workingfolder')
addpath(genpath('workingfolder'))

% test script
absPathFolder = fullfile(pwd,'workingfolder');
removeDirectoriesFromFolder(absPathFolder);

%check for dirs
allShit = dir(absPathFolder);
for i = 3:length(allShit)
   if allShit(i).isdir
       error('the function DOES NOT WORK');
   end
end
disp('The function is working properly')
