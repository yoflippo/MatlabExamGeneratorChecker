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

%% Zip all files in case a deletion goes wrong
debugOutput(DEBUGOUTPUT,'Zip all files in case a deletion goes wrong',1);
if input('Do you want to Backup everything? Yes (1) No (nothing): ')
    % Get unique string
    d = char(datetime('now'));
    d = strrep(d,':','_'); d = strrep(d,' ','_'); d = strrep(d,'-','_');
    warning off;
    if input('Do you want to clean the Backup folder? Yes (1) No (nothing): ')
        removeShitFromDir(BACKUPFOLDER);
    end
    mkdir(BACKUPFOLDER);
    addpath(genpath(BACKUPFOLDER));
    zip(fullfile(BACKUPFOLDER,['zip_all_' d '.zip']),pwd)
    rmpath(genpath(BACKUPFOLDER));
    warning on;
end
%% Copy the folder called 'clean_source\assignments'.
debugOutput(DEBUGOUTPUT,['Copy the folder called clean_source_assignments to ' ...
    NAMEASSIGNMENTFOLDER],1);

pathOfThisFile = erase(mfilename('fullpath'),mfilename);

% Delete previously generated folder
removeShitFromDir(NAMEASSIGNMENTFOLDER);
% mkdir(NAMEASSIGNMENTFOLDER)

% Find folder with the string week
pth = fullfile('clean_source','assignments');
subFoldersCleanSource = getFolders(pth);
weekFolders = strfind(subFoldersCleanSource,'week');
% copy action
if length(subFoldersCleanSource) == 0
    error(' the clean source folder is not found or empty!!');
end
for sbdr = 1:length(subFoldersCleanSource)
    tmp = weekFolders(1,sbdr);
    if ~isempty(tmp{1})
        source = fullfile(pathOfThisFile,pth,subFoldersCleanSource{sbdr});
        destin = fullfile(pathOfThisFile,NAMEASSIGNMENTFOLDER,subFoldersCleanSource{sbdr});
        copyfiles(source,destin);
    end
end
% After copy Matlab does not release a file
fclose('all');

%% Read the student number and convert the list to e-mailadresses
debugOutput(DEBUGOUTPUT,'Read the student number and convert the list to e-mailadresses',1);

studentFolder = LISTWITHNEEDEDFOLDERS{3};
eval(['studentFolderOutput = dir(''studentnumber*' filesep '*.txt'');']);
% go to the folder with studentnumbers. It is assumed to be a list with

stdnmbFile = fullfile(studentFolderOutput(1).folder,studentFolderOutput(1).name);
studentNumbers = load(stdnmbFile);
% Reshuffle the list with student numbers (removing patterns)
studentNumbers = studentNumbers(randperm(length(studentNumbers)));
% Convert the reshuffled list of student number to e-mailadresses
studentEmailadresses = makeEmailadres(studentNumbers,'@student.hhs.nl');
% Write the list of e-mailadresses to a txt file
cd(NAMEASSIGNMENTFOLDER)
% % fid = fopen('emailadressen.txt','w');
% % for i=1:length(studentEmailadresses)
% %     fprintf(fid,'%s',studentEmailadresses{i});
% %     fprintf(fid,'\n');
% % end
% % fclose(fid);
%save the studentnumbers for later use
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
%     mkdir(['week' num2str(wk)]);
end
cd(BASEFOLDER)


%% Create new filenames (with HASH code AND combine file names)
debugOutput(DEBUGOUTPUT,'Create new filenames (with HASH code AND combine file names)',1);

addpath(genpath(LISTWITHNEEDEDFOLDERS{4}))
addpath(genpath(LISTWITHNEEDEDFOLDERS{2}))
addpath(genpath(NAMEASSIGNMENTFOLDER))
cd(NAMEASSIGNMENTFOLDER)
savedHashes = []; cntHash = 1;
for wk = 1:length(WEEKFOLDERS)
    try
        % find all files in weekX folder
        cd(WEEKFOLDERS{wk})
        weekAssignments = dir(['**' filesep '*.m']);
        cd ..
     
        % traverse the week folder
        for fl = 1:length(weekAssignments)
            currentFile = weekAssignments(fl).name;
            currFileAbsPath = weekAssignments(fl).folder;
            currFileFull = fullfile(currFileAbsPath,currentFile);
            % find m-file with the answer/solution file
            if exist(fullfile(currFileAbsPath,replace(currentFile,'.m','_SOL.m')))
                % check which types of questions are in the subfolder of the
                % current weekfolder
                subdirs = strsplit(currFileAbsPath,filesep);
                cd(fullfile(subdirs{end-2},subdirs{end-1},subdirs{end}))
                %Check for the presence of files below to give the proper
                %header in the student specific assignment
                if (exist(fullfile(currFileAbsPath, 'TypeOfAssignment_Multiplechoice.m'), 'file') == 2)
                    header = combineTextOfDifferentFiles('default_header.m','header_question.m');
                elseif (exist(fullfile(currFileAbsPath, 'TypeOfAssignments_MakeScript.m'), 'file') == 2)
                    header = combineTextOfDifferentFiles('default_header.m','header_script.m');
                elseif (exist(fullfile(currFileAbsPath, 'TypeOfAssignments_MakeFunction.m'), 'file') == 2)
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
                    if  ~isempty(find(ismember(savedHashes,uniqueFN.Hash)))
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
                % Copy the clean/original file
                clear clean_file
                clean_file = combineTextOfDifferentFiles(currFileFull);
                for hh = 1:length(clean_file)
                    headerHash{length(headerHash)+1} = clean_file{hh};
                end
                % Delete current file
                delete(currFileFull);
                makeMFileFromCells(replace(currFileFull,'.m',''),headerHash)
                if exist(currFileFull) ~= 2
                    error(['There is a missing CHECK file: ' namefile]);
                end
                fclose('all');
                clear headerHash
                cd ..; cd ..; cd ..;
            end
        end
    catch causeException
        cd(BASEFOLDER)
        causeException   
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