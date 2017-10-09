function res = opdracht_4_versie_1_CHECK(absPathStudentSol)

res = 0;
numtests = 4;
% % % %% Opdracht 4
% % % % - Maak de volgende variabelen aan: voornaam, achternaam
% % % % - Geef de variabele voornaam de tekst: Jan
% % % % - Geef de variabele achternaam de tekst: Janssen
% % % % - Maak de volgende variabele aan: volledig
% % % % - Koppel de variabele 'voornaam' en 'achternaam' aan elkaar en stop het
% % % %   resultaat in de variabele 'volledig'.
% % % % Test je script of het werkt.
% % %
% % %
% % % voornaam = 'Jan';
% % % achternaam = 'Janssen';
% % % volledig = [voornaam achternaam];


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
    
    voornaamANS = voornaam;
    achternaamANS = achternaam;
    volledigANS = volledig;
    clear voornaam achternaam volledig
    
    % Run the original student scripts, if not working no points!
    try
        run(absPathStudentSol);
    catch
        return;
    end
    
    %% Perform test
    try
        if isequal(voornaamANS,voornaam)
            res = res + (1/numtests);
        end
    catch ErrMess
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
        end
    end
    
    try
        if isequal(achternaamANS,achternaam)
            res = res + (1/numtests);
        end
    catch ErrMess
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
        end
    end
    
    try
        if  isequal(volledigANS,replace(volledig,' ',''))
            res = res + (1/numtests);
        end
    catch ErrMess
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
        end
    end
    
    %% Check for literal answer
    if ~readAndFindTextInFile(absPathTmp,volledigANS)
        res = res + (1/numtests);
    end
    delete(absPathTmp);
end

end %function
