% setpref('Internet','SMTP_Server','smtp.gmail.com');
% setpref('Internet','E_mail','mjajschrauwenhhs@gmail.com');
% setpref('Internet','SMTP_Username','mjajschrauwenhhs@gmail.com');
% setpref('Internet','SMTP_Password','mijh_SCHIMPFWORT_21');
% props = java.lang.System.getProperties;
% props.setProperty('mail.smtp.auth','true');
% props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
% props.setProperty('mail.smtp.socketFactory.port','465');
% sendmail('yoflippo@gmail.com','texttobesent') ;

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
chr = 'Beste student,';
chr = [chr newline 'In de bijlage van deze e-mail staat jouw eindopdracht'];
chr = [chr newline 'van ' thisWeek ' voor Biostatica Matlab.'];
chr = [chr newline 'Je moet deze opdracht voor volgende week woensdag'];
chr = [chr newline '23:59u inleveren via Blackboard.'];
chr = [chr newline newline 'Met vriendelijke groet,'];
chr = [chr newline 'Mark Schrauwen'];

zips = dir(['**' filesep '*.zip']);
for nZ = 1:length(zips)
   %% extract student numbers
   sNum = extractAfter(erase(zips(nZ).name,'.zip'),'_');
   %% construct emailadres
   sEma = [sNum '@student.hhs.nl']
   sAtt = fullfile(pwd,zips(nZ).name) 
   sendmail('yoflippo@gmail.com',...
         'Biostatica Matlab eindopdracht week 1',chr,...
         {sAtt});
end
cd(BASEFOLDER)
% sendmail('yoflippo@gmail.com',...
%          'Test Biostatica Matlab','Test Bericht',...
%          {'/home/yoflippo/Dropbox/sendemailmatlabuntitled.m'});
%https://nl.mathworks.com/matlabcentral/answers/94446-can-i-send-e-mail-through-matlab-using-microsoft-outlook