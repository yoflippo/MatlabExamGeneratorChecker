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
InitAll

%% Start with script
debugOutput(DEBUGOUTPUT,'Start with script');

correct = input(['Is this the correct week?: ' num2str(WEEK) ...
    ' (not giving an answer is YES)']);
if ~isempty(correct)
    disp('Script is STOPPED because the WEEK constant (see: initAll.m) has to be changed');
    return
end
subWkFolder = fullfile(STUDENTSUBFOLDER,WEEKNAME);

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

% Find studentnumbers
load(fullfile(NAMEASSIGNMENTFOLDER,STUDENTNUMBERMAT))
% Get files in the folder for analysis
files = dir(subWkFolder);

% Get studentnumbers of students that submitted AND unzip the folder
cd(subWkFolder);
studentsThatSubmitted = [];
for i = 3:length(files)
    studentsThatSubmitted{i-2} = files(i).name(end-11:end-4);
    unzip(fullfile(subWkFolder,files(i).name));
end
addpath(genpath(pwd))
cd(BASEFOLDER);

% Load the old studentNumbers
load(fullfile(NAMEASSIGNMENTFOLDER,'studentNumbers.mat'));
% Display how many students did not submit
numOfNotSubmitted = length(studentNumbers)-length(studentsThatSubmitted);
if length(studentsThatSubmitted) == 0
    error('Something went wrong: no student submission');
end
disp([ num2str(numOfNotSubmitted) ' students did not submit their assignments'])

%% Check if the HASH-codes in every m-file of the students is intact
debugOutput(DEBUGOUTPUT,'Check if the HASH-codes in every m-file of the students is intact',0);

% Get Hash of original assignment folder AND save it in MAT-file
dicWithHashes = GetDictionaryWithHashAndLocation(NAMEASSIGNMENTFOLDER,SOLPOSTFIX);
save(fullfile(NAMEASSIGNMENTFOLDER,WEEKNAME,'dicHashesAbsPath.mat'),'dicWithHashes')
hashCodes = keys(dicWithHashes);

% Iterate through student directories and read the hash strings from their
% files.
oldPath = pwd;
cd(subWkFolder);
mfiles = dir('**/*.m');
cd(oldPath)
% If a certain file is manipulated put it in a folder GEEN_PUNTEN
for i = 1:length(mfiles)
    % Test for files that are not relevant
    blTestIfCorrectFile = true;
    for j = 1:length(OTHERFILESINSTUDENTFOLDER)
        if isequal(OTHERFILESINSTUDENTFOLDER{j},mfiles(i).name)
            blTestIfCorrectFile = false;
            break;
        end
    end
    % Get hashcode from current mfiles
    if blTestIfCorrectFile
        currFileAbsPath = fullfile(mfiles(i).folder,mfiles(i).name);
        try
            currHash = GetHashCodeFromMFile(currFileAbsPath);
            % Check if hash if present in dictionary
            dicWithHashes(currHash);
        catch
            % Move file in a folder in the variable ADJUSTEDHASH
            oldPath = pwd;
            cd(mfiles(i).folder);
            mkdir(ADJUSTEDHASH);
            % replace point of filename with underscore, so it won't be
            % recognised in other scripts as an m-file.
            nameOfFile = strrep(mfiles(i).name,'.','_');            
            movefile(currFileAbsPath,fullfile(mfiles(i).folder,ADJUSTEDHASH,nameOfFile));
            cd(oldPath);
        end
    end
end

%% Get the number of points for all week assignments
debugOutput(DEBUGOUTPUT,'Get the number of points for all week assignments',0);

mfiles = readFilesInSubFolder(fullfile(NAMEASSIGNMENTFOLDER,WEEKNAME),'.m');
relevantMFiles = strfind(mfiles,'points.m');
if isempty(relevantMFiles)
    error('Apparently there are NO points.m files found');
end
mfiles = mfiles(~cellfun('isempty',relevantMFiles));
pointsPerAssignment = zeros(1,length(mfiles));
nameOfAssignment = [];
for i = 1:length(mfiles)
    tmp = mfiles(i);
    tmp = tmp{1};
    run(tmp(1:end-2));
    % Get name of assignment and save it
    foundSlashes = strfind(tmp,'\');
    nameOfAssignment{i} = tmp(foundSlashes(end-1)+1:foundSlashes(end)-1);
    pointsPerAssignment(i) = deelpunten;
end

%% Put in dictionary and save in MAT-file
debugOutput(DEBUGOUTPUT,'Put in dictionary and save in MAT-file',0);
dicNameAssignmentAndPoints = containers.Map(nameOfAssignment,pointsPerAssignment);
save(fullfile(NAMEASSIGNMENTFOLDER,WEEKNAME,'dicAssignmentsAndPoints.mat'),'dicNameAssignmentAndPoints')

%% Check the answer of the students and track their points if correct
debugOutput(DEBUGOUTPUT,'Check the answer of the students and track their points if correct',0);


% last but not least: copy the right answer to every student folder
cd(BASEFOLDER);