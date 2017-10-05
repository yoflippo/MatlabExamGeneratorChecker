clear all; close all; clc;
% Make current path, path of this file
apThisFile = fileparts(mfilename('fullpath'));
cd(apThisFile);

% Copy example
nmFileSrc = 'example.m';
nmFileDes = 'copy.m';
copyfile(nmFileSrc,nmFileDes);

apDes = fullfile(apThisFile,nmFileDes);
decommentFile(apDes);
removeCommentsAndEmptyLines(apDes);
open(apDes)

% Delete copy of example
delete(fullfile(apThisFile,nmFileDes));