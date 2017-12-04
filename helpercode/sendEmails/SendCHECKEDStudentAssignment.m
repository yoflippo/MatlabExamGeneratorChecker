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

thisWeek = 'week2'
cd('submitted');
cd(thisWeek);

%% Message for student
chr = 'Beste student,';
chr = [chr newline ];
chr = [chr newline 'In de bijlage van deze e-mail staat jouw nagekeken eindopdracht'];
chr = [chr newline 'van ' thisWeek ' voor Biostatica Matlab.'];
chr = [chr newline];
chr = [chr newline 'In het zip-bestand zit een m-file met de naam: "JouwCijfer.m".'];
chr = [chr newline 'Als een vraag/opdracht niet 100% correct is, wordt de uitwerking'];
chr = [chr newline 'er bij gegeven. Zo kun je leren van je fouten.'];
chr = [chr newline newline 'Onderaan jouw uitwerking kan extra informatie staan over wat er fout is gegaan.']
chr = [chr newline];
chr = [chr newline 'Op deze e-mail wordt niet door ons gereageerd.'];
chr = [chr newline 'Als je denkt dat er iets niet klopt, kom dan langs bij '];
chr = [chr newline 'Mark Schrauwen in RZ 2.17.1. '];
chr = [chr newline];
chr = [chr newline newline 'Met vriendelijke groet,'];
chr = [chr newline 'Mark Schrauwen'];

%% Make dir send
zips = dir(['**' filesep '*.zip']);
nSendMails = 0;
nMailsToSend = length(zips);
oldPath = pwd;
cd ..
sendFolder = [thisWeek '_send'];
mkdirIf(sendFolder);
apSendFolder = fullfile(pwd,sendFolder)
cd(oldPath)
%% Send mails
for nZ = 1:length(zips)
    if contains(zips(nZ).name,'Checked')
        %% extract student numbers
        sNum = findStudentNumberInTxt(zips(nZ).name);
        %% construct emailadres
        sEma = [sNum '@student.hhs.nl']
        sAtt = fullfile(zips(nZ).folder,zips(nZ).name);
        sendmail(sEma,...
        ['Biostatica Matlab: nagekeken eindopdracht ' thisWeek],chr,sAtt);
        movefile(sAtt,apSendFolder);
        clc
        nSendMails = nSendMails + 1
    end
    disp(['Send mails: ' num2str(nSendMails)]);
    cd(con.BASEFOLDER)
end
