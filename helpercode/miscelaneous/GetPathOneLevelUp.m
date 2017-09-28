function [mydir nextSubDir] = GetPathOneLevelUp(varargin)
%GETPATHONELEVELUP a function that shortens a path/directory
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
%               parameter1:   a path e.g. 'c:\temp\bestanden\'
%               parameter2:   the number of levels up, default = 1
%
% RETURN:
%               LevelUpPath:     the path one leve up: 'c:temp\
%               nameOfSubDirDown: the name of the previously deepest
%                                   subdirectory
%
%
% EXAMPLE 1    [a b] = GetPathOneLevelUp('c:\a\b\c\d\name.file')
%               a =
%                   'c:\a\b\c\d'
%               b =
%                   'name.file'
%
% EXAMPLE 2    [a b] = GetPathOneLevelUp('c:\a\b\c\d\name.file',2)
%               a =
%                   'c:\a\b\c'
%               b =
%                   'd'


% $Revision: 0.0.0 $  $Date: 2017-07-29 $
% Creation
if length(varargin) > 1
    num = varargin{2};
else
    num = 1;
end
mydir  = varargin{1};

for i = 1:num
    dirs   = strfind(mydir,filesep);
    % save the removed sublevel
    nextSubDir = mydir(dirs(end)+1:end);
    % one level up
    mydir = mydir(1:dirs(end)-1);
end

end
