setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','E_mail','opleidingsbewegingstechnologie@gmail.com');
setpref('Internet','SMTP_Username','opleidingsbewegingstechnologie@gmail.com');
setpref('Internet','SMTP_Password','Ikspeelliamg2');
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
props.setProperty("mail.smtp.port", "465");
sendmail('mjajschrauwenhhs@gmail.com','ftexttobesent') ;