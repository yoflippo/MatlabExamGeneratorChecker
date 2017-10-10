clear all; clc;
currPath = pwd;

%% This file checks the SOL/CHECK/empty files in the current folder.
checkFiles = dir('**/*_SOL*.m');
for i = 1:length(checkFiles);
    %% Get info about current file
    fn = checkFiles(i).name;
    pathname = checkFiles(i).folder;
    CheckSolBase
end
cd(currPath)