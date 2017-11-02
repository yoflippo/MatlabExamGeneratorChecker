clear all; close all; clc;

%% Copy the test data
nm.ThisFile = mfilename;
nm.Base = replace(nm.ThisFile,'_test','');
ap.ThisFile = fileparts(mfilename('fullpath'));
ap.TestData = fullfile(ap.ThisFile,'testdata');
ap.CopyTestData = fullfile(ap.ThisFile,'copyTestData');
ap.TestDataBase = fullfile(ap.TestData,replace(mfilename,'_test',''));

%% Copy Testfiles
copyfiles(ap.TestData,ap.CopyTestData);

cd(ap.CopyTestData);
mfiles = dirmf('data');
cd(ap.ThisFile);
%info: https://blogs.mathworks.com/loren/2012/10/18/learning-to-love-regular-expressions/
%info: https://nl.mathworks.com/help/matlab/ref/regexp.html
%info: https://nl.mathworks.com/help/matlab/ref/regexprep.html

for nTD = 1:length(mfiles)
    apCurrMFile = fullfile(ap.CopyTestData ,[nm.Base '_data' num2str(nTD) '.m']);
    replaceVraagOpdracht(apCurrMFile,666);
    open(apCurrMFile);   
end

%% Clean up
removeShitFromDir(ap.CopyTestData);
rmdir(ap.CopyTestData);