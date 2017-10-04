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
% sendmail('yoflippo@gmail.com','texttobesent') ;

thisWeek = 'week1'
cd('student_assignments');
cd(thisWeek);

%% Message for student
chr = ['Als je deze opdracht al hebt gedaan.. hoef je het niet nog eens te doen... mag wel..' newline newline ];
chr = 'Beste student,';
chr = [chr newline newline ];
chr = [chr newline 'In de bijlage van deze e-mail staat jouw eindopdracht'];
chr = [chr newline 'van ' thisWeek ' voor Biostatica Matlab.'];
chr = [chr newline 'Je moet deze opdracht voor volgende week woensdag'];
chr = [chr newline '23:59u inleveren via Blackboard.'];
chr = [chr newline];
chr = [chr newline 'Je mag de foldernamen, folderstructuren en bestandnamen'];
chr = [chr newline 'van het zip-bestand NIET aanpassen!'];
chr = [chr newline 'Doe je dat wel, dan wordt de opdrahct niet nagekeken.'];
chr = [chr newline];
chr = [chr newline 'Met behulp van de m-file: "AfrondenWeekOpdracht.m" maak je een'];
chr = [chr newline 'zip-bestand van al je werk. Dat specifieke zip-bestand MOET je'];
chr = [chr newline 'uploaden via Blackboard. Indien je toch zelfstandig een'];
chr = [chr newline 'zip-bestand maakt, wordt je opdracht NIET nagekeken!'];
chr = [chr newline];
chr = [chr newline 'Wij proberen jouw opdracht na het inlevermoment, binnen'];
chr = [chr newline '5 werkdagen na te kijken. Je ontvangt je nagekeken werk'];
chr = [chr newline 'op dit e-mailadres.'];
chr = [chr newline];
chr = [chr newline newline 'Met vriendelijke groet,'];
chr = [chr newline 'Mark Schrauwen'];

zips = dir(['**' filesep '*.zip']);
for nZ = 1:length(zips)
   %% extract student numbers
   sNum = extractAfter(erase(zips(nZ).name,'.zip'),'_');
   %% construct emailadres
   sEma = {'mjschrau@hhs.nl' [sNum '@student.hhs.nl']}
   sAtt = fullfile(pwd,zips(nZ).name) 
   sendmail(sEma,...
         'Biostatica Matlab: eindopdracht week 1',chr,sAtt);
   nSendMails = nSendMails + 1;
end
disp(['Send mails: ' num2str(nSendMails)]);
cd(BASEFOLDER)