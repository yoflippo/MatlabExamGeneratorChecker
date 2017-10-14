function res = opdracht_XXX_versie_X_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE

%%==========

%% FILL nameVars WITH VARIABLES PRESENT IN SOLUTION FILE THAT THE STUDENT
% SHOULD CHANGE!
nameVars = {'XXX' 'XXX' 'XXX'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100' or 'size('
% PLEASE MIND THE REVERSED CASE: '10+2' or  '100+vector1'
literalsP = {'XXX' 'XXX' 'XXX'};
% FILL literalsA, With strings that should not be present.
literalsA = {'NaN' 'XXX'};




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
    catch ErrMess
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
            txtns = nospaces(apCleaned);
        else
            run(apStudentSol);
            txtns = nospaces(apStudentSol);
        end
    catch ErrMess
        % Test for a generated file! Could also be done by testing for Hash
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
        end
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
    
    
    %% Check for literal answers that MUST BE PRESENT
    for nLp = 1:length(literalsP)
        lit = literalsP{nLp};
        lit = lit(lit ~= ' ');% Remove spaces
        if findRegEx(txtns,lit) > 0
            res = res + 1;
        else
            % Test for a generated file! Could also be done by testing for Hash
            if ~contains(apStudentSol,'versie')
                WriteToLastLineOfFile(apStudentSol,['% Ontbreekt aan de code: ' literalsP{nLp}]);
            end
        end
    end
    
    %% Check for literal answers, CAN NOT BE PRESENT,  REMOVE ALL SPACES FROM LITERAL!!
    nAbs = 0;
    for nLa = 1:length(literalsA)
        lit = literalsA{nLa};
        lit = lit(lit ~= ' ');% Remove spaces
        if findRegEx(txtns,lit) > 0
            nAbs = nAbs + 1;
        else
            % Test for a generated file! Could also be done by testing for Hash
            if ~contains(apStudentSol,'versie')
                WriteToLastLineOfFile(apStudentSol,['% Mag niet in de code zitten: ' literalsA{nLa}]);
            end
        end
    end
    
    %% Delete the tmp file
    if exist(apCleaned,'file')
        delete(apCleaned);
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