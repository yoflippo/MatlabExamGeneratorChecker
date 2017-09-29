clear all; clc;
currPath = pwd;

%% To prevent manual actions
matFile = 'Automatic.mat'; 
if ~exist(matFile)
    pathname = uigetdir('Pick a DIR');
    save(matFile,'pathname');
else     
    load(matFile);
end

cd(pathname);
checkFiles = dir('**/*_CHECK*.m');

for i = 1:length(checkFiles);
    %% Get info about current file
    fn = checkFiles(i).name;
    pathname = checkFiles(i).folder;
    %% Check if needed files are present
    % Erase a possible POSTFIX
    filename = erase(fn,'_CHECK');
    filename = erase(filename,'_SOL');
    % Create a string of the SOL and CHECK file
    solutionFile = replace(filename,'.m','_SOL.m');
    checkFile = replace(filename,'.m','_CHECK.m');
    % Check files exist
    pathSolutionFile = fullfile(pathname,solutionFile);
    pathCheckFile = fullfile(pathname,checkFile);
    pathEmptyFile = fullfile(pathname,filename);
    if exist(pathSolutionFile) ~= 2
        error(['DOES NOT EXIST: ' solutionFile]);
    end
    if exist(pathCheckFile) ~= 2
        error(['DOES NOT EXIST: ' checkFile]);
    end
    if exist(pathEmptyFile) ~= 2
        error(['DOES NOT EXIST: ' filename]);
    end
    
    %% Expect that CHECK file is a function that needs a SOLUTION file and STUDENTFILE
    addpath(genpath(pathname))
    % make a string with the check function name
    checkFunction = replace(checkFile,'.m','');
    % Evaluate function
    res = 0;
    try
        % run the empty file on the target CHECK function
        eval(['res = ' checkFunction '(pathEmptyFile);'])
        if round(res,1) ~= 0
            res
            error('The Check function should return a result of zero');
        end
        % run the SOLUTION file on the target CHECK function
        eval(['res = ' checkFunction '(pathSolutionFile);'])
        if round(res,1) ~= 1
            res
            error('The Check function should return a result of one');
        end
        disp([extractAfter(pathCheckFile,'week') ': works correctly']);
    catch errMess
        disp('something went wrong with this file');
        disp(errMess);
        edit(pathCheckFile);
        edit(pathSolutionFile);
        edit(pathEmptyFile);
        return
    end
    rmpath(genpath(pathname))
end
cd(currPath)