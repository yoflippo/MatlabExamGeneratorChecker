clc
%% Expect a file called 'data.txt' in close proximity, get abs. path
pathThisFile = erase(mfilename('fullpath'),mfilename);
absPathData = fullfile(pathThisFile,'data.txt')
%% Call function to read first line
line = ReadLineOfFile(absPathData);

line2 = ReadLineOfFile(fullfile(pathThisFile,'ChangeLineOfFile.m'),1);
line
line2
