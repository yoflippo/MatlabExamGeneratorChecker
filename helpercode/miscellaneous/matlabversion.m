%MATLABVERSION a simple function to test if current version of Matlab
%suffices.
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
%               min_version:   minimum Matlab version e.g. 2004 or 2007
%
% RETURN:
%               outvar:     if this version of Matlab suffices, return a true.
%
% EXAMPLES:
%               matlabversion(2037) will give a false.
%               matlabversion(1900) will give a true.

% $Revision: 0.0.0 $  $Date: 2017-12-21 $
% Creation of this function.

function [ outvar ] = matlabversion( min_version )
ver = version('-release');
str = ver(regexp(ver,'[0-9]'));

try
    currver = str2num(str);
catch err
    error([newline mfilename ': ' newline err.message newline 'The date conversion does not work. Please check this function.']);
end

if ischar(min_version) || isstring(min_version)
    try
        minv = str2num(min_version)
    catch err
        error([newline mfilename ': ' newline err.message newline 'The date conversion of the given minimum version does not work. Please check this function.']);
    end
else
    minv = min_version;
end

outvar = (currver >= minv);
end

