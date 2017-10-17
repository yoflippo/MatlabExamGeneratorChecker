function res = opdracht_XXX_versie_X_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE

%%==========

%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
nameVars = {'XXX' 'XXX' 'XXX'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
literalsP = {'XXX' 2 'XXX' 1};
% FILL literalsA, With strings that should not be present.
literalsA = {'NaN' 'XXX'};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% PLEASE MIND THE REVERSED CASE: '10+2' or  '100+vector1'
literalsR = {'X Y' 'Z U'};




%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.




%% Commence the TESTING !!!
[path name ext] = fileparts(apStudentSol);
% Creates a copy with cleaned code
[txtCleanedStudentSolution apCleaned] = readCleanMFile('-ap',apStudentSol,'mc');

if ~isempty(char(txtCleanedStudentSolution))
    %% Run the solution file - HAS TO WORK!!
    try
        run(replace(mfilename,'_CHECK','_SOL'));
    catch ErrMess
            error([mfilename ': SERIEUS PROBLEM WITH SOL FILE ' ErrMess.message]);
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
            error('Something wrong the readClean function');
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
    for nLp = 1:2:length(literalsP)
        lit = literalsP{nLp};
        lit = lit(lit ~= ' ');% Remove spaces
        if findRegEx(txtns,lit) >= literalsP{nLp+1}
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
    
    %% Check for literal answers that could be present reversed
    for nLr = 1:length(literalsR)
        lits = literalsR{nLr};
        litRs = reverseSpaceSeparatedString(lit);
        lit = lits(lits ~= ' ');      % Remove spaces
        litR = litRs(litRs ~= ' ');   % Remove spaces
        if findRegEx(txtns,lit) > 0 || findRegEx(txtns,litR) > 0
            res = res + 1;
        else
            % Test for a generated file! Could also be done by testing for Hash
            if ~contains(apStudentSol,'versie')
                WriteToLastLineOfFile(apStudentSol,['% Moet in de code zitten: ' lits ' or ' litRs '.']);
            end
        end
    end
    
    
    %% Delete the tmp file
    if exist(apCleaned,'file')
        delete(apCleaned);
    end
    
    %% Calculate the result
    res = (res-nAbs)/((length(literalsP)/2)+length(nameVars)+length(literalsR));
    if res < 0
        res = 0;
    elseif res > 1
        res = 1;
    end
end

%% Delete the tmp files
deleteTemporaryFiles()

end %function