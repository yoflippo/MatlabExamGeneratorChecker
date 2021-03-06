function filename = GetFileNameFromPath(path)
%GETFILENAMEFROMPATH extract a filename from a path
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
%               DELETE THIS FILE AS FILEPARTS IS A BETTER OPTION
%
% 
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
% 
% PARAMETERS:
%               Path:   a path with a filename
%
% RETURN:       
%               filename: string with filename
% 
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-09-03 $
% Creation of the function

fileseps = strfind(path,filesep);
filename = path(fileseps(end)+1:end);

if isempty(strfind(filename,'.'))
    error('GetFileNameFromPath: path does not contain file')
end
end
