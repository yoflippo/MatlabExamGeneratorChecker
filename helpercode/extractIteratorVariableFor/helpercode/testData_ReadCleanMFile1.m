
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

clc;
close all;
close all hidden
clear variables; 
clear all
addpath(genpath('helpercode'))
DEBUGOUTPUT = 1
% make zero to delete base folder
Constants

%% Check for the existence of needed supporting scripts/function files
debugOutput(DEBUGOUTPUT,'Check for the existence of needed supporting scripts/function files');
for i = 1:length(LISTWITHNEEDEDFOLDERS)
    try
        cd(LISTWITHNEEDEDFOLDERS{i});
        cd ..
        if bullshit == 3
           lala = txt
        end
    catch  %  TEST
        error(['PLEASE ADJUST YOUR CURRENT LOCATION (Current Folder)' ...
            'The folder: ' LISTWITHNEEDEDFOLDERS{i} ' was not found'])
    end
end
for i = 1:length(LISTWITHNEEDEDFOLDERS)
    try
        cd(LISTWITHNEEDEDFOLDERS{i});
        cd ..
        if bullshit == 3
           lala = txt
        end
    catch  %  TEST
        error(['PLEASE ADJUST YOUR CURRENT LOCATION (Current Folder)' ...
            'The folder: ' LISTWITHNEEDEDFOLDERS{i} ' was not found'])
    end
end
% The basefolder should only be assigned if previous code has executed
% correctly
BASEFOLDER = pwd; %TEST

