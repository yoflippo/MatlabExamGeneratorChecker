clear all; close all; clc;

%% Get path of output folder and empty it
pathOfThisFile = erase(mfilename('fullpath'),mfilename);
outputDir = fullfile(pathOfThisFile,'generated_questions');
removeShitFromDir(outputDir)
mkdir(outputDir)

%% Get deepest folders with theses
weekDir = 'week1';
folders = GetDeepestFolders(fullfile(pathOfThisFile,weekDir))

%% Get absolute paths of theses files with there respective answers
for nDirs = 1:length(folders)
    cd(folders{nDirs});
    % get the theses files
    theses{nDirs} = dir('**\*th_*.m');
    % make a cell array of theses path with solution
    % loop through theses
    for nThss = 1:length(theses{nDirs})
        tmpName = theses{1,nDirs}(nThss).name;
        tmpPath = theses{1,nDirs}(nThss).folder;
        if contains(tmpName,'TRUE')
            tmpAnswer = true;
        else
            tmpAnswer = false;
        end
        thesesPathAnswer{nDirs,nThss} = {fullfile(tmpPath,tmpName),tmpAnswer};    
    end
    cd(pathOfThisFile);
end

%% Copy folder of weekx and empty the folder
copyfiles(fullfile(pathOfThisFile,weekDir),fullfile(outputDir,weekDir))
emptyDirRecursiveMFiles(fullfile(outputDir,weekDir))

%% Browse the subfolder of weekx
for nDirs = 1:length(folders)
    
    
end