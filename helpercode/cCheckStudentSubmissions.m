function [averageGrade, studentMatrix] = cCheckStudentSubmissions(con,nmCurrBonusAss)
%CHECKSTUDENTSUBMISSIONS
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
%
%
%
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
%

% $Revisi0n: 0.0.0 $  $Date: 2017-07-29 $
% Creation of script

%% Start with script
global DEBUGOUTPUT;
debugOutput(DEBUGOUTPUT,'Start with script');
dbstop if error
subWkFolder = fullfile(con.STUDENTSUBFOLDER,nmCurrBonusAss);

%% Check if needed folder exists, if not stop execution of script
debugOutput(DEBUGOUTPUT,'Check if needed folder exists, if not stop execution of script',0);

if ~exist(con.STUDENTSUBFOLDER,'dir')
    mkdir(con.STUDENTSUBFOLDER)
end
if ~exist(subWkFolder,'dir')
    mkdir(subWkFolder)
    error('Needed subdirectory does not exist, execution of script is stopped!, put ZIPPED student submission in folder');
end

%% Check which students have submitted their assignments. Student without do not get any points
debugOutput(DEBUGOUTPUT,'Check which students have submitted their assignments. Student without do not get any points',0);

% Find studentnumbers
load(fullfile(con.NAMEASSIGNMENTFOLDER,con.STUDENTNUMBERMAT))

% Remove directories from folder, they contain unzipped files and they are
% unusable because you are running this script
apSubmitted = fullfile(pwd,subWkFolder);
addpath(genpath(apSubmitted))
% % % % % % % % removeDirectoriesFromFolder(fullfile(pwd,subWkFolder))
% Get files in the folder for analysis
files = dir(subWkFolder);

% Get studentnumbers of students that submitted AND unzip the folder
apWrongSub = fullfile(con.BASEFOLDER, con.STUDENTSUBFOLDER,[nmCurrBonusAss '_wrongsubmissions']);
apUnzipped = fullfile(con.BASEFOLDER, con.STUDENTSUBFOLDER,[nmCurrBonusAss '_unzipped']);
apChecked = fullfile(con.BASEFOLDER, con.STUDENTSUBFOLDER,[nmCurrBonusAss '_checked']);
mkdirIf(apWrongSub);
mkdirIf(apUnzipped);
mkdirIf(apChecked);
try
    cd(subWkFolder);
    tmpBase = pwd;
    studentsThatSubmitted = cell(1,length(files)-2);
    % Get the right week folders
    for i = 3:length(files)
        apCurrZip = fullfile(apSubmitted,files(i).name);
        if contains(files(i).name,'.zip')
            if ~contains(files(i).name,'Checked') %% && contains(files(i).name,'ToSubmit')
                studentsThatSubmitted{i-2} = findStudentNumberInTxt(files(i).name);
                mkdir(studentsThatSubmitted{i-2})
                cd(studentsThatSubmitted{i-2})
                currPath = pwd;
                mkdir('temp');
                cd('temp');
                unzip(apCurrZip);
                %Remove dirs without correct weekX assignment
                neededDir = dirmf(nmCurrBonusAss);
                blSubmittedWrongFiles = true;
                for nD = 1:length(neededDir)
                    if ~isempty(neededDir) && neededDir(nD).isdir && isequal(neededDir(nD).name,nmCurrBonusAss)
                        dirToCheck = fullfile(neededDir(nD).folder,neededDir(nD).name);
                        movefile(dirToCheck,currPath);
                        blSubmittedWrongFiles = false;
                        break;
                    end
                end
                if blSubmittedWrongFiles
                    movefile(apCurrZip,apWrongSub);
                end
                %Delete everything but current week folder
                cd ..
                removeShitFromDir('temp')
                rmdir('temp')
                try
                    movefile(apCurrZip,apUnzipped);
                catch
                    currPath = pwd;
                    cd ..
                    rmdir(currPath)
                end
            else
                movefile(apCurrZip,apChecked);
            end
        else % not a zip-file but something else
            %             keyboard
            if ~exist('blRemoveFolders','var') && input('Do you want to delete all remaining folders? Yes=1, No=0')
                blRemoveFolders = true;
            else
                blRemoveFolders = false;
            end
            if blRemoveFolders
                warning off
                delete(apCurrZip)
                removeShitFromDir(apCurrZip)
                rmdirIf(apCurrZip)
                warning on
            end
        end
        cd(tmpBase);
    end
    % Remove .asv files
    asvFiles = dirmf('.asv');
    for nA = 1:length(asvFiles)
        delete(fullfile(asvFiles(nA).folder,asvFiles(nA).name));
    end
    cd(con.BASEFOLDER);
