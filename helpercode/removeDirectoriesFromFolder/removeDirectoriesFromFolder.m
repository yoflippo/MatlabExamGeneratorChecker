function removeDirectoriesFromFolder(absPathOfFolder)
%REMOVEDIRECTORIESFROMFOLDER remove all folders (not files) from a certain
%directory.
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
%
%
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               absPathOfFolder:   the absolute path of a folder from which
%               the subfolders (not the files) need to be removed.
%
% RETURN:
%               nothing
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-09-03 $
% Creation of the function

% Find all dirs
allShit = dir(absPathOfFolder);

for i = 3:length(allShit)
    if allShit(i).isdir
        dirToRemove = fullfile(allShit(i).folder,allShit(i).name);
        rmpath(genpath(dirToRemove));
        rmdir(dirToRemove,'s');
    end
end

end
