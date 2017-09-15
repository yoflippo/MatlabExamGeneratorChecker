function removeShitFromDir(dirToRemove)
%REMOVESHITFROMDIR Only removes files in a directory structure.
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
%
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               dirToRemove:   The directory to delete
%
% RETURN:
%               nothing
%
% EXAMPLES:
%               removeShitFromDir('temp/');
%

% $Revision: 0.0.0 $  $Date: 2017-07-28 $
% Creation of script
try
    warning off
    rmpath(genpath(dirToRemove))
    fclose('all'); %close all files, because after copy Matlab does not release a file
    A = dir( dirToRemove );
    for k = 1:length(A)
        delete([ dirToRemove  filesep A(k).name]);
    end
%     rmdir(dirToRemove,'s');
    warning on
catch
end
end
