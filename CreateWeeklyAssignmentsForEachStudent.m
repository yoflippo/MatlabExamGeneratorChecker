%% Create the assignments
clc;
WEEK = 1; % make zero to delete base folder
DEBUGOUTPUT = 1;

%% Check for the existence of needed supporting scripts/function files
debugOutput(DEBUGOUTPUT,'Check for the existence of needed supporting scripts/function files');
listWithNeededFolder = {'helpercode' 'clean_source_assignments' 'studentnumbers' ...
    'clean_source' };
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
studentAssDir = 'student_week_assignments';
assignmentsDir = 'unique_assignments';
wkFolderName = [studentAssDir filesep 'week' num2str(WEEK)];
%remove folder if it exists
if exist(studentAssDir) && isequal(WEEK,0)
    try
        warning off
        fclose('all'); %close all files, because after copy Matlab does not release a file
        A = dir( studentAssDir );
        for k = 1:length(A)
            delete([ studentAssDir  '\' A(k).name]);
        end
        rmdir(studentAssDir,'s');
    catch
    end
else
    rmdir(wkFolderName,'s');
end

%% Create a student specific folder in every week folder
debugOutput(DEBUGOUTPUT,'Create a student specific folder in every week folder');
cd(assignmentsDir)
load('studentNumbers.mat');
cd ..
% Create weekfolders
mkdir(wkFolderName)
cd(wkFolderName);
% Create a studentAssDir inside every weekfolder
for i = 1:length(studentNumbers)
    mkdir(num2str(studentNumbers(i)));
end
% Go back
cd ..; cd ..;

%% Get overview of file versions, and assign to studentNumbers. PLEASE NOTICE:
debugOutput(DEBUGOUTPUT,'Get overview of file versions, and assign to studentNumbers');
% the studentNumbers variable is randomly generated. So assignments in
% folder can be assigned sequently to the studentnumbers without
% introducing some kind of detectable order.
global output; output = [];
deepestAssignFolders = GetDeepestFolders(assignmentsDir);
% Make relative path
for i = 1:length(deepestAssignFolders)
    deepestAssignFolders{i} = extractAfter(deepestAssignFolders{i},assignmentsDir);
    % Count the number of assignment in every folder (with '_ANT')
    currPath = pwd;
    cd([assignmentsDir filesep deepestAssignFolders{i}]);
    answerFilesInDir{i} = dir('*_ANT*');
    numberOfAssignmentInDir(i) = length(answerFilesInDir{i});
    cd(currPath);
end


%% Fill every student folder with the number of assignments sequentially
debugOutput(DEBUGOUTPUT,'Fill every student folder with the number of assignments sequentially');
% Zip the assignment and give it the student number corresponding to the
% student.
% Go to student directory
cd(wkFolderName);
dirs = dir(pwd);
cd ..; cd ..;
answerFileCounter = ones(1,length(deepestAssignFolders));
for i = 3:length(dirs)
% %     cd(dirs(i).name);
    % Browse to every assignment folder
    for j = 1:length(deepestAssignFolders)
        % Also copy the subfolder
    end
    cd ..
end