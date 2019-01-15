%https://nl.mathworks.com/matlabcentral/answers/94446-can-i-send-e-mail-through-matlab-using-microsoft-outlook
cd(con.BASEFOLDER)

setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','E_mail','opleidingbewegingstechnologie@gmail.com');
setpref('Internet','SMTP_Username','opleidingbewegingstechnologie@gmail.com');
setpref('Internet','SMTP_Password','btokee2btokee');
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

assignmentNum = '2'
nameCurrentBonusDir = ['BonusOpdracht' assignmentNum '_checked']
cd(fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER));
cd(nameCurrentBonusDir);

studentNumbers = unique(load(fullfile(con.BASEFOLDER,'studentnumbers','studentnumbers.txt')))
strStudentNumbers = string(num2str(studentNumbers));

nmAssignment = 'BonusOpdracht2';


%% Recover earlier saved studentnumbers to prevent multiple e-mail to same student
try
    load('strStudentNumbers.mat','strStudentNumbers');
    warning('RELOAD studentnumbers!!!!!');
catch
end

%% Message for student
% chr = 'Beste student,';
% chr = [chr newline ];
% chr = [chr newline 'In de bijlage van deze e-mail staat jouw nagekeken eindopdracht'];
% chr = [chr newline 'van ' nmAssignment ' voor Biostatica Matlab.'];
% chr = [chr newline];
% chr = [chr newline 'In het zip-bestand zit een m-file met de naam: "JouwCijfer.m".'];
% chr = [chr newline 'Als een vraag/opdracht niet 100% correct is, wordt de uitwerking'];
% chr = [chr newline 'er bij gegeven. Zo kun je leren van je fouten.'];
% chr = [chr newline newline 'Onderaan jouw uitwerking kan extra informatie staan over wat er fout is gegaan.'];
% chr = [chr newline];
% chr = [chr newline 'Op deze e-mail wordt niet gereageerd.'];
% chr = [chr newline 'Als je denkt dat er iets niet klopt, kom dan langs bij '];
% chr = [chr newline 'Mark Schrauwen in RZ 0.09 of stuur een e-mail naar mjschrau@hhs.nl. '];
% chr = [chr newline];
% chr = [chr newline newline 'Met vriendelijke groet,'];
% chr = [chr newline 'Mark Schrauwen'];

%% Message for student
chr = 'Beste student,';
chr = [chr newline ];
chr = [chr newline 'In de bijlage van deze e-mail staat jouw opnieuw nagekeken eindopdracht'];
chr = [chr newline 'van ' nmAssignment ' voor Biostatica Matlab.'];
chr = [chr newline];
chr = [chr newline 'In het zip-bestand zit een m-file met de naam: "JouwCijfer.m".'];
chr = [chr newline 'Als een vraag/opdracht niet 100% correct is, wordt de uitwerking'];
chr = [chr newline 'er bij gegeven. Zo kun je leren van je fouten.'];
chr = [chr newline newline 'Onderaan jouw uitwerking kan extra informatie staan over wat er fout is gegaan.']
chr = [chr newline];
chr = [chr newline 'Op deze e-mail wordt niet gereageerd.'];
chr = [chr newline 'Als je denkt dat er iets niet klopt, kom dan langs bij '];
chr = [chr newline 'Mark Schrauwen in RZ 0.09 of stuur een e-mail naar mjschrau@hhs.nl. '];
chr = [chr newline];
chr = [chr newline newline 'Met vriendelijke groet,'];
chr = [chr newline 'Mark Schrauwen'];


%% Make dir send
zips = dir(['**' filesep '*.zip']);
nSendMails = 0;
nMailsToSend = length(zips);
oldPath = pwd;
cd ..
sendFolder = [nmAssignment '_send'];
mkdirIf(sendFolder);
apSendFolder = fullfile(pwd,sendFolder);
cd(oldPath)
%% Send mails
for nZ = 1:length(zips)
    if contains(zips(nZ).name,'Checked')
        try
            %% extract student numbers
            sNum = findStudentNumberInTxt(zips(nZ).name);
            indices = contains(strStudentNumbers,sNum);
            if any(indices)
                %% construct emailadres
                sEma = [sNum '@student.hhs.nl']
                sAtt = fullfile(zips(nZ).folder,zips(nZ).name);
                sendmail(sEma,...
                    ['Biostatica Matlab: nagekeken ' nmAssignment],chr,sAtt);
                % Remove studentnumber from list
                strStudentNumbers = strStudentNumbers(not(indices))
                movefile(sAtt,apSendFolder);
                clc
            else
                error([mfilename ': Something is wrong, student has submitted that is not in the list']);
            end
        catch err
            save('strStudentNumbers.mat','strStudentNumbers')
            error([mfilename ': sending of Checked e-mails stopped...']);
        end
        nSendMails = nSendMails + 1;
    end
    disp(['Send mails: ' num2str(nSendMails)]);
    cd(con.BASEFOLDER)
end

%% Message for student that did not submit.
chrns = 'Beste student,';
chrns = [chrns newline ];
chrns = [chrns newline 'Wij hebben geen eindopdracht van jou ontvangen of'];
chrns = [chrns newline 'je hebt de verkeerde bestanden opgestuurd '];
chrns = [chrns newline 'van ' nmAssignment ' voor Biostatica Matlab.'];
chrns = [chrns newline];
chrns = [chrns newline 'Als je denkt dat er iets niet klopt, kom dan langs bij '];
chrns = [chrns newline 'Mark Schrauwen in RZ 0.09. '];
chrns = [chrns newline];
chrns = [chrns newline 'In de bijlage van deze e-mail staan de uitwerkingen van jouw opdrachten.'];
chrns = [chrns newline];
chrns = [chrns newline 'Op deze e-mail wordt niet gereageerd.'];
chrns = [chrns newline];
chrns = [chrns newline newline 'Met vriendelijke groet,'];
chrns = [chrns newline 'Mark Schrauwen'];

%% Send students without submission an e-mail
apSol = fullfile(con.BASEFOLDER,con.STUDENTASSFOLDER,[nmAssignment '_SOL']);
cd(apSol)

cd(apSendFolder)
files = dir('*.zip');
for nF = 1:length(files)
    currFile = fullfile(files(nF).folder,files(nF).name);
    currStud = findStudentNumberInTxt(currFile);
    indices = contains(strStudentNumbers,currStud);
    strStudentNumbers = strStudentNumbers(not(indices));
end

% Recover earlier saved studentnumbers to prevent multiple e-mail to same student
try
    load('strStudentNumbers.mat','strStudentNumbers');
    warning('RELOAD studentnumbers!!!!!');
catch
end

keyboard
for nS = 1:length(strStudentNumbers)
    % extract student numbers
    sNum = strStudentNumbers(nS);
    % construct emailadres
    sEma = [char(sNum) '@student.hhs.nl']
    try
        apSolStud = fullfile(apSol,[nmAssignment '_' char(sNum) '.zip']);
        if ~exist(apSolStud,'file')
            error([newline mfilename ': ' newline 'SOL file not found!']);
        end
        sendmail(sEma,...
            ['Biostatica Matlab: geen/verkeerde ' nmAssignment],chrns,apSolStud);
        nSendMails = nSendMails + 1;
    catch err
        save('strStudentNumbers.mat','strStudentNumbers')
        error([newline mfilename ': ' newline err.message newline]);
    end
    disp(['Send mails: ' num2str(nSendMails)]);
end