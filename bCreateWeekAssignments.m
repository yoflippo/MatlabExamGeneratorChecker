%CREATEWEEKASSIGNMENTS
%   This is the second file needed to generate files for the course. The
%   file depends on the Constants.m and the WEEK variable.
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
% TODO: Give a message to student as last assigment to zip the folder
% before submitting
% TODO: Create a script that generates the solutions per student
%
%

% $Revisi0n: 0.0.0 $  $Date: 2017-07-27 $
% Creation of script.

%% Start Fresh
InitAll
debugOutput(DEBUGOUTPUT,['Generating assignents for WEEK: ' num2str(WEEK)]);

correct = input(['Is this the correct week?: ' num2str(WEEK) ...
    ' (not giving an answer is YES)']);
if ~isempty(correct)
    disp('Script is STOPPED because the WEEK (see: initAll.m) has to be changed');
    return
end

%% Create a working folder for submitted student assignments
debugOutput(DEBUGOUTPUT,'Create a working folder for submitted student assignments',1);

pathWkDirName = fullfile(BASEFOLDER, STUDENTASSFOLDER, WEEKNAME);
%remove folder if it exists
if exist(STUDENTASSFOLDER) && isequal(WEEK,0)
    dirToRemove = STUDENTASSFOLDER;
else
    dirToRemove = pathWkDirName;
end
removeShitFromDir(dirToRemove);

%% Empty folder with files for testing
debugOutput(DEBUGOUTPUT,'Empty folder with files for testing',1);
currTestDir = fullfile(BASEFOLDER,TESTFOLDER,WEEKNAME);
if ~exist(currTestDir)
    mkdir(currTestDir);
else
    removeShitFromDir(currTestDir);
end


%% Create a student specific folder in every week folder
debugOutput(DEBUGOUTPUT,'Create a student specific folder in every week folder',1);

% Load the studentnumbers, they are randomly presented
load(fullfile(NAMEASSIGNMENTFOLDER,STUDENTNUMBERMAT));
% Create weekfolders
if ~exist(pathWkDirName)
    mkdir(pathWkDirName)
end
% Create a STUDENTASSFOLDER inside every weekfolder
for i = 1:length(studentNumbers)
    ptmp = fullfile(pathWkDirName,num2str(studentNumbers(i)));
    if exist(ptmp) == 0
        mkdir(ptmp);
    end
end

%% Get overview of files
debugOutput(DEBUGOUTPUT,'Get overview of files',1);

% The studentNumbers variable is randomly generated. So assignments in
% folder can be assigned sequently to the studentNumbers without
% introducing some kind of detectable order.
global output; output = [];
absPathCurrAssFolder = fullfile(BASEFOLDER,NAMEASSIGNMENTFOLDER,WEEKNAME);
deepestAssignFolders = GetDeepestFolders(absPathCurrAssFolder);
% Make path
for nTypeAss = 1:length(deepestAssignFolders)
    deepestAssignFolders{nTypeAss} = extractAfter(deepestAssignFolders{nTypeAss},NAMEASSIGNMENTFOLDER);
    deepestAssignFoldersWithoutWeek{nTypeAss} = extractAfter(deepestAssignFolders{nTypeAss},WEEKNAME);
    % Count the number of assignment in every folder (with 'SOLPOSTFIX')
    currPath = pwd;
    cd(fullfile(NAMEASSIGNMENTFOLDER,deepestAssignFolders{nTypeAss}));
    answerFilesInDir{nTypeAss} = dir(['*' SOLPOSTFIX '*']);
    numberOfAssignmentInDir(nTypeAss) = length(answerFilesInDir{nTypeAss});
    cd(currPath);
end
% Save the answer files in the corresponding week folder
save(fullfile(NAMEASSIGNMENTFOLDER,WEEKNAME,['answerfiles_' WEEKNAME '.mat']),'answerFilesInDir');


%% Fill every student folder with the number of assignments
debugOutput(DEBUGOUTPUT,'Fill every student folder with the number of assignments',1);

answerFileCounter = ones(1,length(deepestAssignFolders));
% create a variable to save their personal Hashes for anti-cheating
% purposes, this cell is used to make a dictionary
trackStudentAssignment = num2cell(zeros(length(studentNumbers), ...
    length(deepestAssignFolders))+1);

