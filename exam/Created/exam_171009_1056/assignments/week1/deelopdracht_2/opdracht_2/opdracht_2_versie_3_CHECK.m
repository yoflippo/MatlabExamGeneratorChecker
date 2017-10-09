function res = opdracht_2_versie_3_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % %% Opdracht 2
% % % % % % Maak een variabele aan met de naam: boeya.
% % % % % % Voer een berekening uit waarbij je de waardes 7 en 13 bij elkaar
% % % % % % optelt.
% % % % % 
% % % % % boeya = 7 + 13;
%%==========

%% FILL nameVars WITH VARIABLES PRESENT IN SOLUTION FILE THAT THE STUDENT
% SHOULD CHANGE!
nameVars = {'boeya'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% THE STUDENT SOLUTION, e.g.: '2+10' or 'vector1+100' or 'size('
% NO SPACES ALLOWED!!
literalsP = {'7' '+' '13'};
% FILL literalsA, With strings that should not be present.
% NO SPACES ALLOWED!!
literalsA = {'NaN' '20'};




%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.




%% Commence the TESTING !!!
[path name ext] = fileparts(apStudentSol);
[txtCleanedStudentSolution apCleaned] = readCleanMFile('-ap',apStudentSol,'mc');
%txtCleanedStudentSolution= readCleanMFile(apStudentSol);

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
    
    %% Run the cleaned student script, if not working no points!
    try
        if exist(apCleaned,'file')
            run(apCleaned);
            delete(apCleaned);
        else
            run(apStudentSol);        
        end
    catch
        delete(apCleaned);
        return;
    end
    
    %% Perform tests for certain variables in the Workspace
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
    
    
    %% Check for literal answers that MUST BE PRESENT
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
    
    %% Calculate the result
    res = (res-nAbs)/(length(literalsP)+length(nameVars));
    if res < 0
        res = 0;
    elseif res > 1
        res = 1;
    end
    
end



end %function