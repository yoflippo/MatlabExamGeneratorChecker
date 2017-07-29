
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

DEBUGOUTPUT = 1;
WEEK = 1; % make zero to delete base folder
YEAR = 2017;
listWithNeededFolder = {'helpercode' 'clean_source_assignments' 'studentnumbers' ...
    'clean_source_headers' };
nameAssignmentFolder = 'unique_assignments';
studentAssDir = 'student_week_assignments';
ext = '.m';
SOLPOSTFIX = '_SOL';