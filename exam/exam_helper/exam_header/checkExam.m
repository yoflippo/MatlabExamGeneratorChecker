%% ASSUME THIS FILE IS WITHIN THE EXAM DIRECTORY
function [grades] = checkExam()
clc
load('Workspace.mat')
cd(ap.CurrExam)
addpath(genpath(ap.EXAMHELPER));
addpath(genpath(ap.HELPERCODE));
ap.SUBMITTEDUNZIPPED = fullfile(pwd,'submitted_unzipped');
if exist(ap.SUBMITTEDUNZIPPED,'dir')
    removeShitFromDir(ap.Submitted);
    movefiles(ap.SUBMITTEDUNZIPPED,ap.Submitted)
else
    mkdirIf(ap.SUBMITTEDUNZIPPED);
end

diary(fullfile(ap.CurrExamLog,['log_' mfilename '_' datetimetxt() '.txt']));
datetime
ver
dispPlatform
clc

%% Unzip every exam
cd(ap.Submitted);
grades = checkSubmittedExams(sAssigned,ap);

% % % %% Finally, Clean up
% % % disp('Finally, Clean up');
% % % warning off
% % % fclose('all');
% % % rmpath(genpath(ap.BASEFOLDEREX));
% % % rmpath(genpath(ap.HELPERCODE));
% % % rmpath(genpath(ap.CurrExam));
% % % rmpath(genpath(ap.Assignments));
% % % warning on