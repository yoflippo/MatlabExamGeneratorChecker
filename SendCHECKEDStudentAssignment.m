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

thisWeek = 'week1'
cd('submitted');
cd(thisWeek);

%% Message for student
chr = 'Beste student,';
chr = [chr newline newline ];
chr = [chr newline 'In de bijlage van deze e-mail staat jouw nagekeken eindopdracht'];
chr = [chr newline 'van ' thisWeek ' voor Biostatica Matlab.'];
chr = [chr newline];
chr = [chr newline 'In het zip-bestand zit een m-file met de naam: "JouwCijfer.m".'];
chr = [chr newline 'Als een vraag/opdracht niet 100% correct is, wordt de uitwerking'];
chr = [chr newline 'er bij gegeven. Zo kun je leren van je fouten.'];
chr = [chr newline];
chr = [chr newline 'Als je denkt dat er iets niet klopt, kom dan langs bij '];
chr = [chr newline 'Mark Schrauwen in RZ 2.17.1. '];
chr = [chr newline];
chr = [chr newline newline 'Met vriendelijke groet,'];
chr = [chr newline 'Mark Schrauwen'];

zips = dir(['**' filesep '*.zip']);
for nZ = 1:length(zips)
    if contains(zips(nZ).name,'Checked')
        %% extract student numbers
        sNum = extractAfter(erase(zips(nZ).name,'.zip'),'Checked_');
        %% construct emailadres
        sEma = 'mjajschrauwenhhs@gmail.com' ; %[sNum '@student.hhs.nl']
        sAtt = fullfile(pwd,zips(nZ).name);
        sendmail(sEma,...
            'Biostatica Matlab: nagekeken eindopdracht week 1',chr,sAtt);
    end
end

cd(BASEFOLDER)