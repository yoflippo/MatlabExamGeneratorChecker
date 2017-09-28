clc
%% Expect a file called 'data.txt' in close proximity, get abs. path
pathThisFile = fileparts(mfilename('fullpath'));
absPathData = fullfile(pathThisFile,'data.txt');
absPathDataCopy = fullfile(pathThisFile,'datacopy.txt');

%% TEST: read some linenumber
copyfile(absPathData,absPathDataCopy);
fclose('all'); pause(0.1);
txt = 'DIT IS EEN TEST';
WriteLineOfFile(absPathDataCopy,3,txt);
line = ReadLineOfFile(absPathDataCopy,3);
assert(isequal(line,string(txt)));
delete(absPathDataCopy);

%% TEST: read some linenumber
copyfile(absPathData,absPathDataCopy);
fclose('all'); pause(0.1);
lnmbr = 5;
txt = 'DIT IS E*&^%$#^%$#%$#&^%$*&^%$@@@@SDGFJdtjmdfgjksrtnsEN TEST';
WriteLineOfFile(absPathDataCopy,lnmbr,txt);
line = ReadLineOfFile(absPathDataCopy,lnmbr);
assert(isequal(line,string(txt)));
delete(absPathDataCopy);

%% TEST: read some BIG linenumber
copyfile(absPathData,absPathDataCopy);
fclose('all'); pause(0.1);
lnmbr = 50;
txt = 'DIT IS E*&^%$#^%$#%$#&^%$*&^%$@@@@SDGFJdtjmdfgjksrtnsEN TEST';
WriteLineOfFile(absPathDataCopy,lnmbr,txt);
line = ReadLineOfFile(absPathDataCopy,lnmbr);
assert(isequal(line,string(txt)));
% delete(absPathDataCopy);
'correct'
