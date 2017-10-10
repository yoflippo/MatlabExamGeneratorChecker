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
subWkFolder = fullfile(STUDENTSUBFOLDER,weekName);

%% Check if needed folder exists, if not stop execution of script
debugOutput(DEBUGOUTPUT,'Check if needed folder exists, if not stop execution of script',0);

if ~exist(STUDENTSUBFOLDER)
    mkdir(STUDENTSUBFOLDER)
end
if ~exist(subWkFolder)
    mkdir(subWkFolder)
    error('Needed subdirectory does not exist, execution of script is stopped!, put ZIPPED student submission in folder');
end

%% Check which students have submitted their assignments. Student without do not get any points
debugOutput(DEBUGOUTPUT,'Check which students have submitted their assignments. Student without do not get any points',0);

% Find studentnumbers
load(fullfile(NAMEASSIGNMENTFOLDER,STUDENTNUMBERMAT))
% Remove directories from folder, they contain unzipped files and they are
% unusable because you are running this script
apSubmitted = fullfile(pwd,subWkFolder);
addpath(genpath(apSubmitted))
removeDirectoriesFromFolder(fullfile(pwd,subWkFolder))
% Get files in the folder for analysis
files = dir(subWkFolder);

% Get studentnumbers of students that submitted AND unzip the folder
cd(subWkFolder);
studentsThatSubmitted = [];
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
cd(BASEFOLDER);

%% Load the old studentNumbers
load(fullfile(NAMEASSIGNMENTFOLDER,STUDENTNUMBERMAT));
% Display how many students did not submit
numOfNotSubmitted = length(studentNumbers)-length(studentsThatSubmitted);
if length(studentsThatSubmitted) == 0
    error('Something went wrong: no student submission');
end
disp([ num2str(numOfNotSubmitted) ' students did not submit their assignments'])

%% TODO: check if studentnumber file in studentfolder has correct studentnumber

%% Check if the HASH-codes in every m-file of the students is intact
debugOutput(DEBUGOUTPUT,'Check if the HASH-codes in every m-file of the students is intact',0);
cCheck_HashCodeIntact

%% Check for each student if they have their correct assignments
debugOutput(DEBUGOUTPUT,'Check for each student if they have their correct assignments',0);
cCheck_StudentHasCorrectAssignment
cd(BASEFOLDER);

%% Get the points for each assignment and make dic with points + nameOfAssignment
debugOutput(DEBUGOUTPUT,'Get the number of points for all week assignments',0);
cCheck_NumberOfPointsWeekAss

% Put in dictionary and save in MAT-file
debugOutput(DEBUGOUTPUT,'Put in dictionary and save in MAT-file',0);

dicNameAssignmentAndPoints = containers.Map(nameOfAssignment,pointsPerAssignment);
save(fullfile(BASEFOLDER,NAMEASSIGNMENTFOLDER,weekName,'dicAssignmentsAndPoints.mat'),'dicNameAssignmentAndPoints')

% Delete a possible existing studentMatrix
pathStudentResults = fullfile(BASEFOLDER,STUDENTSUBFOLDER,['resultatenWeek' weekNr '.mat']);
if exist(pathStudentResults)
    delete(pathStudentResults)
end
studentMatrix = [];

%% Check the answer of the students and track their points if correct
debugOutput(DEBUGOUTPUT,'Check the answer of the students and track their points if correct',0);
addpath(genpath(fullfile(NAMEASSIGNMENTFOLDER,weekName)));
PointsToBeEarned = sum(pointsPerAssignment);
% Load the answer files
eval(['load(''answerfiles_week' weekNr ''')'])
% Go to folder with unzipped files
apSubWk = fullfile(BASEFOLDER, STUDENTSUBFOLDER,weekName);
cd(apSubWk);

%% Iterate over every unzipped folder/studentnumber
% Remove Check-files from path
warning off
rmpath(genpath(fullfile(BASEFOLDER,NAMEASSIGNMENTFOLDER,weekName)));
warning on

strTrackStudent = cellstr(trackStudentAssignment);
for sn = 1:length(strTrackStudent(:,1))
    studentFolder = trackStudentAssignment{sn,1}
    if exist(studentFolder)
        tic
        %% Check all the assigned assignments of individual students
        points = CheckSingleStudentAssignment(studentFolder,dicWithHashes, ...
            dicNameAssignmentAndPoints,answerFilesInDir);
        grade = ((points/PointsToBeEarned)*9)+1;
        studentMatrix(sn,1) = str2num(studentFolder);
        studentMatrix(sn,2) = round(grade,1);
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
        studentMatrix(sn,2) = round(1.0,1);
    end
end
studentMatrix
save([pathStudentResults],'studentMatrix');
averageGrade = mean(studentMatrix(:,2))

cd(BASEFOLDER);

end