catch err
    keyboard
    error([mfilename ': Something went wrong with unzipping!' newline err.message newline]);
end

%% Count number of assignemts and distinguish between theses/programming
apAssBonus = fullfile(con.BASEFOLDER,con.Assignments,nmCurrBonusAss);
cd(apAssBonus)
numTheses = length(dirmf('TypeOfAssignment_Multiplechoice'));

%% Load the old studentNumbers
cd(con.BASEFOLDER);
load(fullfile(con.NAMEASSIGNMENTFOLDER,con.STUDENTNUMBERMAT));
% Display how many students did not submit
numOfNotSubmitted = length(studentNumbers)-length(studentsThatSubmitted);
if isempty(studentsThatSubmitted)
    error('Something went wrong: no student submission');
end
disp([ num2str(numOfNotSubmitted) ' students did not submit their assignments'])

%% TODO: check if studentnumber file in studentfolder has correct studentnumber

%% Check if the HASH-codes in every m-file of the students is intact
debugOutput(DEBUGOUTPUT,'Check if the HASH-codes in every m-file of the students is intact',0);
%% Check if the HASH-codes in every m-file of the students is intact
% Get Hash of original assignment folder AND save it in MAT-file
assCurrWk = fullfile(con.BASEFOLDER,con.NAMEASSIGNMENTFOLDER,nmCurrBonusAss);
dicWithHashes = GetDictionaryWithHashAndLocation(assCurrWk,con.SOLPOSTFIX);
save(fullfile(assCurrWk,'dicHashesAbsPath.mat'),'dicWithHashes')

% Iterate through student directories and read the hash strings from their
% files.
try
    oldPath = pwd;
    cd(subWkFolder);
    mfiles = dir(['**' filesep '*.m']);
    cd(oldPath)
    % If a certain file is manipulated put it in a folder GEEN_PUNTEN
    for nSAss = 1:length(mfiles)
        % Test for files that we use but should not be checked
        blTestIfCorrectFile = true;
        for j = 1:length(con.OTHERFILESINSTUDENTFOLDER)
            if isequal(con.OTHERFILESINSTUDENTFOLDER{j},mfiles(nSAss).name)
                blTestIfCorrectFile = false;
                break;
            end
        end
        % Test for student made files
        if ~contains(mfiles(nSAss).name,'vraag') && ~contains(mfiles(nSAss).name,'opdracht')
            blTestIfCorrectFile = false;
        end
        % Get hashcode from current mfiles
        if blTestIfCorrectFile
            currFileAbsPath = fullfile(mfiles(nSAss).folder,mfiles(nSAss).name);
            [p, subdir] = GetPathOneLevelUp(currFileAbsPath,2);
            [~,~,endSnum] = findStudentNumberInTxt(currFileAbsPath);
            p = fullfile(currFileAbsPath(1:endSnum),nmCurrBonusAss);
            try
                currHash = GetHashCodeFromMFile(currFileAbsPath);
                % Check if hash if present in dictionary
                dicWithHashes(currHash);
            catch
                % Move file in a folder in the variable ADJUSTEDHASH
                mkdir(fullfile(p,con.ADJUSTEDHASH,subdir));
                % replace point of filename with underscore, so it won't be
                % recognised in other scripts as an m-file.
                nameOfFile = strrep(mfiles(nSAss).name,'.','_');
                movefile(currFileAbsPath,fullfile(p,con.ADJUSTEDHASH,subdir,nameOfFile));
                cd(oldPath);
            end
        end
    end
