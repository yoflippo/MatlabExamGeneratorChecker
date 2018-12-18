clear variables; clc;

%% To prevent manual actions
matFile = 'file.mat';
if ~askuser('Use last file?',true) || ~exist(matFile,'file')
    [fn, pathname, filterindex] = uigetfile('*.m', 'Pick a file');
    tmpLocation = fullfile(pathname,fn);
    save(matFile,'tmpLocation','fn','pathname','filterindex');
else
    load(matFile);
end
CheckSolBase(fn,pathname);