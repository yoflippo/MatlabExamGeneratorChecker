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

sf = dir(['**' filesep '*points.m']);
for ndf = 1:length(sf)
    solFile = fullfile(sf(ndf).folder,sf(ndf).name);
    delete(solFile);
end

sf = dir(['**' filesep '*TypeOfAssignment_Multiplechoice.m']);
for ndf = 1:length(sf)
    solFile = fullfile(sf(ndf).folder,sf(ndf).name);
    delete(solFile);
end

sf = dir(['**' filesep '*(Case Conflict).m']);
for ndf = 1:length(sf)
    solFile = fullfile(sf(ndf).folder,sf(ndf).name);
    delete(solFile);
end

cd(currPath)