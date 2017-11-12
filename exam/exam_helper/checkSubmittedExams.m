function [grades] = checkSubmittedExams(examInfo)

%% Unzip Exams
zfiles = dir('*.zip');
for nz = 1:length(zfiles)
    oDirs{nz} = replace(zfiles(nz).name,'.zip','');
    unzip(zfiles(nz).name,oDirs{nz});
end

%% Walk through unzipped folders
for nd = 1:length(oDirs)
    currPath = pwd;
    cd(oDirs{nd});
    currStudentNumber = getStudentNumber();
    cd(fullfile('Tentamen'))
    
    %% Check Hashes and remove files that do not belong
    checkExamHashes();
    
    %% Grade files
    grade = gradeExamFiles(examInfo);
    
    %% Create file with grade information
    cCheck_GradeText;
    makeMFileFromCells(fullfile(pwd,'JouwCijfer'),t);
    
    %% Zip checked exam
    cd(currPath)
    zip(['Checked_' oDirs{nd} '.zip'],oDirs{nd})
    
    %% Save grade
    grades(nd,1:2) = [currStudentNumber grade];
    
end

save('grades.mat','grades');
end

