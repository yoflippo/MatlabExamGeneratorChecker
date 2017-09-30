clear all;
InitAll

global gWeekNames;
global BASEFOLDER;
gWeekNames = {'week1' 'week2'};

%% Generate MC files
disp('Generate MC files')
tic
apMCFiles = fullfile(pwd,LISTWITHNEEDEDFOLDERS{2});
cd(apMCFiles)
cd gen_mc
run('CreateMCQuestions.m')
disp('Created MC-Questions')
cd generated_questions
apGenMcQ = pwd;
toc

%% Get deelopdracht_x folderS
global gWeekNames;
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
global gWeekNames;
disp('Copy MC files')
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
    catch errMess
        disp('errMess');
    end
end
global BASEFOLDER;
cd(BASEFOLDER)
toc

%% execute generated all assignments script
global gWeekNames;
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
global gWeekNames;
disp('execute create week assignment scripts');
tic
try
    run('bCreateWeekAssignments.m')
catch
end
toc

%% Copy certain testfiles to directory submitted --- ADJUST FOR DIFFERENT TESTS!!!
global gWeekNames;
disp('Copy certain testfiles to directory submitted');
tic
% make path of testing files
apTestFiles = fullfile(pwd,'fortesting','week1','correct_100');
apFinDes = fullfile(pwd,STUDENTSUBFOLDER,'week1');
copyfiles(apTestFiles,apFinDes);
toc

%% execute check assignments
global gWeekNames;
disp('Execute check assignments');
tic
try
    run('cCheckStudentSubmissions.m')
catch
end
toc
pause

%% execute other check assignments
apTestFiles = fullfile(pwd,'fortesting','week1','correct_0');
apFinDes = fullfile(pwd,STUDENTSUBFOLDER,'week1');
copyfiles(apTestFiles,apFinDes);
toc

%% execute check assignments
global gWeekNames;
disp('Execute check assignments');
tic
try
    run('cCheckStudentSubmissions.m')
catch
end
toc