clear all; close all; clc;
% Make current path, path of this file
apThisFile = fileparts(mfilename('fullpath'));
cd(apThisFile);

% Copy example
nmFileSrc = 'example.m';
nmFileDes = 'copy.m';
copyfile(nmFileSrc,nmFileDes);
fclose('all');
apCopy = fullfile(apThisFile,nmFileDes);
nospaces(apCopy);


open(apCopy);
run(apCopy);

% Delete copy of example
delete(apCopy);
