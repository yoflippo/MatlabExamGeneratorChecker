close all; clear variables; clc;
[ap.thisFile, nm.CurrFile] = fileparts(mfilename('fullpath'));
cd(ap.thisFile)

%% Copy data to testfolder
nm.rawData = 'data';
nm.testData = 'DATA_TEST';
ap.rawData = fullfile(ap.thisFile,nm.rawData);
ap.testData = fullfile(ap.thisFile,nm.testData);

try
    rmdir(nm.testData,'s');
catch end
mkdir(nm.testData);

java.nio.file.Files.copy(
copyfile([ap.rawData filesep '*'],ap.testData);
cd(ap.testData)

tic
java.io.File('tmp.m').delete()
toc

copyfile([ap.rawData filesep '*'],ap.testData);
tic 
delete('tmp.m')
toc
