close all; clear all; clc;
ap.ThisFile = fileparts(mfilename('fullpath'));
cd(ap.ThisFile);
nm.ThisFile = mfilename;
load('matlab.mat')

%% Do some testing
try
    [grade, grade_theses, grade_prog] = calculateGrade(con, strPoints, numTheses);
    
catch err
    error([mfilename ': ' err.Message]);
    %% Clean up
    cd(nm.TestData);
    rmpath(nm.TestData);
    ff = dir();
    fclose('all');
    for n = 3:length(ff)
        if ~ff(n).isdir
            apff = fullfile(ff(n).folder,ff(n).name);
            delete(apff);
        else
            rmdir(ff(n).folder);
        end
    end
end