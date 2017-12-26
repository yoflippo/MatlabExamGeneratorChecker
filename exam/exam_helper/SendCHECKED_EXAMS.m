%https://nl.mathworks.com/matlabcentral/answers/94446-can-i-send-e-mail-through-matlab-using-microsoft-outlook
clear all;
InitAll

setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','E_mail','opleidingbewegingstechnologie@gmail.com');
setpref('Internet','SMTP_Username','opleidingbewegingstechnologie@gmail.com');
setpref('Internet','SMTP_Password','btokee2btokee');
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

studentNumbers = load(fullfile('studentnumbers','studentnumbers.txt'))
strStudentNumbers = string(num2str(studentNumbers));

nmDirSend = 'submitted_checked_send';
cd(con.BASEFOLDER);
cd('exam');

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
chr = [chr newline 'Mark Schrauwen in RZ 2.17.1. Of maak een afspraak via: '];
chr = [chr newline 'http://www.bewegingstechnologie.com/markschrauwen '];
chr = [chr newline];
chr = [chr newline newline 'Met vriendelijke groet,'];
chr = [chr newline 'Mark Schrauwen'];

%% Make dir send
zips = dirmf('Checked');
nSendMails = 0;
nMailsToSend = length(zips);

%% Send mails
for nZ = 1:nMailsToSend
    if contains(zips(nZ).name,'.zip') && contains(zips(nZ).name,'TentamenBiostatica')
        try
            cd(zips(nZ).folder);
            rpSendFolder=fullfile('..',nmDirSend);
            mkdirIf(rpSendFolder);
            
            %% extract student numbers
            sNum = findStudentNumberInTxt(zips(nZ).name);
            indices = contains(strStudentNumbers,sNum);
            if any(indices)
                %% construct emailadres
                sEma = [sNum '@student.hhs.nl']
                sAtt = fullfile(zips(nZ).folder,zips(nZ).name);
                sendmail(sEma,'Biostatica Matlab: nagekeken tentamen ',chr,sAtt);
                % Remove studentnumber from list
                strStudentNumbers = strStudentNumbers(not(indices))
                movefile(sAtt,rpSendFolder);
                clc
            else
                error([mfilename ': Something is wrong, student has submitted that is not in the list']);
            end
        catch
            save('strStudentNumbers.mat','strStudentNumbers')
            error([mfilename ': sending of Checked e-mails stopped...']);
        end
        nSendMails = nSendMails + 1
        disp(['Send mails: ' num2str(nSendMails)]);
    end
end
cd(con.BASEFOLDER)