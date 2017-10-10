clear all; close all; clc;

%% Copy the test data
ap.ThisFile = fileparts(mfilename('fullpath'));
ap.TestData = fullfile(ap.ThisFile,'testdata');
ap.CopyTestData = fullfile(ap.ThisFile,'copyTestData');
copyfiles(ap.TestData,ap.CopyTestData);

cd(ap.CopyTestData);
mfiles = dirmf('_SOL');
cd(ap.ThisFile);
%info: https://blogs.mathworks.com/loren/2012/10/18/learning-to-love-regular-expressions/
%info: https://nl.mathworks.com/help/matlab/ref/regexp.html
%info: https://nl.mathworks.com/help/matlab/ref/regexprep.html

for nF = 1:1%length(mfiles)
    currFile = fullfile(mfiles(nF).folder,mfiles(nF).name);
    txt = readTxtFile(currFile);
    
    %% find the words in a file   
    words = {'opdracht_' 'opdracht '};
    txtf = regexprep(txt,'(?i)opdracht[ _][0-9]*','Opdracht_X')
    
end




%% Clean up
removeShitFromDir(ap.CopyTestData);
rmdir(ap.CopyTestData);