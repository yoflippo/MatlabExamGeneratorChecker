function res = opdracht_7_versie_1_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
%% Opdracht 7
% % % % % % % Gegeven onderstaande script met een bijzondere vector.
% % % % % % % Vraag m.b.v. een standaard Matlab functie de afmetingen op van de
% % % % % % % vector 'matx'.
% % % % % % % Deze functie geeft het aantal rijen en kolommen terug van de variabele.
% % % % % % % Stop vervolgens de het aantal rijen in de variabele: 'rijn' en
% % % % % % % stop daarna het aantal kolommen in de variabele 'koln'.
% % % % % %
% % % % % % matx = [3 5 6 7 8 5 4 5;
% % % % % %         5 4 5 8 7 6 5 3;
% % % % % %         3 2 3 6 5 4 3 1;];
% % % % % %
% % % % % % [koln rijn] = size(matx);
%%==========

%% FILL nameVars WITH VARIABLES PRESENT IN SOLUTION FILE THAT THE STUDENT
% SHOULD CHANGE!
nameVars = {'koln' 'rijn'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% THE STUDENT SOLUTION, e.g.: '2+10' or 'vector1+100'
% NO SPACES ALLOWED!!
literalsP = {'size('};
% FILL literalsA, With strings that should not be present.
% NO SPACES ALLOWED!!
literalsA = {'NaN' 'koln=8' 'rijn=3'};

%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take some cornercases in to consideration as well.

%% Commence the TESTING !!!
[path name ext] = fileparts(apStudentSol);
[txtCleanedStudentSolution apCleaned] = readCleanMFile(apStudentSol);

if ~isempty(char(txtCleanedStudentSolution))
    %% Run the solution file - HAS TO WORK!!
    try
        run(replace(mfilename,'_CHECK','_SOL'));
    catch
        return;
    end
    
    % Get values and variables from the SOLUTION file
    for nV = 1:length(nameVars)
        % Save the variables in the SOLUTION FILE
        eval(['var' num2str(nV) 'ANS = ' nameVars{nV} ';']);
        % Remove solution variables from Workspace.
        eval(['clear ' nameVars{nV}  ';']);
    end
    
    %% Run the original student scripts, if not working no points!
    try
        run(apCleaned);
        if exist(apClean,'file')
            delete(apClean);
        end
    catch
        delete(apCleaned);
        return;
    end
    
    %% Perform tests for certain variables
    for nV = 1:length(nameVars)
        try
            eval(['blTest = isequal(var' num2str(nV) 'ANS, ' nameVars{nV} ');']);
            if blTest
                res = res + 1;
            end
        catch ErrMess
            % Test for a generated file! Could also be done by testing for Hash
            if ~contains(apStudentSol,'versie')
                WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
            end
        end
    end
    
    %% Check for literal values and variables
    % Make temp file
    absPathTmp = fullfile(path,'tmp.m');
    if exist(absPathTmp,'file')
        delete(absPathTmp);
    end
    makeMFileFromCells(absPathTmp,txtCleanedStudentSolution);
    
    %% Check for literal answers, must be present
    for nLp = 1:length(literalsP)
        if readAndFindTextInFile(absPathTmp,literalsP{nLp}) || readAndFindTextInFile(absPathTmp,fliplr(literalsP{nLp}))
            res = res + 1;
        end
    end
    
    %% Check for literal answers, CAN NOT BE PRESENT,  REMOVE ALL SPACES FROM LITERAL!!
    nAbs = 0;
    if ~isequal(res,0)
        for nLa = 1:length(literalsA)
            if readAndFindTextInFile(absPathTmp,literalsA{nLa}) || readAndFindTextInFile(absPathTmp,fliplr(literalsA{nLa}))
                nAbs = nAbs + 1;
            end
        end
    end
    
    %% Delete the tmp file
    if exist(absPathTmp,'file')
        delete(absPathTmp);
    end
end
res = (res-nAbs)/(length(literalsP)+length(nameVars));
if res<0
    res = 0;
end
end %function