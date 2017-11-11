function generateTestExams(apExam)

nameTestExamsDir = 'Test_Exams';
mkdir(nameTestExamsDir)
rpTmpDir = fullfile(nameTestExamsDir,'Tentamen');
apTmpDir = fullfile(apExam,rpTmpDir);
mkdir(rpTmpDir);
mkdir(fullfile(nameTestExamsDir,'exams'));
mkdir(fullfile(nameTestExamsDir,'exams_SOL'));

%Studentnumbers
snumber = [11111111 22222222 33333333 44444444 55555555];
dirs = {'Tentamen' 'TentamenSOL'};
findir = {'exams' 'exams_SOL'};

for nD = 1:length(dirs)
    for ns = 1:length(snumber)
        currSNumber = snumber(ns);
        
        %% Copy new exam files (no solutions)
        copyfiles(dirs{nD},rpTmpDir)
        
        %% Create studentnumber file
        apStudentNumber = fullfile(apExam,rpTmpDir,'deelopdracht_0','studentnummer.m');
        fileID = fopen(apStudentNumber,'w');
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

removeShitFromDir(apTmpDir);
rmdir(apTmpDir);

end

