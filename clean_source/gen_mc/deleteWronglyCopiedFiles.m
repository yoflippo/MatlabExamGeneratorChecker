%% Error occured that MC questions were copied to thesis folder
% this script removes those wrongly copied files
clear all;
currPath = pwd;
directory = uigetdir();
cd(directory);
%% Find CHECK SOL FILES
sf = dir(['**' filesep '*_CHECK.m'])
for ndf = 1:length(sf)
    solFile = fullfile(sf(ndf).folder,sf(ndf).name);
    checkFile = replace(solFile,'_CHECK','_SOL');
    questFile = replace(solFile,'_CHECK','');
    delete(solFile);
    delete(checkFile);
    delete(questFile);
end