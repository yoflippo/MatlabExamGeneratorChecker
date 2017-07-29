%CREATEWEEKLYASSIGNMENTSFOREACHSTUDENT
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
% This file creates randomly assignments to students and zips to folder for
% every student. This script depends on the Constants.m file (as does 
% the GENERATEWEEKLYASSIGNMENTS script). For week1 to assign assignments to
% a student the 'week' variable in Constant.m has to be changed to 1.
%
% 
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
% 
%
%

% $Revisi0n: 0.0.0 $  $Date: 2017-07-27 $
% Creation of script.

%% Create the assignments
clc; clear variables;
tic;
Constants
debugOutput(DEBUGOUTPUT,['Generating assignents for WEEK: ' num2str(WEEK)]);

%% Check for the existence of needed supporting scripts/function files
debugOutput(DEBUGOUTPUT,'Check for the existence of needed supporting scripts/function files');

for i = 1:length(listWithNeededFolder)
    try
        cd(listWithNeededFolder{i});
        cd ..
    catch
        error(['PLEASE ADJUST YOUR CURRENT LOCATION (Current Folder)' ...
            'The folder: ' listWithNeededFolder{i} ' was not found']);
    end
end

%% Check for the needed existing files in every deepest folder

%% Create a working folder called 'student-assignments'
debugOutput(DEBUGOUTPUT,'Create a working folder called student-assignments');

weekName = ['week' num2str(WEEK)];
wkFolderName = [studentAssDir filesep weekName];
%remove folder if it exists
if exist(studentAssDir) && isequal(WEEK,0)
    dirToRemove = studentAssDir;
else
    dirToRemove = wkFolderName;
end
removeShitFromDir(dirToRemove);


%% Create a student specific folder in every week folder
debugOutput(DEBUGOUTPUT,'Create a student specific folder in every week folder');

% Load the studentnumbers (randomly ordered)
load([nameAssignmentFolder filesep 'studentNumbers.mat']);
% Create weekfolders
mkdir(wkFolderName)
% Create a studentAssDir inside every weekfolder
for i = 1:length(studentNumbers)
    mkdir([wkFolderName filesep num2str(studentNumbers(i))]);
end

%% Get overview of file versions, and assign to studentNumbers. PLEASE NOTICE:
debugOutput(DEBUGOUTPUT,'Get overview of file versions, and assign to studentNumbers');

% The studentNumbers variable is randomly generated. So assignments in
% folder can be assigned sequently to the studentnumbers without
% introducing some kind of detectable order.
global output; output = [];
deepestAssignFolders = GetDeepestFolders([nameAssignmentFolder filesep weekName]);
% Make relative path
for i = 1:length(deepestAssignFolders)
    deepestAssignFolders{i} = extractAfter(deepestAssignFolders{i},nameAssignmentFolder);
    % Count the number of assignment in every folder (with '_SOL')
    currPath = pwd;
    cd([nameAssignmentFolder filesep deepestAssignFolders{i}]);
    answerFilesInDir{i} = dir(['*' SOLPOSTFIX '*']);
    numberOfAssignmentInDir(i) = length(answerFilesInDir{i});
    cd(currPath);
end

%% Fill every student folder with the number of assignments sequentially
debugOutput(DEBUGOUTPUT,'Fill every student folder with the number of assignments sequentially');

answerFileCounter = ones(1,length(deepestAssignFolders));
for i = 1:length(studentNumbers)
    % Browse to every assignment folder, PLEASE NOTICE: randomness is
    % used here, but could be improved by implementing a random
    % generator everytime an assignment is chosen
    studentDir = num2str(studentNumbers(i));
    currStudentDir = [wkFolderName filesep studentDir];
    for j = 1:length(deepestAssignFolders)
        cnt = answerFileCounter(j); %
        currFile = [deepestAssignFolders{j} filesep answerFilesInDir{1,j}(cnt).name];
        % rename the file to a file without _SOL
        currFile = [currFile(1:end-5) ext];         
        % file to copy
        sourceFile = [nameAssignmentFolder currFile];
        % create the right dir tree within student folder
        currFileClean = [currFile(1:end-36) ext];
        % create the rel path string with final naming
        finFileLoc = [currStudentDir currFileClean];
        % Copy file from unique assignment dir to student folder with
        % subdirs
        mkdir([wkFolderName filesep studentDir deepestAssignFolders{j}])
        copyfile(sourceFile,finFileLoc)
        % Reset counter if last file is reached
        if isequal(numberOfAssignmentInDir(j),answerFileCounter(j))
            answerFileCounter(j) = 1;
        else
            answerFileCounter(j) = cnt + 1;
        end
    end
    % Zip the assignment and give it the student number corresponding to the
    % student.
    currPath = pwd;
    cd(currStudentDir);
    zip(['..' filesep weekName '_' studentDir '.zip'],pwd)
    cd(currPath);
    % Remove the folder that is previously zipped
    removeShitFromDir(currStudentDir);
end
toc