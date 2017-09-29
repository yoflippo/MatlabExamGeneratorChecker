function oGDF = GetDeepestFolders(location)
%GETDEEPESTFOLDERS This function needs this line to be present before calling 
%this function: "global output;".
%
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
%               location:   abspath of directory
%
% RETURN:
%               output:     The deepest folder of the directory. All leaves
%                           of the directory tree.
%
% EXAMPLES:
%               blCheck = GetDeepestFolders('level1');
%

% $Revision: 0.0.0 $  $Date: 2017-07-26 $
% Creation
global oGDF;
global base;
if isempty(base) || base == 0
    oGDF = [];
    base = 1;
else
    base = base + 1;
end

currPath = pwd;
cd(location);

% find the folders
dirResult = dir;
%find directories
% global oGDF
% oGDF = []; %create variable
%make variable accesable in every function call

blHasDir = false;
for i = 3:length(dirResult) %skip the first two . .. directories
    if dirResult(i).isdir %check if directory
        blHasDir = true;
% %         dirResult(i).name %for test purporses
        GetDeepestFolders(dirResult(i).name);
    end
end
if ~blHasDir
    oGDF{length(oGDF)+1} = pwd;
end
% Go back to upper folder
cd(currPath);
base = base -1;

end
