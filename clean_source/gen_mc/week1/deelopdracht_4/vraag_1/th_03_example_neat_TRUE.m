Het code voorbeeld dat hieronder staat is een voorbeeld
van netjes werken:

======= Code =======
% Find studentnumbers
load(fullfile(NAMEASSIGNMENTFOLDER,STUDENTNUMBERMAT))
% Remove directories from folder, they contain unzipped files and they are
% unusable because you are running this script
addpath(genpath(fullfile(pwd,subWkFolder)))
removeDirectoriesFromFolder(fullfile(pwd,subWkFolder))
% Get files in the folder for analysis
files = dir(subWkFolder);
======= Code =======