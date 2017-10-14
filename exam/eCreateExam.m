%% A script that creates an exam based on the weekly assignments.
% This script uses the clean_source/assignment folder, but nothing else of
% the old. The scripts used in creating the exam are decoupled of the base
% scripts. However, this does not mean that the helpercode is not used.

clear all
YEAR = 2017;
nOfMulChoiceAssignment = 40;
nOfScriptsFunctions = 20;
weekNames = {'week1' 'week2'}; % fill with the other weeks

%% Go to path of this file
mfilename('fullpath')
BASEFOLDEREX = fileparts(mfilename('fullpath'));
cd(BASEFOLDEREX)
BASEFOLDER = fileparts(BASEFOLDEREX);
addpath(genpath(fullfile(BASEFOLDEREX,'exam_helper')));
addpath(genpath(fullfile(BASEFOLDER,'helpercode')));

%% Make a dir of this exam, with some extra directories, create some handy variables
nmCurrExamDir = ['exam_' datetimetxt() ];
ap.CurrExam = fullfile(BASEFOLDEREX,'Created',nmCurrExamDir);
mkdirIf(ap.CurrExam);
mkdirIf(fullfile(ap.CurrExam,'submitted'));
ap.CurrExamLog = fullfile(ap.CurrExam,'log');
mkdirIf(ap.CurrExamLog);
ap.CurrExamClean = fullfile(ap.CurrExam,'assignments');
mkdirIf(ap.CurrExamClean);
ap.Fin = fullfile(ap.CurrExam,'exam');

%% Some log settings
diary(fullfile(ap.CurrExamLog,['log_' mfilename '_' datetimetxt() '.txt']));
datetime
ver
dispPlatform
clc
dbstop if error

%% Generate MC files
cd(BASEFOLDEREX)
removeShitFromDir(ap.CurrExamClean);
CreateAndCopyQuestions(BASEFOLDER,ap.CurrExamClean,weekNames);
disp('Created MC-Questions')


%% Redo the hashing of the copied questions/assignments , make a custom file for this purpose
% 1 - Make sure a dic is made of all these files not just weekX
% 2 - Add the generation date to every exam file
% Try to find a way to extract separate parts of the rehashing script

% check if a dictionary can contain everything needed bashed on only the
% hash of a file.
exam_addHashAndHeader

%% Create a struct with randomized assignments
cd(BASEFOLDEREX)
ap.CurrExamCleanWk = fullfile(ap.CurrExamClean,weekNames{1});
AssInfo = getExamQuestionInfo(ap.CurrExamClean);
cd(ap.CurrExam);
save('AssInfo.mat','AssInfo')

%% Rename the files so that the string 'opdracht_X' in an assignment gets the
% right number.
rpExamDirMC = fullfile('Exam','deelopdracht_1');
mkdirIf(rpExamDirMC)
rpExamDirMCSOL = fullfile('ExamSOL','deelopdracht_1');
mkdirIf(rpExamDirMCSOL)
nMCQuestions = length(AssInfo.MC);

for n = 1:nOfMulChoiceAssignment
    % Get number of available MC questions
    nRound = floor(n/nMCQuestions);
    nMC = mod(n,nMCQuestions);
    if isequal(nMC,0)
        nMC = nMCQuestions;
        nQ = nMC*nRound;
    else
        nQ = nMC+(nRound*nMCQuestions);
    end
    nRound = nRound+1;
    Q = AssInfo.MC(nMC).files(nRound);
    
    apQSOL = fullfile(Q.folder,Q.name);
    apQ = replace(apQSOL,'_SOL','');
    % Copy MC-question to new file
    rpFinQ = fullfile(rpExamDirMC,['vraag_' num2str(nQ) '.m']);
    copyfile(apQ,rpFinQ);
    rpFinQSOL = fullfile(rpExamDirMCSOL,['vraag_' num2str(nQ) '.m']);
    copyfile(apQSOL,rpFinQSOL);
    % Rename all txt of new questions.
    replaceVraagOpdracht(rpFinQ,nQ);
    % Make a record of assignment in AssInfo
    AssInfo.MC(nMC).files(nRound).usedForExam = 1;
    AssInfo.MC(nMC).files(nRound).apSOL = apQSOL;
    AssInfo.MC(nMC).usedForExam = 1;
end

%% Create a number of script/function assignments
rpExamDirFS = fullfile('Exam','deelopdracht_2');
mkdirIf(rpExamDirFS)
mkdirIf(fullfile(rpExamDirFS,'data_bestanden'));
rpExamDirFSSOL = fullfile('ExamSOL','deelopdracht_2');
mkdirIf(rpExamDirFSSOL)
mkdirIf(fullfile(rpExamDirFSSOL,'data_bestanden'));

numFS = length(AssInfo.FuncScrip);

if nOfScriptsFunctions > numFS
    warning([mfilename ': You are generating too many assignments. Continuing will lead to very similar assignments']);
end

for n = 1:nOfScriptsFunctions
    % Get number of available MC questions
    nRound = floor(n/numFS);
    nFS = mod(n,numFS);
    if isequal(nFS,0)
        nFS = numFS;
        nQ = nFS*nRound;
    else
        nQ = nFS+(nRound*numFS);
    end
    nRound = nRound+1;
    Q = AssInfo.FuncScrip(nFS).files(nRound);
    apQSOL = fullfile(Q.folder,Q.name);
    apQ = replace(apQSOL,'_SOL','');
    % Copy function/script to new file
    rpFinQ = fullfile(rpExamDirFS,['opdracht_' num2str(nQ) '.m']);
    copyfile(apQ,rpFinQ);
    rpFinQSOL = fullfile(rpExamDirFSSOL,['opdracht_' num2str(nQ) '.m']);
    copyfile(apQSOL,rpFinQSOL);
    % Rename all txt of new questions.
    replaceVraagOpdracht(rpFinQ,nQ);
    % Make a record of assignment in AssInfo
    AssInfo.FuncScrip(nFS).files(nRound).usedForExam = 1;
    AssInfo.FuncScrip(nFS).files(nRound).apSOL = apQSOL;
    AssInfo.FuncScrip(nFS).usedForExam = 1;
end

save('AssInfo.mat','AssInfo')


% -     Rename the files and the internals of a file (maybe by using regex???)
% --    test the working of a functionfile if name of function and name file
%       are different

%% Create the actual exam with a directory for each type of questions

%% Create a struct/mat-file with the assigned values.

%% Create a folder with test data (everyting correct and incorrect) with dummy studentnumber

%% Create a checking script
% -     unzip all zip-files in submitted
% -     Check for studentnumber
% --    Find a way the student enters the studentnumber twice
% -     loop through files

%% Create a submission folder


%% Finally, Clean up
rmpath(genpath(fullfile(BASEFOLDEREX,'exam_helper')));