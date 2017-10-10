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

for nF = 1:length(mfiles)
    currFile = fullfile(mfiles(nF).folder,mfiles(nF).name);
    txt = readTxtFile(currFile);
    txtFin = txt;
    %% find the words in a file
    words = {'Opdracht' 'Vraag'};
    for nW = 1:length(words)
        txtFin = regexprep(txtFin,['(?i)' words{nW} '[_][0-9]+'], [words{nW} '_X']);
        txtFin = regexprep(txtFin,['(?i)' words{nW} '[ ][0-9]+'], [words{nW} ' X']);
    end
    txtFin
end




%% Clean up
removeShitFromDir(ap.CopyTestData);
rmdir(ap.CopyTestData);