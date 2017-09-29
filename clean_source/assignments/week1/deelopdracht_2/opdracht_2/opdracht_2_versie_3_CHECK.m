function res = opdracht_2_versie_3_CHECK(absPathStudentSol)

res = 0;
numtests = 6;

% %% Opdracht 1
% % Maak een variabele aan met de naam: boeya.
% % Voer een berekening uit waarbij je de waardes 7 en 13 bij elkaar
% % optelt.
% % Test je script of het werkt.
% boeya = 7 + 13;
a = 7;
b = 13;
at = num2str(a);
bt = num2str(b);

%% Get cleaned temporary file
[path name ext] =fileparts(absPathStudentSol);
tmp = readCleanMFile(absPathStudentSol);

%% Use the cleaned code to check for certain lines
if ~isempty(char(tmp))
    % Make temp file
    absPathTmp = fullfile(path,'tmp');
    makeMFileFromCells(absPathTmp,tmp);
    absPathTmp = fullfile(path,'tmp.m');
    
    %% Run the original student scripts, if not working no points!
    try
        run(absPathStudentSol);
    catch
        return;
    end
    
    %% Perform specific string test on the code, which lines should exists? Which NOT!?
    
    % Test for script specific variables and values
    if exist('boeya')
        if boeya == (a+b)
            res = res + (1/numtests);
        end
    end
    
    if readAndFindTextInFile(absPathTmp,'+')
        res = res + (1/numtests);
    end
    if readAndFindTextInFile(absPathTmp,num2str(a))
        res = res + (1/numtests);
    end
    if readAndFindTextInFile(absPathTmp,num2str(b))
        res = res + (1/numtests);
    end
    if ~readAndFindTextInFile(absPathTmp,num2str(a+b))
        res = res + (1/numtests);
    end
    
    ts = [at '+' bt];
    if readAndFindTextInFile(absPathTmp,ts) || readAndFindTextInFile(absPathTmp,fliplr(ts))
        res = res + (1/numtests);
    end
    

    %% Delete temp file
    delete(absPathTmp);
end
