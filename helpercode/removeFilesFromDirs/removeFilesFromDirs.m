function [filesRemoved] = removeFilesFromDirs(apDir,cellExt2Keep)
% REMOVEFILESFROMDIRS This function deletes certain file extensions from a
% directory and returns which files are removed.
%
% ------------------------------------------------------------------------
%    Copyright (C) 2018  M. Schrauwen (markschrauwen@gmail.com)
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
%
%
% BY: 2018  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               apDir:      absolute path of directory from which certain
%                           files have to be kept (other filetypes will be removed
%               cellExt2Keep:   a cell with chararrays with extensions of
%                               files that have to be kept.
%
% RETURN:
%               filesRemoved: a cell variable with which files are removed.
%
% EXAMPLES:
%               cellExt2Keep = {'.m' '.mlx' '.txt' '.csv'};
%               removeFilesFromDirs(ap.testData,cellExt2Keep);
%

% $Revision: 0.0.0 $  $Date: 2018-12-07 $
% Creation of this function.


%% Find all files in the given directory
stcAllFile = dir([apDir filesep '**']);

try
    %% Remove files and folders that need to be saved from struct
    stcFilesToKeep = stcAllFile(~[stcAllFile.isdir]);
    stcFilesToKeep = stcFilesToKeep(~contains({stcFilesToKeep.name}',cellExt2Keep));
    
    %% Delete remaining file types based on stcAllFile
    filesRemoved = fullfile({stcFilesToKeep.folder}',{stcFilesToKeep.name}');
    for nF = 1:length(filesRemoved)
        delete(filesRemoved{nF})
    end
catch
end

end %function
