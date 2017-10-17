function bCreateWeekAssignments(Weeks)
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
%

% $Revisi0n: 0.0.0 $  $Date: 2017-07-27 $
% Creation of script.


%% Start Fresh
InitAll
dbstop if error
for nW = Weeks
    debugOutput(DEBUGOUTPUT,['Generating assignents for WEEK: ' num2str(Weeks(nW))]);
    
    weekNr = num2str(Weeks(nW));
    weekName = ['week' weekNr];
    apWkDirName = fullfile(con.BASEFOLDER, con.STUDENTASSFOLDER, weekName);
    apWkDirNameSol = [apWkDirName con.SOLPOSTFIX];
    removeShitFromDir(apWkDirName);
    removeShitFromDir(apWkDirNameSol);
    
    %% Empty folder with files for testing
    debugOutput(DEBUGOUTPUT,'Empty folder with files for testing',1);
    currTestDir = fullfile(con.BASEFOLDER,con.TESTFOLDER,weekName);
    if ~exist(currTestDir,'dir')
        mkdir(currTestDir);
    else
        removeShitFromDir(currTestDir);
    end
    
    %% Create a student specific folder in every week folder
    debugOutput(DEBUGOUTPUT,'Create a student specific folder in every week folder',1);
    
    % Load the studentnumbers, they are randomly presented
    load(fullfile(con.NAMEASSIGNMENTFOLDER,con.STUDENTNUMBERMAT));
    % Create weekfolders
    if ~exist(apWkDirName,'dir')
        mkdir(apWkDirName)
    end
    % Create a con.STUDENTASSFOLDER inside every weekfolder
    for i = 1:length(studentNumbers)
        ptmp = fullfile(apWkDirName,num2str(studentNumbers(i)));
        if exist(ptmp,'dir') == 0
            mkdir(ptmp);
        end
    end
    
    %% Get overview of files
    debugOutput(DEBUGOUTPUT,'Get overview of files',1);
    
    % The studentNumbers variable is randomly generated. So assignments in
    % folder can be assigned sequently to the studentNumbers without
    % introducing some kind of detectable order.
    absPathCurrAssFolder = fullfile(con.BASEFOLDER,con.NAMEASSIGNMENTFOLDER,weekName);
    deepestAssignFolders = GetDeepestFolders(absPathCurrAssFolder);
    % Make path
    nDeepestDir = length(deepestAssignFolders);
    numberOfAssignmentInDir = zeros(1,nDeepestDir);
    answerFilesInDir = cell(1,nDeepestDir);
    for nTypeAss = 1:nDeepestDir
        deepestAssignFolders{nTypeAss} = extractAfter(deepestAssignFolders{nTypeAss},con.NAMEASSIGNMENTFOLDER);
        % Count the number of assignment in every folder (with 'SOLPOSTFIX')
        currPath = pwd;
        cd(fullfile(con.NAMEASSIGNMENTFOLDER,deepestAssignFolders{nTypeAss}));
        answerFilesInDir{nTypeAss} = dir(['*' con.SOLPOSTFIX '*']);
        if isequal(length(answerFilesInDir{nTypeAss}),0)
            error('A folder without files detected');
        end
        numberOfAssignmentInDir(nTypeAss) = length(answerFilesInDir{nTypeAss});
        cd(currPath);
    end
    % Save the answer files in the corresponding week folder
    save(fullfile(con.NAMEASSIGNMENTFOLDER,weekName,['answerfiles_' weekName '.mat']),'answerFilesInDir');
    
    %% Fill every student folder with the number of assignments
    debugOutput(DEBUGOUTPUT,'Fill every student folder with the number of assignments',1);
    
    answerFileCounter = ones(1,length(deepestAssignFolders));
    % create a variable to save their personal Hashes for anti-cheating
    % purposes, this cell is used to make a dictionary
    trackStudentAssignment = num2cell(zeros(length(studentNumbers), ...
        length(deepestAssignFolders))+1);
    
    for nStud = 1:length(studentNumbers)
        
        % Browse to every assignment folder, PLEASE NOTICE: randonmness is used
        % by shuffling the studentNumbers in the studentlist.
        studentDir = num2str(studentNumbers(nStud));
        studentDirSol = studentDir;
        trackStudentAssignment{nStud,1} = studentDir;
        currStudentDir = fullfile(apWkDirName,studentDir);
        apWkDirNameSol = [apWkDirName con.SOLPOSTFIX];
        currStudentDirSol = fullfile(apWkDirNameSol,studentDirSol);
        if ~exist(currStudentDirSol,'dir')
            mkdir(currStudentDirSol)
        end
        % Loop through the assignments
        for nAss = 1:length(deepestAssignFolders)
            try
                % initiate counter for current assignment
                cnt = answerFileCounter(nAss);
                currFileSol = [deepestAssignFolders{nAss} filesep answerFilesInDir{1,nAss}(cnt).name];
                % rename the file to a file without nTypeAss
                currFile = replace(currFileSol,con.SOLPOSTFIX,'');
                % file to copy
                sourceFile = [con.NAMEASSIGNMENTFOLDER currFile];
                sourceFileSOL = [con.NAMEASSIGNMENTFOLDER currFileSol];
                % remove redundant folder
                currFileClean = GetPathOneLevelUp(currFile);
                % create the path string with final naming
                finFileLoc = [currStudentDir currFileClean con.EXT];
                finFileLocSOL = [currStudentDirSol currFileClean con.EXT];
                % Copy file from unique assignment dir to student folder with
                % subdirs
                pathCurrAss = [apWkDirName filesep studentDir ...
                    GetPathOneLevelUp(deepestAssignFolders{nAss})];
                pathCurrAssSOL = [apWkDirNameSol filesep studentDir ...
                    GetPathOneLevelUp(deepestAssignFolders{nAss})];
                mkdirIf(pathCurrAss);
                mkdirIf(pathCurrAssSOL);
                copyfile(sourceFile,finFileLoc);
                copyfile(sourceFileSOL,finFileLocSOL);
                % Get hash and save if for anti-cheating purposes
                hash = GetHashCodeFromMFile(finFileLoc);
                if isempty(hash)
                    error('No Hash File found!');
                end
                
                trackStudentAssignment{nStud,nAss+1} = hash;
                % Reset counter if last file is reached
                if isequal(numberOfAssignmentInDir(nAss),answerFileCounter(nAss))
                    answerFileCounter(nAss) = 1;
                else
                    answerFileCounter(nAss) = cnt + 1;
                end
            catch err
                disp(err);
            end
        end
        
        % Copy the finishing script that a student needs to use
        finScriptStud = fullfile(con.BASEFOLDER,con.LISTWITHNEEDEDFOLDERS{2},'headers',...
            con.NAMEZIPMFILEFORSTUDENTS);
        copyfile(finScriptStud,fullfile(currStudentDir,weekName));
        copyfile(finScriptStud,fullfile(currStudentDirSol,weekName));
        
        %% Copy the finishing assignments that a student needs to use
        finScriptStud = fullfile(con.BASEFOLDER,con.LISTWITHNEEDEDFOLDERS{2},'headers',...
            con.LASTASSIGNMENT);
        % get the number of assignments starting from 1
        apCurrStudWk = fullfile(currStudentDir,weekName);
        cd(apCurrStudWk);
        numAssignment = getFolders(pwd);
        numLastAss = str2double(replace(numAssignment{end},'deelopdracht_',''))+1;
        nmLastAssignmentDir = ['deelopdracht_' num2str(numLastAss)];
        
        mkdirIf(nmLastAssignmentDir);
        copyfile(finScriptStud,fullfile(apCurrStudWk,nmLastAssignmentDir));
        nmLastAssignmentSolDir = fullfile(currStudentDirSol,weekName,nmLastAssignmentDir);
        mkdirIf(nmLastAssignmentSolDir);
        copyfile(finScriptStud,nmLastAssignmentSolDir);
        cd(con.BASEFOLDER);
        
        % Create a file with the studentnumber
        fid = fopen(fullfile(currStudentDir,weekName,'studentnummer.m'),'w');
        fprintf(fid,'%s',['currentStudentNumber = num2str(' studentDir ');']);
        fclose(fid);
        % Create a file with the studentnumber
        fid = fopen(fullfile(currStudentDirSol,weekName,'studentnummer.m'),'w');
        fprintf(fid,'%s',['currentStudentNumber = num2str(' studentDir ');']);
        fclose(fid);
        
        % Zip the assignment and give it the student number corresponding to the
        % student.
        currPath = pwd;
        cd(currStudentDir);
        zipFilePathName = ['..' filesep weekName '_' studentDir '.zip'];
        zip(zipFilePathName,pwd)
        cd(currPath);
        cd(currStudentDirSol);
        zip(zipFilePathName,pwd)
        cd(currPath);
        
        %% Important VARIABLE for creating test folders! Make zero if test files
        % arent necessary. Please be aware that a high number of testfiles will
        % cause needless overhead.
        nTestFiles = 5;
        if nTestFiles > length(studentNumbers)
            nTestFiles = length(studentNumbers);
        end
        
        %% Move the student folder that is previously zipped
        if nTestFiles >= nStud
            % Copy raw files
            rawFilesTestDir = fullfile(currTestDir,'raw',studentDir);
            rawFilesTestDirSol = fullfile(currTestDir,'rawsol',studentDir);
            mkdirIf(rawFilesTestDir);
            mkdirIf(rawFilesTestDirSol);
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
    cd(apWkDirName);
    noAnsZF = dir(['**' filesep '*.zip']);
    cd(currPath);
    cd(apWkDirNameSol);
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
    save(fullfile(con.NAMEASSIGNMENTFOLDER,weekName,['assignedHashes_' weekName]) ...
        ,'trackStudentAssignment');
    
end
debugOutput(DEBUGOUTPUT,'END SCRIPT',1);

end