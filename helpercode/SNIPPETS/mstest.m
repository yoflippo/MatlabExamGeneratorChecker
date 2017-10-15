close all; clear all; clc;
ap.ThisFile = fileparts(mfilename('fullpath'));
cd(ap.ThisFile);
nm.ThisFile = mfilename;
nm.Zip = replace(nm.ThisFile,'_test','_data.zip')
nm.TestData = 'testData';
unzip(nm.Zip,nm.TestData);

%% Do some testing
try
    
    
catch
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