for nStud = 1:length(studentNumbers)
    warning off
    % Browse to every assignment folder, PLEASE NOTICE: randonmness is used
    % by shuffling the studentNumbers in the studentlist.
    studentDir = num2str(studentNumbers(nStud));
    % % %     studentDirSol = fullfile('SOL',studentDir);
    studentDirSol = studentDir;
    trackStudentAssignment{nStud,1} = studentDir;
    currStudentDir = fullfile(pathWkDirName,studentDir);
    % % %     currStudentDirSol = fullfile(pathWkDirName,studentDirSol);
    weekNameSol = [WEEKNAME SOLPOSTFIX];
    pathWkDirNameSol = [pathWkDirName SOLPOSTFIX];
    currStudentDirSol = fullfile(pathWkDirNameSol,studentDirSol);
    if ~exist(currStudentDirSol)
        mkdir(currStudentDirSol)
    end
    % Loop through the assignments
    for nAss = 1:length(deepestAssignFolders)
        % initiate counter for current assignment
        cnt = answerFileCounter(nAss);
        currFileSol = [deepestAssignFolders{nAss} filesep answerFilesInDir{1,nAss}(cnt).name];
        % rename the file to a file without nTypeAss
        currFile = replace(currFileSol,SOLPOSTFIX,'');
        % file to copy
        sourceFile = [NAMEASSIGNMENTFOLDER currFile];
        sourceFileSOL = [NAMEASSIGNMENTFOLDER currFileSol];
        % remove redundant folder
        currFileClean = GetPathOneLevelUp(currFile);
        % create the path string with final naming
        finFileLoc = [currStudentDir currFileClean EXT];
        finFileLocSOL = [currStudentDirSol currFileClean EXT];
        % Copy file from unique assignment dir to student folder with
        % subdirs
        pathCurrAss = [pathWkDirName filesep studentDir ...
            GetPathOneLevelUp(deepestAssignFolders{nAss})];
        pathCurrAssSOL = [pathWkDirNameSol filesep studentDir ...
            GetPathOneLevelUp(deepestAssignFolders{nAss})];
        mkdir(pathCurrAss);
        mkdir(pathCurrAssSOL);
        copyfile(sourceFile,finFileLoc);
        copyfile(sourceFileSOL,finFileLocSOL);
        % Get hash and save if for anti-cheating purposes
        hash = GetHashCodeFromMFile(finFileLoc);
        trackStudentAssignment{nStud,nAss+1} = hash;
        % Reset counter if last file is reached
        if isequal(numberOfAssignmentInDir(nAss),answerFileCounter(nAss))
            answerFileCounter(nAss) = 1;
        else
            answerFileCounter(nAss) = cnt + 1;
        end
    end
    
    % Copy the finishing script that a student needs to use
    finScriptStud = fullfile(BASEFOLDER,LISTWITHNEEDEDFOLDERS{2},'headers',...
        NAMEZIPMFILEFORSTUDENTS);
    copyfile(finScriptStud,fullfile(currStudentDir,WEEKNAME));
    copyfile(finScriptStud,fullfile(currStudentDirSol,WEEKNAME));
    
    % Create a file with the studentnumber
    fid = fopen(fullfile(currStudentDir,WEEKNAME,'studentnummer.m'),'w');
    fprintf(fid,'%s',['currentStudentNumber = num2str(' studentDir ');']);
    fclose(fid);
    % Create a file with the studentnumber
    fid = fopen(fullfile(currStudentDirSol,WEEKNAME,'studentnummer.m'),'w');
    fprintf(fid,'%s',['currentStudentNumber = num2str(' studentDir ');']);
    fclose(fid);
    
    % Zip the assignment and give it the student number corresponding to the
    % student.
    currPath = pwd;
    cd(currStudentDir);
    zipFilePathName = ['..' filesep WEEKNAME '_' studentDir '.zip'];
    zip(zipFilePathName,pwd)
    cd(currPath);
    cd(currStudentDirSol);
    zip(zipFilePathName,pwd)
    cd(currPath);
    
    %% Important VARIABLE for creating test folders! Make zero if test files
    % arent necessary. Please be aware that a high number of testfiles will
    % cause needless overhead.
    nTestFiles = 4;
    if nTestFiles > length(studentNumbers)
        nTestFiles = length(studentNumbers);
    end
    
    %% Move the student folder that is previously zipped
    if nTestFiles >= nStud
        % Copy raw files
        rawFilesTestDir = fullfile(currTestDir,'raw',studentDir);
        rawFilesTestDirSol = fullfile(currTestDir,'rawsol',studentDir);
        movefile(currStudentDir,rawFilesTestDir);
        movefile(currStudentDirSol,rawFilesTestDirSol);
    else
        % Delete the remaing files
        removeShitFromDir(currStudentDir);
        rmdir(currStudentDir);
        removeShitFromDir(currStudentDirSol);
        rmdir(currStudentDirSol);
    end
    warning on
end

%% Generate some test folders for the Checking script
debugOutput(DEBUGOUTPUT,'Generate some test files for the Checking script',1);

% Get the paths names of zip files
currPath = pwd;
cd(pathWkDirName);
noAnsZF = dir(['**' filesep '*.zip']);
cd(currPath);
cd(pathWkDirNameSol);
solZF = dir(['**' filesep '*.zip']);
cd(currPath);

% Now Generate nTestFiles different folders with student-assignments containing
% no-answers to all answers.
for nTDir = 0:nTestFiles
    % Create folder
    prcCorrect = round((nTDir/nTestFiles)*100);
    pathCurrTestDir = fullfile(currTestDir,['correct_' num2str(prcCorrect)]);
    mkdir(pathCurrTestDir);
    
    for nF = 1:nTestFiles
        if nTDir >= nF
            absPathNA = fullfile(solZF(nF).folder,solZF(nF).name);
        else
            absPathNA = fullfile(noAnsZF(nF).folder,noAnsZF(nF).name);
        end
        copyfile(absPathNA,pathCurrTestDir);
    end
end

%% Generate test folders with data to simulate students with wrong assignments
debugOutput(DEBUGOUTPUT,'Generate test folders with data to simulate students with wrong assignments',1);

% Todo: Generate a test folder in which students only have wrong assignments


% Todo: Generate a test folder in which students have doubled their assignments




%% Save the studentNumbers and their assigned hashes
save(fullfile(NAMEASSIGNMENTFOLDER,WEEKNAME,['assignedHashes_' WEEKNAME]) ...
    ,'trackStudentAssignment');

%% Zip the folder with zipped-assignments per student and delete that folder
debugOutput(DEBUGOUTPUT,'Zip the folder with zipped-assignments per student and delete that folder',1);

if askuser(' Zip all files?',false)
    cd(STUDENTASSFOLDER)
    zip([NAMEZIPPEDWEEK num2str(YEAR) '_' WEEKNAME '.zip'],WEEKNAME)
    cd(BASEFOLDER)
end

if askuser(' Empty the student_assignments folder?',false)
    removeShitFromDir(pathWkDirName)
end

debugOutput(DEBUGOUTPUT,'END SCRIPT',1);