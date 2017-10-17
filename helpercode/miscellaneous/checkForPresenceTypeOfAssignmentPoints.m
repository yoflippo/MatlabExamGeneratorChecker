function blPresent = checkForPresenceTypeOfAssignmentPoints()
%CHECKFORPRESENCETYPEOFASSIGNMENTPOINTS Check if the AssignmentType 
% file and points.m is present in the current folder.
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

% RETURN:       
%               blPresent: true if TypeofAssignment file and points.m is
%                          present.

% $Revision: 0.0.0 $  $Date: 2017-10-17 $
% Creation of this function.

blPresent = false;
if ~isempty(dirmf('TypeOfAssignment')) && ~isempty(dirmf('points'))
    blPresent = true;
end
