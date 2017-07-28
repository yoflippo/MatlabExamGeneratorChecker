%% Credits
% This file creates the assignments for Human Kinetic Movement student.
% Every students get a personalized set of assignments at the end of every
% Week. These assignment need to be handed in on a set time (preferably
% via an LMS like Blackboard).
% The solutions from the students are automatically checked in with an script
Constants

%% Start fresh and remove every file, Command Window
debugOutput(DEBUGOUTPUT,'Start fresh and remove every file, Command Window');
clc; close all; close all hidden;
addpath(genpath(pwd));


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

%% Copy the folder called 'clean_source_assignments'.
debugOutput(DEBUGOUTPUT,'Copy the folder called clean_source_assignments');
%%We want to leave the original folder intact

% delete previously generated folder
rmpath(genpath(nameAssignmentFolder))
if exist(nameAssignmentFolder)
    try
        warning off
        fclose('all'); %close all files, because after copy Matlab does not release a file
        A = dir( nameAssignmentFolder );
        for k = 1:length(A)
            delete([ nameAssignmentFolder  '\' A(k).name]);
        end
        rmdir(nameAssignmentFolder,'s');
    catch
    end
end
pause(1)
warning on
copyfiles(listWithNeededFolder{2},nameAssignmentFolder);
addpath(genpath(nameAssignmentFolder))
fclose('all'); %close all files, because after copy Matlab does not release a file

%% Read the student number and convert the list to e-mailadresses
debugOutput(DEBUGOUTPUT,'Read the student number and convert the list to e-mailadresses');
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
% Write the list of e-mailadresses to a txt file
cd(nameAssignmentFolder)
fid = fopen('emailadressen.txt','w');
for i=1:length(studentEmailadresses)
   fprintf(fid,'%s',studentEmailadresses{i});
   fprintf(fid,'\n');
end
fclose(fid);
%save the studentnumbers for later use
save('studentNumbers.mat','studentNumbers'); 

%% Create new filenames (with HASH code AND combine file names)
debugOutput(DEBUGOUTPUT,'Create new filenames (with HASH code AND combine file names)');
namesWeekDirectories = {'week1' 'week2'}; % 'week3' 'week4'};
ext = '.m';
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
            %if exist('TypeOfQuestion_Multiplechoice.m','file')
            if (exist(fullfile(relpath, 'TypeOfAssignment_Multiplechoice.m'), 'file') == 2)
                header = combineTextOfDifferentFiles('top_mc_question.m');
            elseif (exist(fullfile(relpath, 'TypeOfAssignment_Assignement.m'), 'file') == 2)
                header = combineTextOfDifferentFiles('top_mc_script.m');
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
            clean_file = combineTextOfDifferentFiles([namefile ext]);
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
            movefile([namefile '_ANT' ext],[extractBefore(namefile,'_versie')...
                '_' uniqueFN.Hash '_ANT' ext]);
            fclose('all'); delete([namefile ext]);
            % Go back to current folder and clear variable
            clear headerHash
            cd ..          
            cd ..
            cd ..
        end
    end
end
cd ..

