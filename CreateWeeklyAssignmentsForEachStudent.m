    %% Create the assignments
    nameAssignmentFolder = 'assignments';
    
    % Get an overview of files
    mfiles = readFilesInSubFolder(nameAssignmentFolder,'.m');
    
    % Filter the relevant files, only files with 'vraag' are relevant
    mfilesOI = strfind(mfiles,'vraag'); %files of interest
    mfilesOI = mfiles(cellfun('length',mfilesOI)==2);
    
    % Further filter the files down to files without the postfix '_ans'
    mfilesOI = strfind(mfilesOI,'_ANT'); %files of interest
    mfilesOI = mfiles(cellfun('isempty',mfilesOI));
    
    % Get HashCode of each file
    strfind(mfilesOI,'_')
    % Combine the relevant files in a Container (dictionary) so the
    % hashcode is combined with a location
    

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
    