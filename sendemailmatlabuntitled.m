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


setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','E_mail','opleidingbewegingstechnologie@gmail.com');
setpref('Internet','SMTP_Username','opleidingbewegingstechnologie@gmail.com');
setpref('Internet','SMTP_Password','btokee2btokee');
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
sendmail('yoflippo@gmail.com','texttobesent') ;


% sendmail('yoflippo@gmail.com',...
%          'Test Biostatica Matlab','Test Bericht',...
%          {'/home/yoflippo/Dropbox/sendemailmatlabuntitled.m'});
%https://nl.mathworks.com/matlabcentral/answers/94446-can-i-send-e-mail-through-matlab-using-microsoft-outlook