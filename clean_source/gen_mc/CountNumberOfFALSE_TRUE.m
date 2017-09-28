clear all; close all; clc;

%% Get path of output folder and empty it
pathOfThisFile = erase(mfilename('fullpath'),mfilename);

weeks = {'week1' 'week2' 'week3' 'week4'};
for nWk = 1:length(weeks)
    try
        cd(fullfile(pathOfThisFile,weeks{nWk}));
        nFalse = length(dir('**\*FALSE*.m'));
        nTrue = length(dir('**\*TRUE*.m'));
        disp([weeks{nWk} ': TRUE = ' num2str(nTrue) ' | FALSE = ' num2str(nFalse)])
        cd(pathOfThisFile);
    catch
    end
end