catch err
    keyboard
    warning([mfilename ': ' newline err.message newline txterror]);
end

%% Check for each student if they have their correct assignments
debugOutput(DEBUGOUTPUT,'Check for each student if they have their correct assignments',0);
%% Check for each student if they have their correct assignments
% Iterate over studentfolder to check if they present mfiles contains the
% ASSIGNED files. A student could exchange assigned files with another
% student

% Load the information assigned for this week
load(fullfile(con.NAMEASSIGNMENTFOLDER,nmCurrBonusAss,['assignedHashes_' nmCurrBonusAss]));
for i = 1:length(trackStudentAssignment)
    try %!!!
        % Get hash codes of current student
        HCodeCurrStud = {trackStudentAssignment{i,2:end}};
        % Go inside student folder
        relPath = fullfile(con.STUDENTSUBFOLDER,nmCurrBonusAss,trackStudentAssignment{i,1});
        cd(relPath);
        % Get hashcodes in student folder
        [HashCodeCurrStud, AbsPathCodeCurrStud] = GetHashCodeOfMFilesInFolder(nmCurrBonusAss);
        %% Check if all files are unique, to prevent copies to get more points
        if length(HashCodeCurrStud) ~= length(unique(HashCodeCurrStud))
            keyboard %pause program
            disp('Student has a copy of a file in his/hers directory');
            HashCodeCurrStud = unique(HashCodeCurrStud);
        end
        
        %% Check if the assigned hashcodes are present
        for j = 1:length(HashCodeCurrStud)
            if isempty(find(ismember(HCodeCurrStud,HashCodeCurrStud{j}),1))
                nameOfFile = GetFileNameFromPath(AbsPathCodeCurrStud{j});
                newNameOfCheatFile = strrep(nameOfFile,'.m','_m');
                %Get corresponding subfolder of assignment
                [~, subdir] = GetPathOneLevelUp(AbsPathCodeCurrStud{j},2);
                mkdir(fullfile(nmCurrBonusAss,FOLDERCHEAT,subdir));
                movefile(AbsPathCodeCurrStud{j},fullfile(nmCurrBonusAss,con.FOLDERCHEAT, ...
                    subdir,newNameOfCheatFile));
            end
        end
        cd(con.BASEFOLDER)
    catch %% No error message, because this try is only here because I am too lazy
    end
end
clear HashCodeCurrStud AbsPathCodeCurrStud
cd(con.BASEFOLDER);

%% Get the points for each assignment and make dic with points + nameOfAssignment
debugOutput(DEBUGOUTPUT,'Get the number of points for all week assignments',0);
% Get the number of points for all week assignments

apAssWk = fullfile(con.BASEFOLDER,con.NAMEASSIGNMENTFOLDER,nmCurrBonusAss);
cd(apAssWk);
mfiles = dir(['**' filesep '*points*.m']);
if isempty(mfiles)
    error('Apparently there are NO points.m files found');
end

pointsPerAssignment = zeros(1,length(mfiles));
clear nameOfAssignment
nameOfAssignment = cell(1,length(mfiles));

for i = 1:length(mfiles)
    try
        dr = mfiles(i).folder;
        run(fullfile(dr,mfiles(i).name));
        % Get assignment name + name of folder directly above it
        tmp = extractAfter(dr,nmCurrBonusAss);
        tmp= extractAfter(tmp,filesep);
        nameOfAssignment{i} = tmp;
        pointsPerAssignment(i) = deelpunten;
    catch err
        disp(err);
        error([mfilename ': E2 ' newline]);
    end
end

%% Put in dictionary and save in MAT-file
debugOutput(DEBUGOUTPUT,'Put in dictionary and save in MAT-file',0);

dicNameAssignmentAndPoints = containers.Map(nameOfAssignment,pointsPerAssignment);
save(fullfile(con.BASEFOLDER,con.NAMEASSIGNMENTFOLDER,nmCurrBonusAss,'dicAssignmentsAndPoints.mat'),'dicNameAssignmentAndPoints')

