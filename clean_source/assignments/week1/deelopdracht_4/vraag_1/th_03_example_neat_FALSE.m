Het code voorbeeld dat hieronder staat is een voorbeeld
van netjes werken:

======= Code =======
load(fullfile(NAMEASSIGNMENTFOLDER,STUDENTNUMBERMAT))
addpath(genpath(fullfile(pwd,subWkFolder)))
removeDirectoriesFromFolder(fullfile(pwd,subWkFolder))
files = dir(subWkFolder);
======= Code =======