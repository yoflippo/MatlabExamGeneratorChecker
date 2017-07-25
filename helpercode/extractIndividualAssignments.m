function [outVar] = extractIndividualAssignments(folderWithAssignments)
%EXTRACTINDIVIDUALASSIGNMENTS extract individual assignments
%
% ------------------------------------------------------------------------
%    Copyright (C) 2017  M. Schrauwen (mjschrau@hhs.nl)
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
% BY: 2017  M. Schrauwen (mjschrau@hhs.nl)
% 
% 
% USE:
%
% 
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 20xx-xx-xx $
%<Description>

%% Get all different scripts
% Create a cell with the length of the number of found scripts

%% Read the content of a script
content = dir(folderWithAssignments);
if length(content) <= 2
    error('Err:emptyFolder','Empty folder');
end
