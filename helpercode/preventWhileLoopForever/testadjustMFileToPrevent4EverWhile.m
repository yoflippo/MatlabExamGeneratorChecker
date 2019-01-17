close all; clear variables; clc;
[ap.thisFile, nm.CurrFile] = fileparts(mfilename('fullpath'));
cd(ap.thisFile)

%% Copy data to testfolder
nm.rawData = 'codeExamples';
nm.testData = 'test';
ap.rawData = fullfile(ap.thisFile,nm.rawData);
ap.testData = fullfile(ap.thisFile,nm.testData);

try
    rmdir(nm.testData,'s');
catch end
mkdir(nm.testData);

copyfile([nm.rawData filesep '*'],nm.testData);

files = dir(ap.testData);
files = files(~[files.isdir]);
files = files(contains({files.name},'.m'));

%% Do some testing
for n = 1:length(files)
    currfile = fullfile(files(n).folder,files(n).name);
    adjustMFileToPrevent4EverWhile(currfile);
    run(currfile)
    n
end

disp('WORKING!')

cd(ap.thisFile);
rmdir(ap.testData,'s');