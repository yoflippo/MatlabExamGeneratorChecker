clc; clear all; close all;
%% Expect a file called 'data.txt' in close proximity, get abs. path
pathThisFile = fileparts(mfilename('fullpath'));
absPathData = fullfile(pathThisFile,'data.txt');
absPathDataCopy = fullfile(pathThisFile,'datacopy.txt');

% fileID = fopen(absPathDataCopy,'r');
% formatSpec = '%s%[\n]';
% A = fscanf(fileID,formatSpec)
% fclose(fileID);

fileID = fopen(absPathDataCopy,'r');
c = 1;

tline{c} = fgetl(fileID);
while ischar(tline{c})
    disp(tline{c} )
    c = c + 1;
    tline{c} = fgets(fileID);
end
fclose(fileID);