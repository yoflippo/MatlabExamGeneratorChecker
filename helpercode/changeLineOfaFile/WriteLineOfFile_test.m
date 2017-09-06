clc
%% Expect a file called 'data.txt' in close proximity, get abs. path
pathThisFile = erase(mfilename('fullpath'),mfilename);
absPathData = fullfile(pathThisFile,'data.txt');
absPathDataCopy = fullfile(pathThisFile,'datacopy.txt');
%% Make a copy
copyfile(absPathData,absPathDataCopy);
fclose('all');
WriteLineOfFile(absPathDataCopy,3,'DIT IS EEN TEST');
delete(absPathDataCopy);
%% Make a copy
copyfile(absPathData,absPathDataCopy);
fclose('all');
WriteLineOfFile(absPathDataCopy,5,'DIT IS EEN TEST DIT IS EEN TEST DIT IS EEN TEST');
delete(absPathDataCopy);
%% Make a copy
copyfile(absPathData,absPathDataCopy);
fclose('all');
WriteLineOfFile(absPathDataCopy,50,'DIT IS EEN TEST DIT IS EE6666N TEST DIT IS EEN TEST');
delete(absPathDataCopy);