function odir = dirmf(varargin)
%DIRMF The Matlab dir function specially for m-files. Please note that 
% This function gets the m-files from the current dir (pwd).
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
%               none.
%
% RETURN:       
%               odir:   All m-files of current directory.
% 
% EXAMPLES:
%               dirmf() -> get all mfiles in current path and subfolder.
%               dirmf('CHECK') -> get all mfiles with 'CHECK' in name.

% $Revision: 0.0.0 $  $Date: 2017-10-09 $
% Creation of this function.

odir = [];

%% Parse varargin
% Test for right input
minargin = 0;
maxargin = minargin+1;
if nargin < minargin
    error([ mfilename ':Needs at minimum' num2str(minargin) ' argument(s) ']);
end
if nargin > maxargin
    error([ mfilename ':Needs max ' num2str(minargin) ' arguments ']);
end

if isequal(nargin,0) %default behavior
    odir = dir(['**' filesep '*.m']);
else
    odir = dir(['**' filesep '*' varargin{1} '*']);
end

end
