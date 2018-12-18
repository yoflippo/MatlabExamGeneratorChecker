function generateTestExams(apExam,numOfTestExams)
oldPath = pwd;
cd(apExam);
nameTestExamsDir = 'Test_Exams';
warning off;
if exist(nameTestExamsDir,'dir')
    rmdir(nameTestExamsDir,'s');
end
mkdir(nameTestExamsDir)
warning on;

rpTmpDir = fullfile(nameTestExamsDir,'Tentamen');
apTmpDir = fullfile(apExam,rpTmpDir);
rpTmpDirSOL = fullfile(nameTestExamsDir,'TentamenSOL');
apTmpDirSOL = fullfile(apExam,rpTmpDirSOL);
filesTmpDir = dir([apTmpDir filesep '**']);
filesTmpDirSOL = dir([apTmpDirSOL filesep '**'])
mkdir(rpTmpDir);
mkdir(fullfile(nameTestExamsDir,'exams'));
mkdir(fullfile(nameTestExamsDir,'exams_SOL'));

%Studentnumbers
snumber = unique(randi([11111111,99999999],1,numOfTestExams));
dirs = {'Tentamen' 'TentamenSOL'};
findir = {'exams' 'exams_SOL'};

for nD = 1:length(dirs)
    for ns = 1:length(snumber)
        currSNumber = snumber(ns);
        
        %% Copy new exam files (no solutions)
        copyfiles(dirs{nD},rpTmpDir)
                
        %% Create studentnumber file
        apStudentNumber = fullfile(apExam,rpTmpDir,'deelopdracht_0','studentnummer.m');
        fileID = fopen(apStudentNumber,'W');
        fprintf(fileID,'%s\r\n',['studentnumber = ' num2str(currSNumber) ';']);
        fclose('all');
        
        %% Zip the examfile
        cd(rpTmpDir)
        currZip = ['TentamenBiostatica_' num2str(currSNumber) '.zip'];
        zip(fullfile('..',currZip),pwd)
        cd ..
        movefile(currZip,findir{nD})
        cd ..
    end
end

% % Now Generate nTestFiles different folders with student-assignments containing
% % no-answers to all answers.
% for nTDir = 0:nTestFiles
%     % Create folder
%     prcCorrect = round((nTDir/nTestFiles)*100);
%     pathCurrTestDir = fullfile(currTestDir,['correct_' num2str(prcCorrect)]);
%     mkdir(pathCurrTestDir);
%     
%     for nF = 1:nTestFiles
%         if nTDir >= nF
%             absPathNA = fullfile(solZF(nF).folder,solZF(nF).name);
%         else
%             absPathNA = fullfile(noAnsZF(nF).folder,noAnsZF(nF).name);
%         end
%         copyfile(absPathNA,pathCurrTestDir);
%     end
% end

removeShitFromDir(apTmpDir);
rmdir(apTmpDir);
cd(oldPath);
end

