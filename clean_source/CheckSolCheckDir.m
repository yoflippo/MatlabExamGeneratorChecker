clear variables; clc;
currPath = pwd;

%% This file checks the SOL/CHECK/empty files in the current folder.
checkFiles = dirmf('_SOL.m');
for i = 1:length(checkFiles)
    %% Get info about current file
    fn = checkFiles(i).name;
    pathname = checkFiles(i).folder;
    try
        tic; CheckSolBase(fn,pathname); toc
        deleteTemporaryFiles();
    catch  err          
        error([mfilename ': ' err.message newline ]);
    end
end

cd(currPath)