%CHECKSTUDENTSUBMISSIONS
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
% This script assumes that 
%
% 
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
% 

% $Revisi0n: 0.0.0 $  $Date: 2017-07-29 $
% Creation of script
clc; clear variables;
Constants

%% Start with script
debugOutput(DEBUGOUTPUT,'Start with script');

correct = input(['Is this the correct week?: ' num2str(WEEK) ... 
                 ' (not giving an answer is YES)']);
if ~isempty(correct)
    disp('Script is STOPPED because the WEEK constant (see: Constants.m) has to be changed');
    return
end
subWkFolder = [STUDENTSUBFOLDER filesep WEEKNAME];             

%% Check if needed folder exists, if not stop execution of script
debugOutput(DEBUGOUTPUT,'Check if needed folder exists, if not stop execution of script',0);

if ~exist(STUDENTSUBFOLDER)
    mkdir(STUDENTSUBFOLDER)
end
if ~exist(subWkFolder)
    mkdir(subWkFolder)
    error('Needed subdirectory does not exist, execution of script is stopped!, put ZIPPED student submission in folder');
end

%% Check existence of  Matrix with studentnumbers and grades
debugOutput(DEBUGOUTPUT,'Check existence of  Matrix with studentnumbers and grades',0);

%% Check which students have submitted their assignments. Student without do not get any points
debugOutput(DEBUGOUTPUT,'Check which students have submitted their assignments. Student without do not get any points',0);

% Get files in the folder for analysis
files = dir(subWkFolder);
oldPath = pwd;
cd(subWkFolder);
% Get studentnumbers of students that submitted AND unzip the folder
for i = 3:length(files)
    studentsThatSubmitted{i-2} = files(i).name(end-11:end-4);
    unzip(fullfile(subWkFolder,files(i).name));
end
cd(oldPath);
% Load the old studentNumbers
load(fullfile(NAMEASSIGNMENTFOLDER,'studentNumbers.mat'));
% Display how many students did not submit
numOfNotSubmitted = length(studentNumbers)-length(studentsThatSubmitted);
disp([ num2str(numOfNotSubmitted) ' students did not submit their assignments']) 



%% Check if the HASH-codes in every m-file of the students is intact
debugOutput(DEBUGOUTPUT,'Check if the HASH-codes in every m-file of the students is intact',0);

%% Check the answer of the students and track their points if correct
debugOutput(DEBUGOUTPUT,'Check the answer of the students and track their points if correct',0);
