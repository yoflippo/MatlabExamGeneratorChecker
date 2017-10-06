clear all;

diary(fullfile(pwd,'log',['logCW_' mfilename '_' datetimetxt() '.txt']));
datetime
dbstop if error
global BASEFOLDER;
global gWeekNames;
gWeekNames = {'week1' 'week2'};

InitAll

if ismac
    disp('Mac plaform')
elseif isunix
    disp('Linux plaform')
elseif ispc
    disp('Windows platform')
else
    disp('Platform not supported')
end

%% Generate MC files
%To Do give some output to user
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
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

%% Copy files clean_source -> assignments
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
        nFilesClnSrc = dirmf();
        cd(apFin)
        nFilesFin = dirmf();
        if ~isequal(length(nFilesFin), length(nFilesClnSrc))
            error('Files not copied correctly');
        end
    catch errMess
        disp(errMess);
    end
end
fclose('all');
cd(BASEFOLDER)
toc

%% Execute generated all assignments script
disp('execute generate all script');
if ~isequal(pwd,BASEFOLDER)
    cd(BASEFOLDER)
end
tic
try
    run('aGenerateEverythingForCourse.m')
catch err
    disp(err);
    warning([mfilename ': aGenerateEverythingForCourse did not finish correctly']);
end
toc

%% Check if al 'checking' files are in working order
disp('Check if al "checking" files are in working order');
assert(CheckSolCheckDirFunc(fullfile(BASEFOLDER,'assignments')));

%% execute create week assignment scripts, Create assignments for individual students
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


%% TEST if all INcorrect solutions files pass
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

%% TEST if all correct solutions files pass
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

datetime
diary off

%% Backup if all is working
if askuser('Is all in working order?',false)
    buAll
end


return;

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





