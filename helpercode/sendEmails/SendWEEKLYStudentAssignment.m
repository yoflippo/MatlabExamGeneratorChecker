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
weeknum = '2'
thisWeek = ['week' weeknum]
cd('student_assignments');
cd(thisWeek);

%% Message for student
chr = '';
chr = [chr newline 'Beste student,'];
chr = [chr newline newline 'Lees deze e-mail helemaal door!'];
chr = [chr newline ];
chr = [chr newline 'In de bijlage van deze e-mail staat jouw eindopdracht'];
chr = [chr newline 'van week ' weeknum ' voor Biostatica Matlab.'];
chr = [chr newline ];
chr = [chr newline 'Op Blackboard staan de uiterlijke inlevermomenten van de week eindopdrachten.'];
chr = [chr newline];
chr = [chr newline 'Je krijgt voor deze opdracht een bonuscijfer (zie Blackboard).'];
chr = [chr newline 'Het maken van de eindopdrachten is de beste oefening die je kunt krijgen voor het tentamen.'];
chr = [chr newline];
chr = [chr newline 'Je mag de foldernamen, folderstructuren en bestandsnamen'];
chr = [chr newline 'van het zip-bestand NIET aanpassen!'];
chr = [chr newline];
chr = [chr newline 'Met behulp van de m-file: "AfrondenWeekOpdracht.m" maak je een'];
chr = [chr newline 'zip-bestand van al je werk. Dat specifieke zip-bestand moet je'];
chr = [chr newline 'uploaden via Blackboard. Indien je toch zelfstandig een'];
chr = [chr newline 'zip-bestand maakt, wordt je opdracht NIET nagekeken!'];
chr = [chr newline];
chr = [chr newline 'Wij proberen jouw opdracht na het inlevermoment, binnen'];
chr = [chr newline '10 werkdagen na te kijken. Je ontvangt je nagekeken werk'];
chr = [chr newline 'op dit e-mailadres.'];
chr = [chr newline 'Je bonuscijfer is nog niet bekend als je aan je tentamen begint.'];
chr = [chr newline];
chr = [chr newline 'Stuur bij vragen/onduidelijkheden een e-mail naar mjschrau@hhs.nl'];
chr = [chr newline 'E-mails naar dit e-mailadres worden NIET gelezen.'];
chr = [chr newline];
chr = [chr newline 'Met vriendelijke groet,'];
chr = [chr newline 'Mark Schrauwen']

%% Find zips and mail them
zips = dir(['**' filesep '*.zip']);
nSendMails = 0;
nMailsToSend = length(zips);
for nZ = 1:nMailsToSend
    try
        %% extract student numbers
        sNum = extractAfter(erase(zips(nZ).name,'.zip'),'_');
        %% construct emailadres
        sEma = {[sNum '@student.hhs.nl']};
        sAtt = fullfile(pwd,zips(nZ).name) ;
        sendmail(sEma,...
            ['Biostatica Matlab: eindopdracht week: ' weeknum],chr,sAtt);
        nSendMails = nSendMails + 1;
    catch err
        keyboard
    end
end
disp(['Send mails: ' num2str(nSendMails)]);
cd(con.BASEFOLDER)