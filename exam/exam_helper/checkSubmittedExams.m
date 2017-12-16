function [grades] = checkSubmittedExams(examInfo,ap)

%% Unzip Exams
zfiles = dir('*.zip');
for nz = 1:length(zfiles)
    oDirs{nz} = replace(zfiles(nz).name,'.zip','');
    apCurrZip = fullfile(zfiles(nz).folder,zfiles(nz).name);
    unzip(apCurrZip,oDirs{nz});
    movefile(apCurrZip,ap.SUBMITTEDUNZIPPED);
end

%% Check for bonus
cd(ap.CurrExam)
if exist('bonus','dir')
   cd('bonus')
   matfiles = dirmf('.mat');
   for n = 1:length(matfiles)
      load(matfiles(n).name);
      bonusgrades{n} = studentMatrix;
   end 
   
   % Calculate bonusgrade to add to examgrade
   for len = 1:length(bonusgrades{1,1})
       bonus{len,1} = bonusgrades{1,1}(len,1);
       bonusExam{len,1} = bonus{len,1};
       for wk = 1:length(bonusgrades)         
            bonus{len,wk+1} = bonusgrades{1,wk}(len,2);
            bonusExam{len,wk+1} = (bonus{len,wk+1}-1)/(length(bonusgrades)*9);
       end
       bonusExam{len,length(bonusgrades)+2} = sum([bonusExam{len,2:5}]);
   end
   clear studentMatrix bonusgrades n len matfiles
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

