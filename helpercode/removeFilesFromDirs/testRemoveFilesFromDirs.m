% TESTREMOVEFILESFROMDIRS
%
% ------------------------------------------------------------------------
%    Copyright (C) 2018  M. Schrauwen (markschrauwen@gmail.com)
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
% BY: 2018  M. Schrauwen (markschrauwen@gmail.com)
%
%
% EXAMPLES:
%
%

% $Revisi0n: 0.0.0 $  $Date: 2018-12-07 $
% Creation of script.

close all; clear all; clc;
[ap.thisFile, nm.CurrFile] = fileparts(mfilename('fullpath'));
cd(ap.thisFile)

nm.rawData = 'DATA_RAW';
nm.testData = 'DATA_TEST';
ap.rawData = fullfile(ap.thisFile,nm.rawData);
ap.testData = fullfile(ap.thisFile,nm.testData);
try
    rmdir(nm.testData,'s');
catch end

mkdir(nm.testData);
copyfile([nm.rawData filesep '*'],nm.testData);

%% Do some testing
try
    % TEST 1
    cellExt2Keep = {'.m' '.mlx' '.txt' '.csv'};
    removeFilesFromDirs(ap.testData,cellExt2Keep);
    cd(ap.testData);
    stcAllFile = dir(['**' filesep '*']);
    stcFilesToKeep = stcAllFile(~[stcAllFile.isdir]);
    stcFilesToKeep = stcFilesToKeep(~contains({stcFilesToKeep.name}',cellExt2Keep));
    if ~isempty(stcFilesToKeep)
        error(['Test 1 of: ' mfilename ' Failed miserably']);
    end
    disp(['Test 1 of: ' mfilename ' succeeded']);
    cd(ap.thisFile);
    
    % TEST 2
    nm.Empty = 'empty';
    mkdir(nm.Empty);
    ap.Empty = fullfile(ap.thisFile,nm.Empty);
    
    cellExt2Keep = {'.m' '.mlx' '.txt' '.csv'};
    removeFilesFromDirs(ap.Empty,cellExt2Keep);
    cd(ap.Empty );
    stcAllFile = dir(['**' filesep '*']);
    stcFilesToKeep = stcAllFile(~[stcAllFile.isdir]);
    stcFilesToKeep = stcFilesToKeep(~contains({stcFilesToKeep.name}',cellExt2Keep));
    if ~isempty(stcFilesToKeep)
        error(['Test 2 of: ' mfilename ' Failed miserably']);
    end
    disp(['Test 2 of: ' mfilename ' succeeded']);
    cd(ap.thisFile);
    rmdir(ap.Empty,'s');
catch err
    txterror = ['' newline];
    txterror = [txterror '' newline];
    error([newline mfilename ': ' newline err.message newline txterror]);
    cd(ap.thisFile);
    rmdir(nm.testData,'s');
end
cd(ap.thisFile);
rmdir(ap.testData,'s');

