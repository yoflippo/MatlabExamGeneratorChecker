%% ASSUME THIS FILE IS WITHIN THE EXAM DIRECTORY
% function [grades] = checkExam()
clear variables
clc
apCheckExam = fileparts(mfilename('fullpath'));
cd(apCheckExam);
load('Workspace.mat')
rmpath(genpath(apCheckExam))

%% Change absolute paths if needed
try
    if ~isequal(ap.CurrExam,pwd)
        ap = changeAbsolutePath(ap);
        sAssigned = changeAbsolutePath(sAssigned);  
        AssInfo.FuncScrip = changeAbsolutePath(AssInfo.FuncScrip);
        AssInfo.MC = changeAbsolutePath(AssInfo.MC);
    end
catch err
    error([newline mfilename ': ' newline err.message newline]); 
    cd(ap.CurrExam);
end

addpath(genpath(ap.EXAMHELPER));
addpath(genpath(ap.HELPERCODE));
ap.SUBMITTEDUNZIPPED = fullfile(pwd,'submitted_unzipped');
mkdirIf(ap.SUBMITTEDUNZIPPED);
ap.SUBMITTEDCHECKED = fullfile(pwd,'submitted_checked');
mkdirIf(ap.SUBMITTEDCHECKED);

if exist(ap.SUBMITTEDUNZIPPED,'dir')
    if ~exist(fullfile(ap.Submitted,'checkSubmittedExam.mat'),'file')
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

%% Descriptives
PercentagePassed = sum(grades(:,2)>=5.5)/length(grades(:,2));
AverageGrade = mean(grades(:,2));
Std = std(grades(:,2));
MaxGrade = max(grades(:,2));
MinGrade = min(grades(:,2));
numberPart = length(grades);
clear strDescriptive;
strDescriptive(1,1) = string(['Average grade: ' num2str(AverageGrade)]); 
strDescriptive(length(strDescriptive)+1,1) = string(['Percentage passed: ' num2str(PercentagePassed)]); 
strDescriptive(length(strDescriptive)+1,1) = string(['Standard Deviation: ' num2str(Std)]); 
strDescriptive(length(strDescriptive)+1,1) = string(['Highest grade: ' num2str(MaxGrade)]);
strDescriptive(length(strDescriptive)+1,1) = string(['Lowest grade: ' num2str(MinGrade)]);
strDescriptive(length(strDescriptive)+1,1) = string(['Number of students: ' num2str(numberPart)]); 
strDescriptive(length(strDescriptive)+1,1) = "In het geval dit het tentamen betreft zit het bonuscijfer er in verwerkt.";
strGrades = string(num2str(grades));
strGrades = [strDescriptive; strGrades]

%% Analysis
ap.Grades = fullfile(ap.Submitted,'cijfers.txt');
ap.Analysis = fullfile(ap.CurrExam,'ExamAnalysis');
writetxtfile(ap.Grades,strGrades)
cd(ap.CurrExam)
analyse_exam(fullfile(ap.Submitted,'resultOverview.mat'),ap.nOfTheses,nm.CurrExamDir)
%% Copy exam to analysis directory
zip(fullfile(ap.Analysis,'TheExam.zip'),ap.ExamSrcDir);
copyfile(ap.Grades,ap.Analysis);
save('WorkspaceFinal.mat');
%% Zip Analysis
cd(ap.CurrExam)
[~,nmExam] = fileparts(ap.CurrExam);
zip(['Analysis_' nmExam '.zip'],ap.Analysis);

%% Finally, Clean up
disp('Finally, Clean up');
warning off
fclose('all');
% % % rmpath(genpath(ap.HELPERCODE));
% % % rmpath(genpath(ap.CurrExam));
warning on