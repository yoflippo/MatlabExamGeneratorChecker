function [grade,resultOverview] = gradeExamFiles(examInfo)
% keyboard %% Aanpassen voor vernieuwde manier om cijfers te berekenen
resT = 0;
points = sum([examInfo.points]);

%% Get the right assignments
cd('deelopdracht_1')
mfiles1 = dirmf();
cd ..
addpath(genpath('deelopdracht_1'));
cd('deelopdracht_2')
mfiles2 = dirmf();
cd ..
addpath(genpath('deelopdracht_2'));
mfiles = [mfiles1; mfiles2];
nfiles = length(mfiles);
oldPath = pwd;
resultOverview = cell(1,length({examInfo.apQ}));
for nS = 1:nfiles
    %% Create a fitting search string, to search in examInfo
    %     s4 = ['Tentamen' filesep];
    %     ss = extractAfter(mfiles(nS).folder,s4);
    s2 = strfind(mfiles(nS).folder,'deelopdracht');
    s2 = fullfile(mfiles(nS).folder(s2:end),mfiles(nS).name);
    ss = fullfile('Tentamen',s2);
    
    
    %% Search current question examInfo
    index = find(strcmp({examInfo.apQ}, ss));
    res = 0;
    if ~isempty(index)
        apSOL = examInfo(index).apSOL;
        apCHECK = replace(apSOL,'_SOL','_CHECK');
        cd(fileparts(apCHECK)); %%% Need to add this to use function_handle, WHY???
        %         [pth,nameCheckFunction] = fileparts(apCHECK);
        F = function_handle(apCHECK);
        %         addpath(genpath(pth));
        apStudentSol = fullfile(mfiles(nS).folder,mfiles(nS).name);
        try
            res = F(apStudentSol);
            try
                handleGrade(res,apStudentSol,apSOL)
            catch err1
            end
        catch err2
            handleGradeErr(res,err2,apStudentSol,apSOL)
        end
        resultOverview{1,index} = res;
        resT = res*examInfo(index).points + resT;
        
        % % % % %         if res < 1
        % % % % %             open(nameCheckFunction)
        % % % % %             open(apStudentSol)
        % % % % %             keyboard
        % % % % %         end
        
        %         rmpath(genpath(pth));
    end
    disp([mfilename ', processed files: ' num2str(nS) ' of ' num2str(nfiles) ' (' mfiles(nS).name ')']);
end

cd(oldPath);
grade = 1 + ((resT*9)/points);

if grade > 10 || grade < 1
    keyboard %something is wrong bub
end

rmpath(genpath('deelopdracht_1'));
rmpath(genpath('deelopdracht_2'));
end

function handleGrade(res,apStudentSol,apSOL)
result = round(res,1)*100;
[pth, name, ext] = fileparts(apStudentSol);
answerFile = replace([name ext],'.m','_UITWERKING.m');
if res < 1
    apFinSol = fullfile(pth,answerFile);
    copyfile(apSOL,apFinSol);
    replaceVraagOpdracht(apFinSol,str2num(extractAfter(name,'_')));
end
txtResultStud{1} = [newline '%% Jij hebt deze opdracht ' num2str(round(result)) '% goed gemaakt.' newline];
txtResultStud{2} = '% Indien je een score lager dan 100% hebt, bekijk dan het bestand';
txtResultStud{3} = ['% ' answerFile ' voor de oplossing\uitwerking.'];
WriteToLastLineOfFile(apStudentSol,txtResultStud);
end


function handleGradeErr(res,err,apStudentSol,apSOL)
result = round(res,1)*100;
keyboard %THIS FUNCTION NEEDS TO BE CHECKED!!
open(apSOL)
open(apStudentSol)
if res < 1
    [pth, name, ext] = fileparts(apStudentSol);
    answerFile = replace([name ext],'.m','_UITWERKING.m');
    apFinSol = fullfile(pth,answerFile);
    copyfile(apSOL,apFinSol);
    replaceVraagOpdracht(apFinSol,str2num(extractAfter(name,'_')));
end

txtResultStud{1} = ' ';
txtResultStud{2} = ['%% Jij hebt deze opdracht ' num2str(result) '% goed gemaakt.' newline];
txtResultStud{3} = '% Tijdens het uitvoeren trad er een fout op, met deze melding:';
txtResultStud{4} = ['% ' err.message];
WriteToLastLineOfFile(apStudentSol,txtResultStud);

end
