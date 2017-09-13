close all; clear all; clc;

%% EXPECT ERRORS
% try
%     readAndFindTextInFiles('EXT','.m');
%     assert(false,'should give an error');
% catch
%     assert(true,'should give an error');
% end




%% EXPECT CORRECT BEHAVIOR
pathOfThisFile = erase(mfilename('fullpath'),mfilename);
source = fullfile(pathOfThisFile,'templateData');
des = fullfile(pathOfThisFile,'vraag_1');
removeShitFromDir(des);
copyfiles(source,des)

% test a file in the testdata folder
r = readAndFindAndReplaceTextInFiles('replace','EMPTY','sS','empty','abspath',des,'ext','.m');
assert(~isempty(r),'1 should give a result')
