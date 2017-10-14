function res = opdracht_3_versie_2_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % function MaxDivMin = opdracht_3(beenlengtes)
% % % % MaxDivMin = max(beenlengtes)/min(beenlengtes);
% % % % end
%%==========


% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% THE STUDENT SOLUTION, e.g.: '2+10' or 'vector1+100' or 'size('
% NO SPACES ALLOWED!!
literalsP = {'max(beenlengtes)' 'min(beenlengtes)' '/'};
% FILL literalsA, With strings that should not be present.
% NO SPACES ALLOWED!!
literalsA = {'NaN'};




%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.




%% Commence the TESTING !!!
[~ , ~ , ~] = fileparts(apStudentSol);
nmSolution = replace(mfilename,'_CHECK','_SOL');
[txtCleanedStudentSolution, apCleaned] = readCleanMFile('ap',apStudentSol,'mc');
[~, nmClean , ~] = fileparts(apCleaned);
%txtCleanedStudentSolution= readCleanMFile(apStudentSol);

if ~isempty(char(txtCleanedStudentSolution))
    %% Create compare the solution file with the student solution
    
    series = 1:2:10;
    for z = series
        varInput = randn(1,z)*50;
        try
            if eval([nmClean '(varInput)']) == eval([nmSolution '(varInput)'])
                res = res + 1;
            end
        catch
        end
    end
    
    
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
            lit = lit(lit ~= ' ');% Remove spaces
            if readAndFindTextInFile(apNospaces,lit) || readAndFindTextInFile(apNospaces,fliplr(lit))
                nAbs = nAbs + 1;
            end
        end
    end
    
    %% Delete the tmp files
    try
        currPath = pwd;
        cd(fileparts(mfilename('fullpath')))
        cfiles = dirmf('_COPY');
        cfiles = [cfiles; dirmf('_NS')];
        warning off
        for n = 1:length(cfiles)
            delete(fullfile(cfiles(n).folder,cfiles(n).name));
        end
        warning on
        cd(currPath);
    catch err
        error([mfilename ': ' err.message]);
    end
    
    
    %% Calculate the result
    res = (res-nAbs)/(length(literalsP)+length(series));
    if res < 0
        res = 0;
    elseif res > 1
        res = 1;
    end
end



end %function