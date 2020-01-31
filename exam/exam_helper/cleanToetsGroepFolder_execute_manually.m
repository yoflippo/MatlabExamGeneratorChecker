% CLEANTOETSGROEPFOLDER_EXECUTE_MANUALLY 
% BY: 2020  M. Schrauwen (markschrauwen@gmail.com)

% $Revision: 0.0.0 $  $Date: 2020-01-31 $
% Creation of this function.
% 
% Use this script to cleanout the junk you get from the 'Toetsgroepen'.
% Select the directory with the unzipped folders from the 'Toetsgroepen'
% 
% This script checks if a student filled in his/hers studentnumber. If not
% the directory is removed. Without a studentnumber we can not check the
% work of a student.
%
% Whatever folders remain should be checked by hand!!!

close all; clearvars; clc;
ap = uigetdir(pwd,'Go to folder with Unzipped Toetsgroep folders');
cd(ap)

%% Remove dirs, which can certainly be removed
cd(ap)
dirs = dir;
dirs(1:2) = [];
dirs(contains({dirs.name},'logs')) = [];

for nd = dirs'
    if not(checkIfStudentNumberPresent(ap,nd.name))
        rmdir(fullfile(nd.folder,nd.name),'s')
    end
    removeFoldersProfileDocuments(ap,nd.name)
end

%% select zips and move them to a final location
cd(ap)
zips = dir(['**' filesep 'AfgerondTentamenBiostatica_*']);
apzips = fullfile(ap,'zips');
mkdir(apzips)
sepfolder = ['TG202001' filesep];
for nz = 1:length(zips)
    currLoc = zips(nz).folder;
    currZip = fullfile(currLoc,zips(nz).name);
    movefile(currZip,apzips);
    %% find student dir and remove it
    locsubfol = extractAfter(currLoc,sepfolder);
    betweenfol = extractBefore(locsubfol,filesep);
    ap = fullfile(extractBefore(currLoc,betweenfol),betweenfol);
    rmdir(ap,'s');
end

function removeFoldersProfileDocuments(ap,name)
try
    rmdir(fullfile(ap,name,'Mijn Documenten'),'s')
catch
end
try
    rmdir(fullfile(ap,name,'Profile'),'s')
catch
end
oldpath = pwd;
cd(fullfile(ap,name));
dirs = dir(['**' filesep '*Afgerond*']);
cd(oldpath)
dirs(not([dirs.isdir])) = [];

if not(isempty(dirs))
    for n = 1:length(dirs)
        rmdir(fullfile(dirs.folder,dirs.name),'s')
    end
end
end

function present = checkIfStudentNumberPresent(ap,name)
present = 0;
oldpath=pwd;
try
    cd(fullfile(ap,name))
catch
    cd(oldpath);
    return
end
present = not(isempty(dir(['**' filesep '*studentnummer.m'])));
cd(oldpath);
end