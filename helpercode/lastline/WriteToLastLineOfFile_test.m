clc
%% Expect a file called 'data.txt' in close proximity, get abs. path
pathThisFile = fileparts(mfilename('fullpath'));
absPathData = fullfile(pathThisFile,'data.txt');
absPathDataCopy = fullfile(pathThisFile,'datacopy.txt');

%% TEST: read some BIG linenumber
copyfile(absPathData,absPathDataCopy);
fclose('all'); pause(0.1);
txt = 'DIT IS E*&^%$#^%$#%$#&^%$*&^%$@@@@SDGFJdtjmdfgjksrtnsEN TEST';
WriteToLastLineOfFile(absPathDataCopy,txt);
line = ReadLastLineOfFile(absPathDataCopy);
assert(isequal(line,string(txt)));


%% TEST: write multiple lines
copyfile(absPathData,absPathDataCopy);
fclose('all'); pause(0.1);
txt = 'DIT IS E*&^%$#^%$#%$#&^%$*&^%$@@@@SDGFJdtjmdfgjksrtnsEN TEST';
txtCell{1} = txt;
txtCell{2} = txt;
WriteToLastLineOfFile(absPathDataCopy,txtCell);
% delete(absPathDataCopy);
'correct'
