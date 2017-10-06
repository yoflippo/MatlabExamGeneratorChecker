clc;
close all;
close all hidden
clear variables;
clear all
addpath(genpath('helpercode'));
DEBUGOUTPUT = 1;
Constants
debugOutput(DEBUGOUTPUT,'Check for the existence of needed supporting scripts/function files');
for i = 1:length(LISTWITHNEEDEDFOLDERS)
    try
        cd(LISTWITHNEEDEDFOLDERS{i});
        cd ..
        if bullshit == 3
           lala = txt;
        end
    catch
        error(['PLEASE ADJUST YOUR CURRENT LOCATION (Current Folder)' ...
            'The folder: ' LISTWITHNEEDEDFOLDERS{i} ' was not found']);
    end
end
BASEFOLDER = pwd;
