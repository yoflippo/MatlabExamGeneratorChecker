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

if ~askuser(['Is this the correct week?: ' num2str(WEEK)],true)
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
% Remove directories from folder, they contain unzipped files and they are
% unusable because you are running this script
addpath(genpath(fullfile(pwd,subWkFolder)))
removeDirectoriesFromFolder(fullfile(pwd,subWkFolder))
% Get files in the folder for analysis
files = dir(subWkFolder);

% Get studentnumbers of students that submitted AND unzip the folder
cd(subWkFolder);
studentsThatSubmitted = [];
for i = 3:length(files)
    tmpTxt = erase(files(i).name,'.zip'); 
    tmpTxt = erase(tmpTxt,[WEEKNAME '_']);
    studentsThatSubmitted{i-2} = tmpTxt;
    unzip(fullfile(subWkFolder,files(i).name));
end
cd(BASEFOLDER);

%% Load the old studentNumbers
load(fullfile(NAMEASSIGNMENTFOLDER,STUDENTNUMBERMAT));
% Display how many students did not submit
numOfNotSubmitted = length(studentNumbers)-length(studentsThatSubmitted);
if length(studentsThatSubmitted) == 0
    error('Something went wrong: no student submission');
end
disp([ num2str(numOfNotSubmitted) ' students did not submit their assignments'])


%% TODO: check if studentnumber file in studentfolder has correct studentnumber

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
        [p subdir] = GetPathOneLevelUp(currFileAbsPath,2);
        try
            currHash = GetHashCodeFromMFile(currFileAbsPath);
            % Check if hash if present in dictionary
            dicWithHashes(currHash);
        catch
            % Move file in a folder in the variable ADJUSTEDHASH
            mkdir(fullfile(p,ADJUSTEDHASH,subdir));
            % replace point of filename with underscore, so it won't be
            % recognised in other scripts as an m-file.
            nameOfFile = strrep(mfiles(i).name,'.','_');
            movefile(currFileAbsPath,fullfile(p,ADJUSTEDHASH,subdir,nameOfFile));
            cd(oldPath);
        end
    end
end

%% Check for each student if they have their correct assignments
% Iterate over studentfolder to check if they present mfiles contains the
% ASSIGNED files. A student could exchange assigned files with another
% student
debugOutput(DEBUGOUTPUT,'Check for each student if they have their correct assignments',0);

% Load the information assigned for this week
load(fullfile(NAMEASSIGNMENTFOLDER,WEEKNAME,['assignedHashes_' WEEKNAME]));

XXXXXX nieuw test data maken

for i = 1:length(trackStudentAssignment)
    % Get hash codes of current student
    HCodeCurrStud = {trackStudentAssignment{i,2:end}};
    % Go inside student folder
    relPath = fullfile(STUDENTSUBFOLDER,WEEKNAME,trackStudentAssignment{i,1});
    cd(relPath);
    % Get hashcodes in student folder
    [HashCodeCurrStud AbsPathCodeCurrStud] = GetHashCodeOfMFilesInFolder(WEEKNAME);
    %% Check if all files are unique, to prevent copies to get more points
    if length(HashCodeCurrStud) ~= length(unique(HashCodeCurrStud))
        keyboard %pause program
        disp('Student has a copy of a file in his/hers directory');
        HashCodeCurrStud = unique(HashCodeCurrStud);
    end
    
    %% Check if the assigned hashcodes are present
    for j = 1:length(HashCodeCurrStud)
        if isempty(find(ismember(HCodeCurrStud,HashCodeCurrStud{j})))
            nameOfFile = GetFileNameFromPath(AbsPathCodeCurrStud{j});
            newNameOfCheatFile = strrep(nameOfFile,'.m','_m');
            %Get corresponding subfolder of assignment
            [a subdir] = GetPathOneLevelUp(AbsPathCodeCurrStud{j},2);
            mkdir(fullfile(WEEKNAME,FOLDERCHEAT,subdir));
            movefile(AbsPathCodeCurrStud{j},fullfile(WEEKNAME,FOLDERCHEAT, ...
                subdir,newNameOfCheatFile));
        end
    end
    cd(BASEFOLDER)
end
clear HashCodeCurrStud AbsPathCodeCurrStud

%% Get the number of points for all week assignments
debugOutput(DEBUGOUTPUT,'Get the number of points for all week assignments',0);

relPathWeekFolderUnique = fullfile(NAMEASSIGNMENTFOLDER,WEEKNAME);
mfiles = readFilesInSubFolder(relPathWeekFolderUnique,'.m');
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
    foundSlashes = strfind(tmp,filesep);
    nameOfAssignment{i} = tmp(foundSlashes(end-1)+1:foundSlashes(end)-1);
    pointsPerAssignment(i) = deelpunten;
end

%% Put in dictionary and save in MAT-file
debugOutput(DEBUGOUTPUT,'Put in dictionary and save in MAT-file',0);

dicNameAssignmentAndPoints = containers.Map(nameOfAssignment,pointsPerAssignment);
save(fullfile(NAMEASSIGNMENTFOLDER,WEEKNAME,'dicAssignmentsAndPoints.mat'),'dicNameAssignmentAndPoints')


%% Check the answer of the students and track their points if correct
debugOutput(DEBUGOUTPUT,'Check the answer of the students and track their points if correct',0);

addpath(genpath(fullfile(NAMEASSIGNMENTFOLDER,WEEKNAME)));
PointsToBeEarned = sum(pointsPerAssignment);
% Load the answer files
eval(['load(''answerfiles_week' num2str(WEEK) ''')'])
% Go to folder with unzipped files
relPath = fullfile(STUDENTSUBFOLDER,WEEKNAME);
cd(relPath);
% Load the studentMatrix in resultatenWeekx
load(fullfile(BASEFOLDER,STUDENTSUBFOLDER,['resultatenWeek' num2str(WEEK)]))

% Iterate over every folder/studentnumber
for sn = 1:length(trackStudentAssignment)
    studentFolder = trackStudentAssignment{sn,1}
    addpath(genpath(studentFolder));
    points = CheckSingleStudentAssignment(studentFolder,dicWithHashes, ...
        dicNameAssignmentAndPoints,answerFilesInDir);
    grade = ((points/PointsToBeEarned)*9)+1;
    studentMatrix(sn,2) = round(grade,1);
    rmpath(genpath(studentFolder));
end
rmpath(genpath(fullfile(NAMEASSIGNMENTFOLDER,WEEKNAME)));
% Save the file with the results





% last but not least: copy the right answer to every student folder
cd(BASEFOLDER);