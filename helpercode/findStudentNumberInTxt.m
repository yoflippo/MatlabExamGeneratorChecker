function [foundstudentnum, s, e] = findStudentNumberInTxt( txt )
%FINDSTUDENTNUMBERINTXT Pretty self-explanatory don't you think?
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
%               txt:   input txt
%
% RETURN:       
%               The studentnumber in string format.
% 
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-11-23 $
% Creation of this function.

[s e] = regexp(txt,'\D([0-9]){8}\D');
foundstudentnum = txt(s+1:e-1);
if isempty(foundstudentnum)
    error([mfilename ': No studentnumber found!']);
end

end