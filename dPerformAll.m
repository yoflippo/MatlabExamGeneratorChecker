clear all;
global BASEFOLDER;
InitAll
dbstop if error

global gWeekNames;
gWeekNames = {'week1' 'week2'};

%% Generate MC files
%To Do give some output to user
disp('Generate MC files')
tic
CreateMCQuestions(BASEFOLDER);
disp('Created MC-Questions')
toc

%% Get deelopdracht_x folderS
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
tic
apMCFiles = fullfile(pwd,LISTWITHNEEDEDFOLDERS{2});
cd(apMCFiles)
cd gen_mc
cd generated_questions
apGenMcQ = pwd;
ass =[];
for wk = 1:length(gWeekNames)
    cd(gWeekNames{wk})
    ass{wk} = getFolders(pwd);
    cd ..
end
cd ..
cd ..
toc

%% Copy MC files
disp('Copy MC files')
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
tic
for nWk = 1:length(gWeekNames)
    currWkName = gWeekNames{nWk};
    try
        apGenMcQTmp = fullfile(apGenMcQ,currWkName);
        apFinMcQ = fullfile(pwd,'assignments',currWkName);
        %% Iterate over deelopdrachten_X
        for nDo = 1:length(ass{nWk})
            emptyDirRecursiveMFiles(fullfile(apFinMcQ,ass{nWk}{nDo}))
        end
        copyfiles(apGenMcQTmp,apFinMcQ);
        if ~isequal(dir(apGenMcQTmp), dir(apFinMcQ))
            error('Files not copied correctly');
        end
    catch errMess
        disp(errMess);
    end
end
cd(BASEFOLDER)
toc

%% execute generated all assignments script
disp('execute generate all script');
tic
try
    run('aGenerateEverythingForCourse.m')
catch
end
toc

%% Check all the files
disp('Check all the files');
assert(CheckSolCheckDirFunc(fullfile(BASEFOLDER,'assignments')));

%% execute create week assignment scripts
disp('execute create week assignment scripts');
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
tic
try
    bCreateWeekAssignments();
catch err
    disp(err)
end
toc

%% Check manually copied submitted files (*&^%$#@#$%^&*&^%$#@#$%^&^%$#$%^&
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
disp('Check manually copied submitted files');
tic
try
    if ~isequal(cCheckStudentSubmissions(),1)
        error('The average grade is not equal to 1');
    end
catch
end
toc

%% Copy certain testfiles to directory submitted --- ADJUST FOR DIFFERENT TESTS!!!
disp('Copy certain testfiles to directory submitted');
tic
apTestFiles = fullfile(pwd,'fortesting','week1','correct_0');
apFinDes = fullfile(pwd,STUDENTSUBFOLDER,'week1');
removeShitFromDir(apFinDes);
copyfiles(apTestFiles,apFinDes);
disp('Execute check assignments');
try
    if ~isequal(cCheckStudentSubmissions(),1)
        error('The average grade is not equal to 1');
    end
catch
end
toc

%% execute other check assignments
apTestFiles = fullfile(pwd,'fortesting','week1','correct_100');
apFinDes = fullfile(pwd,STUDENTSUBFOLDER,'week1');
removeShitFromDir(apFinDes);
copyfiles(apTestFiles,apFinDes);
disp('Execute check assignments');
tic
try
    if ~isequal(cCheckStudentSubmissions(),1)
        error('The average grade is not equal to 1');
    end
catch
end
toc
cd(BASEFOLDER)