%https://nl.mathworks.com/matlabcentral/answers/94446-can-i-send-e-mail-through-matlab-using-microsoft-outlook
clear all;
load('Workspace.mat')
apCheckExam = fileparts(mfilename('fullpath'));
cd(apCheckExam);
addpath(genpath(apCheckExam))
addpath(genpath(ap.EXAMHELPER));
addpath(genpath(ap.HELPERCODE));

setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','E_mail','opleidingbewegingstechnologie@gmail.com');
setpref('Internet','SMTP_Username','opleidingbewegingstechnologie@gmail.com');
password = input('Geef het wachtwoord:','s');
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

nmDirSend = 'submitted_checked_send';

%% Recover earlier saved studentnumbers to prevent multiple e-mail to same student
try
    load('strStudentNumbers.mat','strStudentNumbers');
    warning('RELOAD studentnumbers!!!!!');
catch
end

%% Message for student
chr = 'Beste student,';
chr = [chr newline ];
chr = [chr newline 'In de bijlage van deze e-mail staat jouw nagekeken tentamen'];
chr = [chr newline 'van Biostatica Matlab.'];
chr = [chr newline];
chr = [chr newline 'Op deze e-mail wordt niet gereageerd.'];
chr = [chr newline 'Als je denkt dat er iets niet klopt, kom dan langs bij '];
chr = [chr newline 'Mark Schrauwen in RZ 0.09. Of maak een afspraak via: '];
chr = [chr newline 'http://www.bewegingstechnologie.com/markschrauwen '];
chr = [chr newline];
chr = [chr newline newline 'Met vriendelijke groet,'];
chr = [chr newline 'Mark Schrauwen'];

%% Get files to send
cd('submitted_checked')
zips = dirmf('Checked');
nSendMails = 0;
nMailsToSend = length(zips);

%% Send mails
for nZ = 1:nMailsToSend
    if contains(zips(nZ).name,'.zip')
        try
            cd(zips(nZ).folder);
            rpSendFolder=fullfile('..',nmDirSend);
            mkdirIf(rpSendFolder);   
            %% extract student numbers
            sNum = findStudentNumberInTxt(zips(nZ).name);        
            %% construct emailadres
            sEma = [sNum '@student.hhs.nl']
            sAtt = fullfile(zips(nZ).folder,zips(nZ).name);
            sendmail(sEma,'Biostatica Matlab: nagekeken tentamen ',chr,sAtt);
            movefile(sAtt,rpSendFolder);
            clc
        catch
            save('strStudentNumbers.mat','strStudentNumbers')
            error([mfilename ': sending of Checked e-mails stopped...']);
        end
        nSendMails = nSendMails + 1
        disp(['Send mails: ' num2str(nSendMails)]);
    end
end
cd(apCheckExam);
apExc = uigetfile({'*.*'},'Selecteer Osiris export bgestand');
nmGradesMat = 'grades.mat';
apGradesMat = dirmf(nmGradesMat);
WriteResultsToExcel(apExc,fullfile(apGradesMat.folder,nmGradesMat));

rmpath(genpath(apCheckExam))
rmpath(genpath(ap.EXAMHELPER));
rmpath(genpath(ap.HELPERCODE));