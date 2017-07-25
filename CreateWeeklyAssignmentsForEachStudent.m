    %% Create the assignments
    clc; close all; clear all;
    
    nameAssignmentFolder = 'assignments';
    
    % Get an overview of files
    mfiles = readFilesInSubFolder(nameAssignmentFolder,'.m');
    
    % Filter the relevant files, only files with 'vraag' are relevant
    mfilesOI = strfind(mfiles,'vraag_'); %files of interest
    mfiles = mfiles(cellfun('length',mfilesOI)==2);
    
    % Further filter the files down to files without the postfix '_ans'
    mfilesOI = strfind(mfiles,'_ANT'); %files of interest
    mfilesOI = mfiles(cellfun('isempty',mfilesOI));
    
    % Get HashCode of each file
    underscorePos = strfind(mfilesOI,'_');
    numUnderScores = length(underscorePos{2});
    hashPos = underscorePos{1,2}(numUnderScores-1:numUnderScores);

    for h = 1:length(mfilesOI)
       HashCodes{h} = mfilesOI{1,h}(hashPos(1)+1:hashPos(2)-1) ;
    end
    % Combine the relevant files in a Container (dictionary) so the
    % hashcode is combined with a location
    mapWithHash = containers.Map(HashCodes,mfilesOI);

    % Create a working folder called 'student-assignments'
    % Create week folders
    % Create in each week-folder a folder for each student
    
    
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
    