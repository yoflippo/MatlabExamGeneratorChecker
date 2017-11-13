function averageGrade = cCheckStudentSubmissions(Week)
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
InitAll


%% Start with script
debugOutput(DEBUGOUTPUT,'Start with script');
weekNr = num2str(Week);
weekName = ['week' weekNr];
disp(weekName);
subWkFolder = fullfile(con.STUDENTSUBFOLDER,weekName);

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
removeDirectoriesFromFolder(fullfile(pwd,subWkFolder))
% Get files in the folder for analysis
files = dir(subWkFolder);

% Get studentnumbers of students that submitted AND unzip the folder
cd(subWkFolder);
studentsThatSubmitted = cell(1,length(files)-2);
for i = 3:length(files)
    apCurrZip = fullfile(apSubmitted,files(i).name);
    if contains(files(i).name,'.zip')
        if ~contains(files(i).name,'Checked')
            tmpTxt = erase(files(i).name,'.zip');
            tmpTxt = erase(tmpTxt,[weekName '_']);
            tmpTxt = erase(tmpTxt,'Biostatica_ToSubmit_');
            studentsThatSubmitted{i-2} = tmpTxt;
            unzip(apCurrZip);
            % % %     delete(apCurrZip);
        else %delete Checked zipfiles
            delete(apCurrZip);
        end
    else
        delete(apCurrZip)
    end
end
cd(con.BASEFOLDER);

%% Load the old studentNumbers
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
assCurrWk = fullfile(con.BASEFOLDER,con.NAMEASSIGNMENTFOLDER,weekName);
dicWithHashes = GetDictionaryWithHashAndLocation(assCurrWk,con.SOLPOSTFIX);
save(fullfile(assCurrWk,'dicHashesAbsPath.mat'),'dicWithHashes')

% Iterate through student directories and read the hash strings from their
% files.
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

%% Check for each student if they have their correct assignments
debugOutput(DEBUGOUTPUT,'Check for each student if they have their correct assignments',0);
%% Check for each student if they have their correct assignments
% Iterate over studentfolder to check if they present mfiles contains the
% ASSIGNED files. A student could exchange assigned files with another
% student


% Load the information assigned for this week
load(fullfile(con.NAMEASSIGNMENTFOLDER,weekName,['assignedHashes_' weekName]));

for i = 1:length(trackStudentAssignment)
    try %!!!
        % Get hash codes of current student
        HCodeCurrStud = {trackStudentAssignment{i,2:end}};
        % Go inside student folder
        relPath = fullfile(con.STUDENTSUBFOLDER,weekName,trackStudentAssignment{i,1});
        cd(relPath);
        % Get hashcodes in student folder
        [HashCodeCurrStud, AbsPathCodeCurrStud] = GetHashCodeOfMFilesInFolder(weekName);
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
                mkdir(fullfile(weekName,FOLDERCHEAT,subdir));
                movefile(AbsPathCodeCurrStud{j},fullfile(weekName,con.FOLDERCHEAT, ...
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
%% Get the number of points for all week assignments


apAssWk = fullfile(con.BASEFOLDER,con.NAMEASSIGNMENTFOLDER,weekName);
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
        tmp = extractAfter(dr,'week');
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
save(fullfile(con.BASEFOLDER,con.NAMEASSIGNMENTFOLDER,weekName,'dicAssignmentsAndPoints.mat'),'dicNameAssignmentAndPoints')

% Delete a possible existing studentMatrix
pathStudentResults = fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER,['resultatenWeek' weekNr '.mat']);
if exist(pathStudentResults,'dir')
    delete(pathStudentResults)
end

%% Check the answer of the students and track their points if correct
debugOutput(DEBUGOUTPUT,'Check the answer of the students and track their points if correct',0);
addpath(genpath(fullfile(con.NAMEASSIGNMENTFOLDER,weekName)));
PointsToBeEarned = sum(pointsPerAssignment);
% Load the answer files
eval(['load(''answerfiles_week' weekNr ''')'])
% Go to folder with unzipped files
apSubWk = fullfile(con.BASEFOLDER, con.STUDENTSUBFOLDER,weekName);
cd(apSubWk);

%% Iterate over every unzipped folder/studentnumber
% Remove Check-files from path
warning off
rmpath(genpath(fullfile(con.BASEFOLDER,con.NAMEASSIGNMENTFOLDER,weekName)));
warning on

strTrackStudent = cellstr(trackStudentAssignment);
studentMatrix = ones(length(strTrackStudent(:,1)),2);
cnt = 1;
for sn = 1:length(strTrackStudent(:,1))
    studentFolder = trackStudentAssignment{sn,1}
    if exist(studentFolder,'dir')
        tic
        %% Check all the assigned assignments of individual students
        points = CheckSingleStudentAssignment(studentFolder,dicWithHashes, ...
            dicNameAssignmentAndPoints);
        grade = ((points/PointsToBeEarned)*9)+1;
        studentMatrix(sn,1) = str2double(studentFolder);
        studentMatrix(sn,2) = round(grade,1);
        checkedStudent(cnt) = studentMatrix(sn,2);
        cnt = cnt + 1;
        % Give the student a grade, first make some text
        cCheck_GradeText;
        makeMFileFromCells(fullfile(apSubmitted,studentFolder,'JouwCijfer'),t);
        % Copy files to a new folder
        nmNewFolder = ['Checked_' studentFolder];
        copyfile(studentFolder,nmNewFolder);
        % Zip checked folder
        zipFilePathName = [nmNewFolder '.zip'];
        zip(zipFilePathName,nmNewFolder)
        % Remove Folder
        dr = fullfile(apSubmitted,nmNewFolder);
        removeShitFromDir(dr);
        rmdir(dr);
        toc
    else
        studentMatrix(sn,1) = str2double(studentFolder);
        studentMatrix(sn,2) = round(1.0,1);
    end
end
studentMatrix
save(pathStudentResults,'studentMatrix');
averageGrade = mean(checkedStudent)

cd(con.BASEFOLDER);

end