clear variables; clc;
currPath = pwd;

%% This file checks the SOL/CHECK/empty files in the current folder.
typeOfAssFiles = dirmf('Make');

tic
for i = 1:length(typeOfAssFiles)
    %% Get info about current file
    pathname = typeOfAssFiles(i).folder;
    cd(pathname)
    checkFiles = dirmf('_SOL');
    for j = 1:length(checkFiles)
        try
            fn = checkFiles(j).name;
            pathname = checkFiles(j).folder;
            CheckSolBase(fn,pathname); 
            deleteTemporaryFiles();
        catch  err
            error([mfilename ': ' err.message newline ]);
        end

    end
end
toc
cd(currPath)
%% 