
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
clc; close all; close all hidden;
fclose('all');
addpath(genpath('helpercode'));
DEBUGOUTPUT = 1;
% make zero to delete base folder
Constants

%% Check for the existence of needed supporting scripts/function files
debugOutput(DEBUGOUTPUT,'Check for the existence of needed supporting scripts/function files');
for i = 1:length(LISTWITHNEEDEDFOLDERS)
    try
        cd(LISTWITHNEEDEDFOLDERS{i});
        cd ..
    catch
        error(['PLEASE ADJUST YOUR CURRENT LOCATION (Current Folder)' ...
            'The folder: ' LISTWITHNEEDEDFOLDERS{i} ' was not found']);
    end
end
% The basefolder of the whole Matlab biostatica code. InitAll should be in
% the root of this folder.
BASEFOLDER = GetPathOneLevelUp(fileparts(mfilename('fullpath')));