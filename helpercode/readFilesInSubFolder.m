function output = readFilesInFolder(folder, ext)
%READFILESINFOLDER
% This script reads the files in the SUBFOLDER of a folder.
% It returns a cell variable in which the different files presented
% relative to the 'folder' parameter
%
% EXAMPLE USE:
%   files = readFilesInFolder(basedir,'.m');
%
% EXAMPLE OUTPUT:
%   'copyfiles_directory\week1\deelopdracht_1\vraag_1\vraag_1_versie_1_ANT.m'

%% Find all subdirectories -- ## nothing to do with this funciton
all_rel_subdirectories = strsplit(genpath(folder),';');
all_rel_files = {}; filesCnt = 1;
for i = 1:length(all_rel_subdirectories)
    dirout = dir(all_rel_subdirectories{i});
    % find relevant files
    if length(dirout) > 2
        dirout(1:2) = []; % remove empty folder '.', '..'
        for j = 1:length(dirout)
            if ~dirout(j).isdir
                [pathstr,name,ext_local] = fileparts(dirout(j).name);
                if isequal(ext_local,ext)
                    all_rel_files{filesCnt} = [all_rel_subdirectories{i} filesep dirout(j).name];
                    filesCnt = filesCnt +1;
                end
            end
        end
    end
end
output = all_rel_files;
