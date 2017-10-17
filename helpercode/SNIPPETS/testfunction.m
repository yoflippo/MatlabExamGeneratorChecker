opfunction res = opdracht_XXX_versie_X_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE

%%==========


% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
literalsP = {'XXX' 2 'XXX' 1};
literalsA = {'NaN'};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
literalsR = {'X Y' 'Z U'};

    

%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Literals that should be present and
% 2- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.




%% Commence the TESTING !!!
[path name ext] = fileparts(apStudentSol);
nmSolution = replace(mfilename,'_CHECK','_SOL');
[txtCleanedStudentSolution apCleaned] = readCleanMFile('-ap',apStudentSol,'mc');
[apClean nmClean extClean] = fileparts(apCleaned);
%txtCleanedStudentSolution= readCleanMFile(apStudentSol);

if ~isempty(char(txtCleanedStudentSolution))
    %% Create compare the solution file with the student solution
    series = 1:2:10;
    for z = series
        varInput = 0:10; %%%%%%%%%% XXXXXXXXXXXX ADJUST ME Not Too manyXXXXXXXXXXXXX
        try
            if eval([nmClean '(varInput)']) == eval([nmSolution '(varInput)'])
                res = res + 1;
            end
        catch ErrMess
            % Test for a generated file! Could also be done by testing for Hash
            if ~contains(apStudentSol,'versie')
                WriteToLastLineOfFile(apStudentSol,['% Deze code werkt niet met de input: ' num2str(varInput)]);
            end
        end
    end
    
    
    %% Create a file from the cleaned file that contains no spaces, for easy txt comparisons
    txtns = nospaces(apCleaned);
    
    %% Check for literal answers that MUST BE PRESENT
    for nLp = 1:2:length(literalsP)
        lit = literalsP{nLp};
        lit = lit(lit ~= ' ');% Remove spaces
        if findInString(txtns,lit) >= literalsP{nLp+1}
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
    if ~isequal(res,0)
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
    end
    
    %% Check for literal answers that could be present reversed
    for nLr = 1:length(literalsR)
        lits = literalsR{nLr};
        litRs = reverseSpaceSeparatedString(lits);
        lit = lits(lits ~= ' ');      % Remove spaces
        litR = litRs(litRs ~= ' ');   % Remove spaces
        if findInString(txtns,lit) > 0 || findInString(txtns,litR) > 0
            res = res + 1;
        else
            % Test for a generated file! Could also be done by testing for Hash
            if ~contains(apStudentSol,'versie')
                WriteToLastLineOfFile(apStudentSol,['% Moet in de code zitten: ' lits ' or ' litRs '.']);
            end
        end
    end
    
    %% Calculate the result
    res = (res-nAbs)/(length(literalsP)+length(series)+length(literalsR));
    if res < 0
        res = 0;
    elseif res > 1
        res = 1;
    end
end
deleteTemporaryFiles();

end %function