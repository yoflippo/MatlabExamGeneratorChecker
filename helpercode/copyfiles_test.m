addpath(genpath(pwd));
basedir = 'copyfiles_directory';
nameSubDir = 'newdir';
baseSubDir = [basedir filesep nameSubDir];
copyfiles(basedir,baseSubDir);

% check existence of certain file
cd(basedir)
cd('week1\deelopdracht_1\vraag_1\')
if exist('vraag_1_versie_1_ANT','file') ~= 2
    error('test 1 failed');
end
% delete folders
cd('..');
cd('..');
cd('..');
rmdir(nameSubDir,'s');
cd('..');