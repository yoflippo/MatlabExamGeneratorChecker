function CheckSolBase(fn,path)


%% Check if needed files are present
% Erase a possible POSTFIX
filename = erase(fn,'_CHECK');
filename = erase(filename,'_SOL');
% Create a string of the SOL and CHECK file
solutionFile = replace(filename,'.m','_SOL.m');
checkFile = replace(filename,'.m','_CHECK.m');
cheatFile = replace(filename,'.m','_CHEAT.m'); %%%%%
% Check files exist
pathSolutionFile = fullfile(path,solutionFile);
pathCheckFile = fullfile(path,checkFile);
pathEmptyFile = fullfile(path,filename);

%% Expect that CHECK file is a function that needs a SOLUTION file and STUDENTFILE
addpath(genpath(path))
% make a string with the check function name
checkFunction = replace(checkFile,'.m','');
% Evaluate function
res = 0;
try
    if exist(pathSolutionFile,'file') ~= 2
        error(['DOES NOT EXIST: ' solutionFile]);
    end
    if exist(pathCheckFile,'file') ~= 2
        error(['DOES NOT EXIST: ' checkFile]);
    end
    if exist(pathEmptyFile,'file') ~= 2
        error(['DOES NOT EXIST: ' filename]);
    end
    % run the empty file on the target CHECK function
    eval(['res = ' checkFunction '(pathEmptyFile);'])
    if round(res,1) ~= 0.0
        edit(pathEmptyFile);
        error(['The Check function should return a result of 0 but is: ' num2str(res)]);
    end
    % run the SOLUTION file on the target CHECK function
    eval(['res = ' checkFunction '(pathSolutionFile);'])
    if round(res,1) ~= 1.0
        edit(pathSolutionFile);
        error(['The Check function should return a result of 1 but is: ' num2str(res)]);
    end
    % run the CHEAT file on the target CHECK function
    cheatMax = 0.2;
    if exist(cheatFile,'file')
        eval(['res = ' checkFunction '(pathCheatFile);'])
        if res > cheatMax
            error(['The CHEAT function should return a result of: ' num2str(cheatMax) ' but is: ' num2str(res)]);
        end
    end
    disp([filename ': works correctly']);
catch catchMessage
    edit(pathCheckFile);
    error([mfilename ', something went wrong: ' catchMessage.message]);
end
rmpath(genpath(path))

end%function