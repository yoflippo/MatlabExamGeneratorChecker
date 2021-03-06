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

apWrongSub = fullfile(con.BASEFOLDER, con.STUDENTSUBFOLDER,[nmCurrBonusAss '_wrongsubmissions']);
apUnzipped = fullfile(con.BASEFOLDER, con.STUDENTSUBFOLDER,[nmCurrBonusAss '_unzipped']);
apChecked = fullfile(con.BASEFOLDER, con.STUDENTSUBFOLDER,[nmCurrBonusAss '_checked']);
apFeedback = fullfile(con.BASEFOLDER, con.STUDENTSUBFOLDER,[nmCurrBonusAss '_feedbackStudent']);
mkdirIf(apWrongSub);
mkdirIf(apUnzipped);
mkdirIf(apChecked);
mkdirIf(apFeedback);
blWrongZipFile = false;
files = dir(subWkFolder);
try
    cd(subWkFolder);
    tmpBase = pwd;
    studentsThatSubmitted = cell(1,length(files)-2);
    % Get the right week folders
    for nF = 3:length(files)
        apCurrZip = fullfile(apSubmitted,files(nF).name);
        if contains(files(nF).name,'.zip')
            if ~contains(files(nF).name,'Checked') %% && contains(files(nF).name,'ToSubmit')
                studentsThatSubmitted{nF-2} = findStudentNumberInTxt(files(nF).name);
                mkdir(studentsThatSubmitted{nF-2})
                cd(studentsThatSubmitted{nF-2})
                currPath = pwd;
                mkdir('temp');
                cd('temp');
                try
                    unzip(apCurrZip);
%                     cellfun(@(x) x(1:3),C,'UniformOutput',false)
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
                    rmdir('temp','s')
                    try
                        movefile(apCurrZip,apUnzipped);
                    catch
                        currPath = pwd;
                        cd ..
                        rmdir(currPath,'s')
                    end
                catch err
                    warning([mfilename ': Something went wrong with unzipping!' newline err.message newline]);
                    if ~blWrongZipFile && ~input('Read the Warning: do you want to continue? Yes=1, No=0 ')
                        error([mfilename ': Stopped! ']);
                    else
                        blWrongZipFile = true;
                        movefile(apCurrZip,apWrongSub);
                        % Remove unzipped folder with wrong submission
                        currStudNumber = findStudentNumberInTxt(apCurrZip);
                        cd(apSubmitted);
                        removeShitFromDir(currStudNumber);
                        rmdirIf(currStudNumber);
                    end
                end
            else
                movefile(apCurrZip,apChecked);
            end
            
        else % not a zip-file but something else
            %             keyboard
            if ~exist('blRemoveFolders','var') && input('Do you want to delete all remaining folders in the submitted directory? Yes=1, No=0 ')
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
            if contains(files(nF).name,'.txt')
                delete(apCurrZip);
            end
        end
        cd(tmpBase);
    end
    
    %% Remove non-relevavnt files
    cd(apSubmitted);
    %     keyboard % This part has to be checked
    cellExt2Keep = {'.m' '.txt' '.csv' '.dat' '.xls' '.xlsx'};
    removeFilesFromDirs(apSubmitted,cellExt2Keep);
    
    %% Move all files with opinion of student
    opStud = dirmf('GeefJouwMening.txt');
    for nA = 1:length(opStud)
        stNr = findStudentNumberInTxt(opStud(nA).folder);
        apTmp = fullfile(opStud(nA).folder,opStud(nA).name);
        [~,nm,ext] = fileparts(opStud(nA).name);
        apDes = fullfile(apFeedback,[nm '_' stNr ext]);
        movefile(apTmp,apDes,'f');
    end
    clear stNr nA opStud;
    
    %% Delete files that contain our solutions, possibly after a re-run of this function
    Sol4Stud = dirmf(con.POSTFIX_SOL4STUD);
    for nA = 1:length(Sol4Stud)
        delete(fullfile(Sol4Stud(nA).folder,Sol4Stud(nA).name));
    end
    clear asvFiles opStud Sol4Stud nA
    cd(con.BASEFOLDER);
catch err
    keyboard
    error([mfilename ': Something went wrong with unzipping!' newline err.message newline]);
end

%% Now all student stuff is cleaned. It would save time and diskspace to
% save this 'cleaned product', so let's save time.
zip(fullfile(apUnzipped,[nmCurrBonusAss '_CLEANED_' char(datetime('today','format','y')) '.zip']),apSubmitted)

