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
cd(BASEFOLDER);
toc

%% Copy MC files to clean_source -> assignments
disp('Copy MC files')
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
tic
for nWk = 1:length(gWeekNames)
    currWkName = gWeekNames{nWk};
    try
        apClnSrc = fullfile(BASEFOLDER,'clean_source','assignments',currWkName);
        apFin = fullfile(BASEFOLDER,'assignments',currWkName);
        removeShitFromDir(fullfile(apFin))
        copyfiles(apClnSrc,apFin);
        % Check the files in each folder
        cd(apClnSrc)
        nFilesClnSrc = dir(['**' filesep '*.m']);
        cd(apFin)
        nFilesFin = dir(['**' filesep '*.m']);
        if ~isequal(length(nFilesFin), length(nFilesClnSrc))
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

%% Check if al 'checking' files are in working order
disp('Check if al "checking" files are in working order');
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
    error('in bCreateWeekAssignments');
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
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
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
catch err
    disp(err);
    error(' cCheckStudentSubmissions() did not work properly');
end
toc

%% execute other check assignments
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
apTestFiles = fullfile(pwd,'fortesting','week1','correct_100');
apFinDes = fullfile(pwd,STUDENTSUBFOLDER,'week1');
removeShitFromDir(apFinDes);
copyfiles(apTestFiles,apFinDes);
disp('Execute check assignments');
tic
try
    if ~isequal(cCheckStudentSubmissions(),10)
        error('The average grade is not equal to 10');
    end
catch
end
toc
cd(BASEFOLDER)