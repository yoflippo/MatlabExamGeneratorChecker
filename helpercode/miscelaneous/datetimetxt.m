function [ds] = datetimetxt(varargin)
%DATETIMESTRING Get the current date and time in string form.
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
%               none
%
% RETURN:       
%               ds:     a string with the date and time.
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-10-09 $
% Creation of function.

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

% Create variables that need to be filled
blOnlyDate = false;
if nargin == 1
    blOnlyDate = true;
end


ds = char(datetime('now'));
ds = strrep(ds,':','_');
if blOnlyDate
    ds = extractBefore(ds,' ')
end
ds = strrep(ds,' ','_');
ds = strrep(ds,'-','_');
end

