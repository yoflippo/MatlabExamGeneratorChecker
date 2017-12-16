function [grade] = gradeExamFiles(examInfo)
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


for nS = 1:length(mfiles)
    %% Create a fitting search string, to search in examInfo
    s4 = ['Tentamen' filesep];
    ss = extractAfter(mfiles(nS).folder,s4);
    ss = [s4 ss filesep mfiles(nS).name];
    
    %% Search current question examInfo
    index = find(strcmp({examInfo.apQ}, ss)==1);
    if ~isempty(index)
        apSOL = examInfo(index).apSOL;
        apCHECK = replace(apSOL,'_SOL','_CHECK');
        [path,nameCheckFunction] = fileparts(apCHECK);
        addpath(genpath(path));
        apStudentSol = fullfile(mfiles(nS).folder,mfiles(nS).name);
        try
            res = feval(nameCheckFunction,apStudentSol);
            try
                handleGrade(res,apStudentSol,apSOL)
            catch err1
            end
        catch err2
            handleGradeErr(res,err2,apStudentSol,apSOL)
        end
        
        resT = res*examInfo(index).points + resT;
        
% % % % %         if res < 1
% % % % %             open(nameCheckFunction)
% % % % %             open(apStudentSol)
% % % % %             keyboard
% % % % %         end
        
        rmpath(genpath(path));
    end
end

grade = 1 + ((resT*9)/points);
rmpath(genpath('deelopdracht_1'));
rmpath(genpath('deelopdracht_2'));

end

function handleGrade(res,apStudentSol,apSOL)
result = round(res,1)*100;
[path, name, ext] = fileparts(apStudentSol);
answerFile = replace([name ext],'.m','_UITWERKING.m');
if res < 1
    apFinSol = fullfile(path,answerFile);
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
if res < 1
    [path, name, ext] = fileparts(apStudentSol);
    answerFile = replace([name ext],'.m','_UITWERKING.m');
    apFinSol = fullfile(path,answerFile);
    copyfile(apSOL,apFinSol);
    replaceVraagOpdracht(apFinSol,str2num(extractAfter(name,'_')));
end

txtResultStud{1} = ' ';
txtResultStud{2} = ['%% Jij hebt deze opdracht ' num2str(result) '% goed gemaakt.' newline];
txtResultStud{3} = '% Tijdens het uitvoeren trad er een fout op, met deze melding:';
txtResultStud{4} = ['% ' err.message];
WriteToLastLineOfFile(apStudentSol,txtResultStud);

end
