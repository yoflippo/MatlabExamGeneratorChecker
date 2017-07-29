%GENERATEWEEKLYASSIGNMENTS
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
% This file creates the assignments for Human Kinetic Movement student.
% Every students get a personalized set of assignments at the end of every
% Week. These assignment need to be handed in on a set time (preferably
% via an LMS like Blackboard).
% PLEASE NOTICE:
% This script only needs to be runned once to create all unique
% assignments.
% The CreateWeeklyAssignmenetsForEachStudent.m script has to
% runned for every week.
%
%
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
%
%
%

% $Revisi0n: 0.0.0 $  $Date: 2017-07-27 $
% Creation of script.

%% Start fresh
Constants
addpath(genpath(pwd));
debugOutput(DEBUGOUTPUT,['Start fresh: Generate all week assignments' num2str(WEEK)]);

%% Check for the existence of needed supporting scripts/function files
debugOutput(DEBUGOUTPUT,'Check for the existence of needed supporting scripts/function files',1);


%% Copy the folder called 'clean_source_assignments'.
debugOutput(DEBUGOUTPUT,'Copy the folder called clean_source_assignments',1);

% Delete previously generated folder
removeShitFromDir(NAMEASSIGNMENTFOLDER);
% Copy files
copyfiles(LISTWITHNEEDEDFOLDERS{2},NAMEASSIGNMENTFOLDER);
addpath(genpath(NAMEASSIGNMENTFOLDER))
% After copy Matlab does not release a file
fclose('all');

%% Read the student number and convert the list to e-mailadresses
debugOutput(DEBUGOUTPUT,'Read the student number and convert the list to e-mailadresses',1);

studentFolder = LISTWITHNEEDEDFOLDERS{3};
studentFolderOutput = readFilesInSubFolder(studentFolder,'.txt');
% go to the folder with studentnumbers. It is assumed to be a list with
% doubles
studentNumbers = load(studentFolderOutput{1});
% Reshuffle the list with student numbers (removing patterns)
studentNumbers = studentNumbers(randperm(length(studentNumbers)));
% Convert the reshuffled list of student number to e-mailadresses
studentEmailadresses = makeEmailadres(studentNumbers,'@student.hhs.nl');
% Write the list of e-mailadresses to a txt file
cd(NAMEASSIGNMENTFOLDER)
fid = fopen('emailadressen.txt','w');
for i=1:length(studentEmailadresses)
    fprintf(fid,'%s',studentEmailadresses{i});
    fprintf(fid,'\n');
end
fclose(fid);
%save the studentnumbers for later use
save('studentNumbers.mat','studentNumbers');

%% Create new filenames (with HASH code AND combine file names)
debugOutput(DEBUGOUTPUT,'Create new filenames (with HASH code AND combine file names)',1);
namesWeekDirectories = {'week1' 'week2'}; % 'week3' 'week4'};
for wk = 1:length(namesWeekDirectories)
    % find all files in weekX folder
    weekAssignments = readFilesInSubFolder(namesWeekDirectories{wk},EXT);
    % traverse the week folder
    for fl = 1:length(weekAssignments)
        currentFile = weekAssignments{fl};
        [relpath,namefile,EXT] = fileparts(currentFile);
        % find m-file with the answer/solution file
        if exist([relpath filesep namefile '_SOL' EXT])
            % check which types of questions are in the subfolder of the
            % current weekfolder
            subdirs = strsplit(relpath,filesep);
            cd([subdirs{1} filesep subdirs{2}])
            %Check for the presence of files below to give the proper
            %header in the student specific assignment
            if (exist(fullfile(relpath, 'TypeOfAssignment_Multiplechoice.m'), 'file') == 2)
                header = combineTextOfDifferentFiles('default_header.m','header_question.m');
            elseif (exist(fullfile(relpath, 'TypeOfAssignments_MakeScript.m'), 'file') == 2)
                header = combineTextOfDifferentFiles('default_header.m','header_script.m');
            elseif (exist(fullfile(relpath, 'TypeOfAssignments_MakeFunction.m'), 'file') == 2)
                header = combineTextOfDifferentFiles('default_header.m','header_function.m');
            end
            % Create header with hash of file
            headerHash{1} = header{1};
            uniqueFN = generateUniqueFilename(namefile,YEAR);
            headerHash{2} = uniqueFN.HashCommentLine;
            % Grab default header text for every m-file
            for hh = 2:length(header)
                headerHash{length(headerHash)+1} = header{hh};
            end
            % Copy the clean/original file
            clean_file = combineTextOfDifferentFiles([namefile EXT]);
            for hh = 1:length(clean_file)
                headerHash{length(headerHash)+1} = clean_file{hh};
            end
            % Go inside current folder
            cd(subdirs{end})
            % Create unique filename
            uniqueFileName = [extractBefore(namefile,'_versie') '_'...
                uniqueFN.Hash '_' ];
            makeMFileFromCells(uniqueFileName,headerHash)
            % Rename the ANS file
            movefile([namefile SOLPOSTFIX EXT],[extractBefore(namefile,'_versie')...
                '_' uniqueFN.Hash SOLPOSTFIX EXT]);
            fclose('all'); delete([namefile EXT]);
            % Go back to current folder and clear variable
            clear headerHash
            cd ..; cd ..; cd ..;
        end
    end
end
cd ..
debugOutput(DEBUGOUTPUT,'END SCRIPT',1);