%% Count number of assignemts and distinguish between theses/programming
apAssBonus = fullfile(con.AP_ASSIGNMENTS,nmCurrBonusAss);
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
            
            [~, subdir] = GetPathOneLevelUp(currFileAbsPath,2);
            [~,~,endSnum] = findStudentNumberInTxt(currFileAbsPath);
            p = fullfile(currFileAbsPath(1:endSnum),nmCurrBonusAss);
            try
                if ~contains(currFileAbsPath,'deelopdracht_')
                    error()
                end
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
for nF = 1:length(trackStudentAssignment)
    try %!!!
        % Get hash codes of current student
        HCodeCurrStud = {trackStudentAssignment{nF,2:end}};
        % Go inside student folder
        relPath = fullfile(con.STUDENTSUBFOLDER,nmCurrBonusAss,trackStudentAssignment{nF,1});
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

for nF = 1:length(mfiles)
    try
        dr = mfiles(nF).folder;
        run(fullfile(dr,mfiles(nF).name));
        % Get assignment name + name of folder directly above it
        tmp = extractAfter(dr,nmCurrBonusAss);
        tmp= extractAfter(tmp,filesep);
        nameOfAssignment{nF} = tmp;
        pointsPerAssignment(nF) = deelpunten;
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
pathStudentResults = fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER,...
    con.BONUSASSNAME(con.BONUSASSNUMBER),['resultaten' nmCurrBonusAss datetimetxt(true) '.mat']);

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

%% Check all the assigned assignments of individual students,
% grade them, zip them and save relevant data
strTrackStudent = cellstr(trackStudentAssignment);
studentMatrix = []; %ones(length(strTrackStudent(:,1)),2);
cnt = 1;
for nS = 1:length(strTrackStudent(:,1))
    cd(apSubWk)
    studentFolder = trackStudentAssignment{nS,1};
    if exist(studentFolder,'dir')
        tic
        try
            strPoints = CheckSingleStudentAssignment(con,studentFolder,dicWithHashes, ...
                dicNameAssignmentAndPoints);
            if strPoints.sumPoints > PointsToBeEarned
                keyboard %something is wrong Bub
            end
            % Calculate Thesis grade
            [grade, grade_theses, grade_prog] = calculateGrade(con, strPoints, numTheses);
            strDiffOpinStud(cnt) = findOpinionStudent(apSubWk,studentFolder,nmCurrBonusAss);
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
            rmdir(dr,'s');
            rmdir(studentFolder,'s');
        catch err
            disp([newline 'DO YOUR MAGIC MAESTRO!' newline err.message]);
            keyboard
        end
        toc
        grade
    end
end %for
cd(apSubWk)
analyseStudentFeedback(apFeedback,strDiffOpinStud,nmCurrBonusAss)
cd(apSubWk)
save(pathStudentResults,'studentMatrix');
averageGrade = mean(checkedStudent)
cd(con.BASEFOLDER);
end

%% Function to read the feedback of the student from the last assignment
function strDiffOpinStud = findOpinionStudent(apSubWk,studentFolder,nmCurrBonusAss)
apOld = pwd;
try
    apStud = fullfile(apSubWk,studentFolder,nmCurrBonusAss);
    cd(apStud);
    fAf = dirmf('deelopdracht_');
    apEndAss = fullfile(fAf(end).folder,fAf(end).name);
    cd(apEndAss)
    files = dir;
    apEndAssFile = fullfile(files(end).folder,files(end).name);
    t = readTxtFile(apEndAssFile);
    relTxt = t(1:50);
    relTxt2 = removeCommentsAndEmptyLines(relTxt,'TI');
    nmTmp = 'tmp.m';
    makeMFileFromCells(nmTmp,{relTxt2});
    run(nmTmp);
    delete(nmTmp);
    strDiffOpinStud.Naam = Naam;
    strDiffOpinStud.Hoeveelheid = Hoeveelheid;
    strDiffOpinStud.Moeilijkheidsgraad = Moeilijkheidsgraad;
catch
    strDiffOpinStud.Naam = [];
    strDiffOpinStud.Hoeveelheid = [];
    strDiffOpinStud.Moeilijkheidsgraad = [];
end
cd(apOld)
end

function analyseStudentFeedback(apSubWk,strDiffOpinStud,nmCurrBonusAss)
cd(apSubWk)
figure('name','Mening student','units','normalized','outerposition',[0 0 1 1],'visible','off');
boxplot([strDiffOpinStud.Moeilijkheidsgraad; strDiffOpinStud.Hoeveelheid]');
xlabel('Moeilijkheidsgraad en Hoeveelheid');
title('Mening studenten moeilijheidsgraad en hoeveelheid');
saveTightFigure(gcf,[nmCurrBonusAss '_DiffQuant.png']);
end