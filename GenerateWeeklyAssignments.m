%% Credits
% This file creates the assignments for Human Kinetic Movement student.
% Every students get a personalized set of assignments at the end of every
% Week. These assignment need to be handed in on a set time (prefferably
% via an LMS like Blackboard).
% The solutions from the students are automatically checked in with an script
% called < fill_me_frodo. m>.
%
% Steps for using this script:
% 1 -   Check if the Current Folder (the folder in which this script is
%       residing contains the following scripts/folders:
%           - < fill_me_frodo. m>.
%           - < fill_me_frodo. m>.
%           - < fill_me_frodo. m>.
%           - < fill_me_frodo. m>.
% 2 -   Get the student numbers for the students participating in this course
%       and put the studentnumbers in the file called < fill_me_frodo. m>.
% 3 -   Run this script and check the outputs by opening the zip files
% 4 -   Run the script called < fill_me_frodo. m>. to send the personalized
%       assignment to the student e-mailadresses.

%% Start fresh and remove every file, Command Window
clc; close all; close all hidden;
addpath(genpath(pwd));
year = 2017;

%% Check for the existence of needed supporting scripts/function files
listWithNeededFolder = {'helpercode' 'clean_source_assignments' 'studentnumbers'};
for i = 1:length(listWithNeededFolder)
    try
        cd(listWithNeededFolder{i});
        cd ..
        % %         if isempty(readFilesInSubFolder(listWithNeededFolder{i},'.m'))
        % %             error(['The folder: "' mfilesFolder '" does not contain files']);
        % %         end
    catch
        error(['The folder: ' listWithNeededFolder{i} ' was not found']);
    end
end

%% Read the student number and convert the list to e-mailadresses
studentFolder = listWithNeededFolder{3};
studentFolderOutput = readFilesInSubFolder(studentFolder,'.txt');

% go to the folder with studentnumbers. It is assumed to be a list with
% doubles
scriptFolder = pwd;
cd(studentFolder)
studentNumbers = load(studentFolderOutput{1});
cd(scriptFolder)
% Reshuffle the list with student numbers (removing patterns)
studentNumbers = studentNumbers(randperm(length(studentNumbers)));
% Convert the reshuffled list of student number to e-mailadresses
studentEmailadresses = makeEmailadres(studentNumbers,'@student.hhs.nl');

%% Copy the folder called 'clean_source_assignments'.
%%We want to leave the original folder intact
nameAssignmentFolder = 'assignments';
% delete previously generated folder
if exist(nameAssignmentFolder)
    warning off
    rmdir(nameAssignmentFolder,'s');
end
warning on
copyfiles(listWithNeededFolder{2},nameAssignmentFolder);
addpath(genpath(nameAssignmentFolder))

%% Create new filenames (with HASH code AND combine file names
namesWeekDirectories = {'week1' 'week2'}; % 'week3' 'week4'};
ext = '.m';
% change current folder
cd(nameAssignmentFolder)
for wk = 1:length(namesWeekDirectories)
    % find all files in weekX folder
    weekAssignments = readFilesInSubFolder(namesWeekDirectories{wk},ext);
    % traverse the week folder
    for fl = 1:length(weekAssignments)
        currentFile = weekAssignments{fl};
        [relpath,namefile,ext] = fileparts(currentFile);
        
        % find m-file with the answer/solution file
        if exist([relpath filesep namefile '_ANT' ext])
            % check which types of questions are in the subfolder of the
            % current weekfolder
            subdirs = strsplit(relpath,filesep);
            cd([subdirs{1} filesep subdirs{2}])
            if exist('TypeOfQuestion_Multiplechoice.m')
                header = combineTextOfDifferentFiles('top_mc_question.m');
                %         elseif
            end
            
            headerHash{1} = header{1};
            uniqueFN = generateUniqueFilename(namefile,year);
            headerHash{2} = uniqueFN.HashCommentLine;
            for hh = 2:length(header)
               headerHash{hh+1} = header{hh};
            end
            
            makeMFileFromCells('testGODVERDOMME',headerHash)
            % combine header for every assigment with assignment and give hashname
            
            % delete the original file
        end
    end
    
    %% Create the assignments
    % Create a working folder called 'student-assignments'
    
    % Start with an randomized number for every ((sub)assignment (called X
    % where X is between 1..n with n being the number of available assignments)
    
    % each student gets it own subfolder in the folder called 'student-assignments'
    
    % Iterate through the list of students. Give the first student the for the
    % first assignment the assignment with the corresponding randomized number.
    % Repeat this for the following assignments. Remark: because the e-mail
    % list is shuffled and the starting point of each personalised assignment
    % generation is random no patterns should be present. Every student gets a
    % truly randomised set of assignments
    
    % Zip the assignment and give it the student number corresponding to the
    % student.
    
end
cd ..

