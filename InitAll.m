
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
clc; close all; close all hidden;  clear variables;
addpath(genpath(pwd));
DEBUGOUTPUT = 1;
% make zero to delete base folder
WEEK = 1; 
WEEKNAME = ['week' num2str(WEEK)];
 % important determines the unique hashcode
YEAR = 2017;
LISTWITHNEEDEDFOLDERS = {'helpercode' 'clean_source_assignments' 'studentnumbers' ...
                        'clean_source_headers' };
STUDENTNUMBERMAT = 'studentNumbers.mat';
NAMEASSIGNMENTFOLDER = 'unique_assignments';
STUDENTASSFOLDER = 'student_week_assignments';
STUDENTSUBFOLDER = 'student_submitted_assignments';
NAMEZIPPEDWEEK = 'Biostatica_Programmeren_StudentOpdrachten_';
BACKUPFOLDER = 'bu';
EXT = '.m';
SOLPOSTFIX = '_SOL';
CHECKPOSTFIX = '_CHECK';
OTHERFILESINSTUDENTFOLDER = {'AfrondenWeekOpdracht.m' 'studentnummer.m'};
ADJUSTEDHASH = 'AANGEPASTE_MFILE_GEEN_PUNTEN';
NAMEZIPMFILEFORSTUDENTS = 'AfrondenWeekOpdracht.m';
NAMERESULTMAT = 'resultatenWeek';
% Oooh Noo... some code in a file called Constants... shame on you author

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
% The basefolder should only be assigned if previous code has executed
% correctly
BASEFOLDER = pwd;