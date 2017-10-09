%RunAllAfrondenOpdrachtFiles
%
% ------------------------------------------------------------------------
%    Copyright (C) 2017  M. Schrauwen (markschrauwen@gmail.com)
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.
% ------------------------------------------------------------------------
% 
% DESCRIPTION:
%               This script is used to execute all AfrondenOpdracht m-files
%               After running the script a folder is created with all files
%               that are zipped with AfrondenOpdracht m-file.
%
% 
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
% 
% EXAMPLES:
%
%

% $Revisi0n: 0.0.0 $  $Date: 2017-07-30 $
% Creation
InitAll
disp(['First unzip all files in folder ' STUDENTASSFOLDER])

%% unzip the grand file with week assignments
cd(STUDENTASSFOLDER);
removeShitFromDir([NAMEZIPPEDWEEK num2str(YEAR) '_' WEEKNAME])
unzip([NAMEZIPPEDWEEK num2str(YEAR) '_' WEEKNAME '.zip'])

%% unzip every file
cd(WEEKNAME)
zfiles = dir('**/*.zip');
for i = 1:length(zfiles)
    unzip(zfiles(i).name);
    delete(zfiles(i).name);
end
cd ..

%% find .m files with right name and run the scripts
mfiles = dir('**/*.m')
foundFiles = [];
for i = 1:length(mfiles)
    tmp = strfind(mfiles(i).name,'AfrondenWeekOpdracht.m');
    if ~isempty(tmp)
        % zip the answer files of the students
        run(fullfile(mfiles(i).folder,mfiles(i).name)); 
    end
end
cd ..

%% Remove (if necessary) and create a folder for the submitted student assignments
wkFolder = fullfile('..','..',STUDENTSUBFOLDER,WEEKNAME);
removeShitFromDir(wkFolder) 
currPath = pwd;
%% Extract the zipped files and 
cd .. ; cd(STUDENTSUBFOLDER);
mkdir(WEEKNAME);
cd(currPath);
cd(WEEKNAME)
zfiles = dir('**/*.zip');
for i = 1:length(zfiles)%
    movefile(zfiles(i).name,[wkFolder filesep]);
end
removeShitFromDir(pwd)
cd(BASEFOLDER)
