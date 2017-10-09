%GENERATEEVERYTHINGFORCOURSE
%   The first step in using the files for the course. This script should be
%   runned only once during the course.
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
% TODO: generate the hashes not all at once but for each week separately in
% the CreateWeekAssignments script.
%

% $Revisi0n: 0.0.0 $  $Date: 2017-07-27 $
% Creation of script.

%% Start fresh
InitAll
debugOutput(DEBUGOUTPUT,['Start fresh: Generate all week assignments' num2str(WEEK)]);


%% Read the student number and convert the list to e-mailadresses
debugOutput(DEBUGOUTPUT,'Read the student number and convert the list to e-mailadresses',1);

studentFolder = LISTWITHNEEDEDFOLDERS{3};
studentFolderOutput = dir('studentnumber*/*.txt');
% go to the folder with studentnumbers. It is assumed to be a list with

stdnmbFile = fullfile(studentFolderOutput(1).folder,studentFolderOutput(1).name);
studentNumbers = load(stdnmbFile);
% % % % % % Reshuffle the list with student numbers (removing patterns)
% RANDOMNNES
% % % % % studentNumbers = studentNumbers(randperm(length(studentNumbers)));
% Convert the reshuffled list of student number to e-mailadresses
studentEmailadresses = makeEmailadres(studentNumbers,'@student.hhs.nl');
% Write the list of e-mailadresses to a txt file
cd(NAMEASSIGNMENTFOLDER)
save(STUDENTNUMBERMAT,'studentNumbers');
cd(BASEFOLDER)

%% Remove (if necessary) and create a folder for the submitted student assignments
debugOutput(DEBUGOUTPUT,'Remove (if necessary) and create a folder for the submitted student assignments',1);

removeShitFromDir(STUDENTSUBFOLDER)
% mkdir(STUDENTSUBFOLDER)

% Create a MAT file that stores the results of each student
cd(STUDENTSUBFOLDER);
studentMatrix = [studentNumbers zeros(length(studentNumbers),1)];
for wk = 1:4
    save([NAMERESULTMAT num2str(wk)],'studentMatrix');
    mkdir(['week' num2str(wk)]);
end
cd(BASEFOLDER)


%% Create new filenames (with HASH code AND combine file names)
debugOutput(DEBUGOUTPUT,'Create new filenames (with HASH code AND combine file names)',1);

addpath(genpath(LISTWITHNEEDEDFOLDERS{4}))
addpath(genpath(LISTWITHNEEDEDFOLDERS{2}))
addpath(genpath(NAMEASSIGNMENTFOLDER))
cd(NAMEASSIGNMENTFOLDER)
savedHashes = []; 
cntHash = 1;
for wk = 1:length(WEEKFOLDERS)
    try
        % find all files in weekX folder
        cd(WEEKFOLDERS{wk})
        weekAssignments = dir(['**' filesep '*.m']);
        cd ..
        
        % traverse the week folder
        for fl = 1:length(weekAssignments)
            tic;
            currentFile = weekAssignments(fl).name;
            currFileAbsPath = weekAssignments(fl).folder;
            currFileFull = fullfile(currFileAbsPath,currentFile);
            currentFileSOL = fullfile(currFileAbsPath,replace(currentFile,'.m','_SOL.m'));
            % find m-file with the answer/solution file
            if exist(currentFileSOL,'file')
                % check which types of questions are in the subfolder of the
                % current weekfolder
                subdirs = strsplit(currFileAbsPath,filesep);
                cd(fullfile(subdirs{end-2},subdirs{end-1},subdirs{end}))
                %Check for the presence of files below to give the proper
                %header in the student specific assignment
                if (exist(fullfile(currFileAbsPath, 'TypeOfAssignment_Multiplechoice.m'), 'file') == 2)
                    header = combineTextOfDifferentFiles('default_header.m','header_question.m');
                elseif (exist(fullfile(currFileAbsPath, 'TypeOfAssignment_MakeScript.m'), 'file') == 2)
                    header = combineTextOfDifferentFiles('default_header.m','header_script.m');
                elseif (exist(fullfile(currFileAbsPath, 'TypeOfAssignment_MakeFunction.m'), 'file') == 2)
                    header = combineTextOfDifferentFiles('default_header.m','header_function.m');
                else
                    error('The current folder does not contain a type file');
                end
                % Create header with hash of file
                headerHash{1} = header{1};
                % Be carefull, the following function needs unique data
                uniqueFN = generateUniqueFilename(currFileFull,YEAR);
                % Test if a Hash is unique, could be
                if ~isempty(savedHashes)
                    if  ~isempty(find(ismember(savedHashes,uniqueFN.Hash),1))
                        error('A Non unique HASH has been created');
                        cd(BASEFOLDER);
                    end
                end
                savedHashes{cntHash} = uniqueFN.Hash;
                cntHash = cntHash + 1;
                
                headerHash{2} = uniqueFN.HashCommentLine;
                % Grab default header text for every m-file
                for hh = 2:length(header)
                    headerHash{length(headerHash)+1} = header{hh};
                end
                headerHashSOL = headerHash;
                % Copy the clean/original file
                clear clean_file
                clean_file = combineTextOfDifferentFiles(currFileFull);
                for hh = 1:length(clean_file)
                    headerHash{length(headerHash)+1} = clean_file{hh};
                end
                % Copy the clean/original SOLUTION file
                clear clean_file_SOL
                clean_file_SOL = combineTextOfDifferentFiles(currentFileSOL);
                for hh = 1:length(clean_file_SOL)
                    headerHashSOL{length(headerHashSOL)+1} = clean_file_SOL{hh};
                end
                
                % Delete current file
                delete(currFileFull);
                delete(currentFileSOL);
                makeMFileFromCells(replace(currFileFull,'.m',''),headerHash)
                makeMFileFromCells(replace(currentFileSOL,'.m',''),headerHashSOL)
                if ~exist(currFileFull,'file')
                    error(['There is a missing CHECK file: ' namefile]);
                end
                fclose('all');
                clear headerHash
                cd ..; cd ..; cd ..;
            end
            clc
            estPerc = round(fl/length(weekAssignments),2)*100;
            disp([['Give each assignment Hash-info week: ' num2str(wk)] ', progress: ' num2str(estPerc) '%']);
        end
    catch causeException
        cd(BASEFOLDER)
        disp(causeException);
        rmpath(genpath(LISTWITHNEEDEDFOLDERS{4}))
        rmpath(genpath(LISTWITHNEEDEDFOLDERS{2}))
        rmpath(genpath(NAMEASSIGNMENTFOLDER))
        error(['problem with folder: ' WEEKFOLDERS{wk}  ]);
    end
end
cd(BASEFOLDER)
rmpath(genpath(LISTWITHNEEDEDFOLDERS{4}))
rmpath(genpath(LISTWITHNEEDEDFOLDERS{2}))
rmpath(genpath(NAMEASSIGNMENTFOLDER))
debugOutput(DEBUGOUTPUT,'END SCRIPT',1);