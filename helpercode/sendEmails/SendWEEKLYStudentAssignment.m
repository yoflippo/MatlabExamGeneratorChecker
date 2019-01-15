%https://nl.mathworks.com/matlabcentral/answers/94446-can-i-send-e-mail-through-matlab-using-microsoft-outlook
% Assuming the Workspace is still present after executing 'PerformAll.m'
con = ConstantsClass();
cd(con.BASEFOLDER)
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','E_mail','opleidingbewegingstechnologie@gmail.com');
setpref('Internet','SMTP_Username','opleidingbewegingstechnologie@gmail.com');
setpref('Internet','SMTP_Password','btokee2btokee');
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
% sendmail('yoflippo@gmail.com','texttobesent') ;
con.BONUSASSNUMBER = 2;
assignmentNum = num2str(con.BONUSASSNUMBER);
nameCurrentBonusDir = [con.NMBONUSASSIGNMENTDIR assignmentNum];
cd('student_assignments');
cd(nameCurrentBonusDir);

%% Message for student
chr = '';
chr = [chr newline 'Beste student,'];
chr = [chr newline newline 'Lees deze e-mail helemaal door!'];

chr = [chr newline 'De deadline van deze bonusopdracht is 07-01-19 om 12:59h.'];
chr = [chr newline ];
chr = [chr 'Jij krijgt deze bonus-opdracht omdat jij je hebt ingeschreven voor de Blackboard course Biostatica. '];
chr = [chr newline 'Wil je deze e-mails niet meer ontvangen, stuur mij (Mark) dan een e-mail. '];
chr = [chr newline ];
% chr = [chr 'Deze week een eindopdracht met minder opdrachten.' newline ];
chr = [chr newline 'In de bijlage van deze e-mail staat jouw eindopdracht voor Biostatica Matlab.'];
chr = [chr newline ];
chr = [chr newline ];
chr = [chr newline 'Lees de regels horende bij deze opdrachten (zie bovenaan iedere m-file)!!!'];
chr = [chr newline ];
chr = [chr newline ];
chr = [chr newline 'Wij proberen jouw opdracht na het inlevermoment, binnen 10 werkdagen na te kijken. Je ontvangt je nagekeken werk op dit e-mailadres.'];
chr = [chr newline 'Je definitieve bonuscijfer is nog niet bekend als je aan je tentamen begint.'];
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
oldPath = pwd;
cd ..
sendFolder = [nameCurrentBonusDir '_send'];
mkdirIf(sendFolder);
apSendFolder = fullfile(pwd,sendFolder)
cd(oldPath)
%% Start sending
for nZ = 1:nMailsToSend
    try
        % extract student numbers
        sNum = extractAfter(erase(zips(nZ).name,'.zip'),'_');
        %% construct emailadres
        sEma = {[sNum '@student.hhs.nl']};
        sAtt = fullfile(zips(nZ).folder,zips(nZ).name) ;
        sendmail(sEma,...
        ['Biostatica Matlab: ' nameCurrentBonusDir],chr,sAtt);
        movefile(sAtt,apSendFolder);
        nSendMails = nSendMails + 1;
        disp([mfilename ', progress: ' num2str(round(100*nZ/nMailsToSend,1)) '%' ]);
    catch err
        sNum
        keyboard
    end
end
disp(['Send mails: ' num2str(nSendMails)]);
cd(con.BASEFOLDER)


% function sendEmailrecursive(sEma,nameCurrentBonusDir,chr,sAtt)
% try
%     sendmail(sEma,...
%         ['Biostatica Matlab: nagekeken eindopdracht ' nameCurrentBonusDir],chr,sAtt);
% catch
%     pause(5) %Sometimes the the sendmail function does not work properly
%     sendEmailrecursive(sEma,nameCurrentBonusDir,chr,sAtt)
%     keyboard
% end
% 
% end