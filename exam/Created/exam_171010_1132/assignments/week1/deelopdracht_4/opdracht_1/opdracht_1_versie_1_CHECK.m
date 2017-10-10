function res = opdracht_1_versie_1_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % function opdracht_1()
% % 'hello world'
% % end
%%==========


% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% THE STUDENT SOLUTION, e.g.: '2+10' or 'vector1+100' or 'size('
% NO SPACES ALLOWED!!
literalsP = {'hello world' 'opdracht_1' 'function' 'function opdracht_1()' 'end'};
% FILL literalsA, With strings that should not be present.
% NO SPACES ALLOWED!!
literalsA = {};




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
    
    %% Create a file from the cleaned file that contains no spaces, for easy txt comparisons
    txtns = nospaces(apCleaned);
    apNospaces = replace(apCleaned,'.m','_NS.m');
    writetxtfile(apNospaces,txtns);
    
    %% Check for literal answers that MUST BE PRESENT
    for nLp = 1:length(literalsP)
        lit = literalsP{nLp};
        lit = lit(lit ~= ' ');% Remove spaces
        if readAndFindTextInFile(apNospaces,lit) || readAndFindTextInFile(apNospaces,fliplr(lit))
            res = res + 1;
        end
    end
    
    %% Check for literal answers, CAN NOT BE PRESENT,  REMOVE ALL SPACES FROM LITERAL!!
    nAbs = 0;
    if ~isequal(res,0)
        for nLa = 1:length(literalsA)
            lit = literalsA{nLa};
            %             lit = lit(lit ~= ' ');% Remove spaces
            if readAndFindTextInFile(apNospaces,lit) || readAndFindTextInFile(apNospaces,fliplr(lit))
                nAbs = nAbs + 1;
            end
        end
    end
    
    %% Calculate the result
    res = (res-nAbs)/(length(literalsP));
    if res < 0
        res = 0;
    elseif res > 1
        res = 1;
    end
end

%% Delete the tmp file
try
    if exist(apCleaned,'file')
        delete(apCleaned);
    end
catch
end
try
    if exist(apNospaces,'file')
        delete(apNospaces);
    end
catch
end

end %function