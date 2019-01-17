function [outVar] = emptyCurrentFolder()
% ARCpath Add/Remove Current path and empty the current folder
%
% ------------------------------------------------------------------------
%    Copyright (C) 2019  M. Schrauwen (markschrauwen@gmail.com)
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
% BY: 2019  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               varargin:   <text>
%               varargin:   <text>
%
% RETURN:
%               outvar:     <text>
%               outvar:     <text>
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2019-01-17 $
% Creation of this function.
oldPath = pwd;
if input('Are you 100% sure this is the right folder, because everything will be deleted!!   YES = 1 / No = else:  ')
    addpath(genpath(pwd));
    rmpath(genpath(pwd));
    warning off
    delete('*.*')
    cd ..
    rmdir(oldPath,'s')
    mkdir(oldPath)
    warning on
end
end %function