% Delete a possible existing studentMatrix
pathStudentResults = fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER,['resultatenWeek' nmCurrBonusAss '.mat']);
if exist(pathStudentResults,'dir')
    delete(pathStudentResults)
end

%% Check the answer of the students and track their points if correct
debugOutput(DEBUGOUTPUT,'Check the answer of the students and track their points if correct',0);
addpath(genpath(fullfile(con.NAMEASSIGNMENTFOLDER,nmCurrBonusAss)));
PointsToBeEarned = sum(pointsPerAssignment);
% Load the answer files
eval(['load(''answerfiles_' nmCurrBonusAss ''')'])
% Go to folder with unzipped files
apSubWk = fullfile(con.BASEFOLDER, con.STUDENTSUBFOLDER,nmCurrBonusAss);
cd(apSubWk);

%% Create a cell with every student and every assignment to track how each individual assignment if made
unAssignments = unique({trackStudentAssignment{:,2:end}});
studentsColumn = unique({trackStudentAssignment{:,1}}'); %reuse unique, because of possible non-unique students
allStudentsAndAssignments = cell(length(studentsColumn),length(unAssignments));
allStudentsAndAssignments = [studentsColumn allStudentsAndAssignments];
unAssignments = [{''} unAssignments];
allStudentsAndAssignments = [unAssignments; allStudentsAndAssignments];
save('cellAllStudentsAndAssignments.mat','allStudentsAndAssignments')

%% Iterate over every unzipped folder/studentnumber
% Remove Check-files from path
warning off
rmpath(genpath(fullfile(con.BASEFOLDER,con.NAMEASSIGNMENTFOLDER,nmCurrBonusAss)));
rmpath(genpath(fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER)));
warning on

strTrackStudent = cellstr(trackStudentAssignment);
studentMatrix = []; %ones(length(strTrackStudent(:,1)),2);
cnt = 1;
for sn = 1:length(strTrackStudent(:,1))
    cd(apSubWk)
    studentFolder = trackStudentAssignment{sn,1};
    if exist(studentFolder,'dir')
        tic
        try
            % Check all the assigned assignments of individual students
            strPoints = CheckSingleStudentAssignment(studentFolder,dicWithHashes, ...
                dicNameAssignmentAndPoints);
            if strPoints.sumPoints > PointsToBeEarned
                keyboard %something is wrong Bub
            end
            
            %% Calculate Thesis grade
            [grade, grade_theses, grade_prog] = calculateGrade(con, strPoints, numTheses);
                        
            studentMatrix(cnt,1) = str2double(studentFolder);
            studentMatrix(cnt,2) = round(grade,1);
            checkedStudent(cnt) = studentMatrix(cnt,2);
            cnt = cnt + 1;
            % Give the student a grade, first make some text
            cCheck_GradeText;
            makeMFileFromCells(fullfile(apSubmitted,studentFolder,['JouwCijfer_' replace(num2str(round(grade,1)),'.','_')]),t);
            % Copy files to a new folder
            nmNewFolder = ['Checked_' studentFolder];
            mkdirIf(nmNewFolder)
            copyfile(studentFolder,nmNewFolder);
            % Zip checked folder
            zipFilePathName = [nmNewFolder '.zip'];
            zip(zipFilePathName,nmNewFolder)
            movefile(zipFilePathName,apChecked);
            % Remove Folder
            dr = fullfile(apSubmitted,nmNewFolder);
            removeShitFromDir(dr);
            rmdir(dr);
            removeShitFromDir(studentFolder);
            rmdir(studentFolder);
        catch err
            disp([newline 'DO YOUR MAGIC MAESTRO!' newline]);
            keyboard
        end
        toc
%     else %% in case students who did not submit have to be added
%         studentMatrix(sn,1) = str2double(studentFolder);
%         studentMatrix(sn,2) = round(1.0,1);
    end
end
save(pathStudentResults,'studentMatrix');
averageGrade = mean(checkedStudent)

cd(con.BASEFOLDER);

end