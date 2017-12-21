%UNZIP_ALL a function to unzip all files in a certain path. This the sister
%funciton of ZIP_ALL. This function depends on dirmf().
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
%               apFiles:    absolute path of the files the directory that
%                           contains zip-files that need to be unzipped.
%               apDest:     absolute path in which the files need to be
%                           present
%
% RETURN:
%               outvar:     none
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-12-21 $
% Creation of file


function  unzip_all( apFiles,apDest )

currPath = pwd;
try
    cd(apFiles)
catch
    cd(currPath);
    error([newline mfilename ': ' newline 'apFiles is not accessible.']);
end

try
    cd(apDest)
catch
    cd(currPath);
    error([newline mfilename ': ' newline 'apDest is not accessible.']);
end

if matlabversion(2016)
    % Copy zip-files to destination
    cd(apFiles)
    zfiles = dir('*.zip');
    
    for n = 1:length(zfiles)
        currFile = replace(zfiles(n).name,'.zip','');
        unzip(currFile,fullfile(apDest,currFile));
    end
else
    error([newline mfilename ': ' newline err.message 'This version of Matlab can use this function.']);
end
cd(currPath);
