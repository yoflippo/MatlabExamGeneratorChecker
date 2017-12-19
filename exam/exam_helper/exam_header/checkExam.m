%% ASSUME THIS FILE IS WITHIN THE EXAM DIRECTORY
function [grades] = checkExam()
clear variables
clc
load('Workspace.mat')

try
    cd(ap.CurrExam)
catch
    ap = changeAbsolutePath(ap);
    cd(ap.CurrExam)
end
addpath(genpath(ap.EXAMHELPER));
addpath(genpath(ap.HELPERCODE));
ap.SUBMITTEDUNZIPPED = fullfile(pwd,'submitted_unzipped');
mkdirIf(ap.SUBMITTEDUNZIPPED);
ap.SUBMITTEDCHECKED = fullfile(pwd,'submitted_checked');
mkdirIf(ap.SUBMITTEDCHECKED);

if exist(ap.SUBMITTEDUNZIPPED,'dir')
    if ~exist(fullfile(ap.Submitted,'checkSubmittedExam.mat'),'file');
        removeShitFromDir(ap.Submitted);
        movefiles(ap.SUBMITTEDUNZIPPED,ap.Submitted)
    end
else
    mkdirIf(ap.SUBMITTEDUNZIPPED);
end

diary(fullfile(ap.CurrExamLog,['log_' mfilename '_' datetimetxt() '.txt']));
datetime
ver
dispPlatform
clc

%% Unzip every exam
grades = checkSubmittedExams(sAssigned,ap);
% Descriptives
PercentagePassed = sum(grades(:,2)>=5.5)/length(grades(:,2))
AverageGrade = mean(grades(:,2))
Std = std(grades(:,2))
strDescriptive(1,1) = string(['Average grade: ' num2str(AverageGrade)]); 
strDescriptive(2,1) = string(['Percentage passed: ' num2str(PercentagePassed)]); 
strDescriptive(3,1) = string(['Standard Deviation: ' num2str(Std)]); 
strDescriptive(4,1) = "In het geval dit het tentamen betreft zit het bonuscijfer er in verwerkt.";
strGrades = string(num2str(grades))
strGrades = [strDescriptive; strGrades]
writetxtfile(fullfile(ap.Submitted,'cijfers.txt'),strGrades)

%% Finally, Clean up
disp('Finally, Clean up');
warning off
fclose('all');
rmpath(genpath(ap.BASEFOLDEREX));
rmpath(genpath(ap.HELPERCODE));
rmpath(genpath(ap.CurrExam));
rmpath(genpath(ap.Assignments));
warning on