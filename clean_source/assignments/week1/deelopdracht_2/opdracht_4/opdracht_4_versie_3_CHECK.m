function res = opdracht_4_versie_3_CHECK(absPathStudentSol)

res = 0;
numtests = 4;
% % % %% Opdracht 4
% % % % - Maak de volgende variabelen aan: firstname, lastname
% % % % - Geef de variabele firstname de tekst: Frans
% % % % - Geef de variabele lastname de tekst: Ferdinand
% % % % - Maak de volgende variabele aan: fullname
% % % % - Koppel de variabele 'firstname' en 'lastname' aan elkaar en stop het
% % % %   resultaat in de variabele 'fullname'.
% % % % Test je script of het werkt.
% % %
% % %
% % % firstname = 'Frans';
% % % lastname = 'Ferdinand';
% % % fullname = [firstname lastname];


%% Get cleaned temporary file
[path name ext] =fileparts(absPathStudentSol);
tmp = readCleanMFile(absPathStudentSol);

%% Use the cleaned code to check for certain lines
if ~isempty(char(tmp))
    % Make temp file
    absPathTmp = fullfile(path,'tmp');
    makeMFileFromCells(absPathTmp,tmp);
    absPathTmp = fullfile(path,'tmp.m');
    
    % Run the solution file
    try
        run(replace(mfilename,'_CHECK','_SOL'));
    catch
        return;
    end
    
    firstnameANS = firstname;
    lastnameANS = lastname;
    fullnameANS = fullname;
    clear firstname lastname fullname
    
    % Run the original student scripts, if not working no points!
    try
        run(absPathStudentSol);
    catch
        return;
    end
    
    %% Perform test
    if isequal(firstnameANS,firstname)
        res = res + (1/numtests);
    end
    if isequal(lastnameANS,lastname)
        res = res + (1/numtests);
    end
    if  isequal(fullnameANS,replace(fullname,' ',''))
        res = res + (1/numtests);
    end
    %% Check for literal answer
    if ~readAndFindTextInFile(absPathTmp,fullnameANS)
        res = res + (1/numtests);
    end
    
    delete(absPathTmp);
end

end %function
