function checkSubmittedExams(examInfo)

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
    cd(fullfile('Tentamen'))
    
    %% Check Hashes and remove files that do not belong
    checkExamHashes();
    
    %% Grade files
    grade = gradeExamFiles(examInfo);
   
end

end

