clc
%% Expect a file called 'data.txt' in close proximity, get abs. path
pathThisFile = fileparts(mfilename('fullpath'));
absPathData = fullfile(pathThisFile,'data.txt')
%% Call function to read first line
line = ReadLastLineOfFile(absPathData);
assert(~isempty(line))

%% Test an random line number
expectedLine = 'data line 12 of file )(*&^groente%$#@';
line2 = ReadLastLineOfFile(absPathData);
assert(isequal(line2,string(expectedLine)))