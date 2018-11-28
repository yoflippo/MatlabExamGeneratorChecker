%% Beste student,
% Hieronder volgt de laatste opdracht.
%
% Als jij deze opdracht hebt afgerond, gebruik dan 'AfrondenWeekOpdracht.m'
% om jouw werk automatisch in een zip-bestand te zetten.
%
% Deze laatste opdracht bestaat uit  6  onderdelen.
%
%
%% 1 -   Vul hier jouw studentennummer in, LET OP! Maak hier geen fouten in.
%        Jouw studentennummer gebruiken wij voor het nakijken.
StudentenNummer = NaN;

%% 2 -   Vul jouw naam in als een string
Naam = 'Voornaam Achternaam';

%% 3 -   Wat vond je van de moeilijkheidsgraad van deze weekeindoprachten?
%        Je kunt kiezen uit 1: (gemakkelijk) tot en met 5 (heel erg moeilijk).
Moeilijkheidsgraad = NaN; %getal tussen 1 tot en met 5

%% 4 -   Wat vond je van de hoeveelheid vragen/opdrachten?
%        Je kunt kiezen uit 1 (te weinig) tot en met 5 (veel te veel).
Hoeveelheid = NaN; %getal tussen 1 tot en met 5

%% 5 -   Wij zijn geinteresseerd in wat je nog meer vond van deze opdrachten
%        Voer zodadelijk 'AfrondenWeekOpdracht.m' uit (openen en uitvoeren) en
%        lever het automatisch gegeneerde zip-bestand in.
%
%        Druk nu op F5 om op te schrijven wat je nog meer vond van de
%
% Einde van de opdrachtsbeschrijving.

























































































%% Maken en openen van txtbestand
if isnan(StudentenNummer) || isnan(Moeilijkheidsgraad) || isnan(Hoeveelheid) || contains(Naam,'rnaam','IgnoreCase',true)
    warningtxt = [newline newline];
    warningtxt = [warningtxt 'Als je niet alle gegevens (correct) invult, trekken we punten af van je opdracht of'];
    warningtxt = [warningtxt newline 'wordt er niets nagekeken!!'];
    warningtxt = [warningtxt newline newline];
    warningtxt = [warningtxt 'DIT SCRIPT IS NOG NIET CORRECT UITGEVOERD!'];
    warningtxt = [warningtxt newline newline];
    warning(warningtxt)
else
    apThisFile = fileparts(mfilename('fullpath'));
    nmTxtFile = 'GeefJouwMening.txt';
    apTxtFile = fullfile(apThisFile,nmTxtFile);
    txt{1} = 'Beste student,';
    txt{2} = 'Schrijf hier op wat je de opdrachten vond.';
    txt{3} = 'Wij lezen het liefst veel kritiek in je commentaar.';
    txt{4} = 'LET OP! Zorg dat je specifiek bent. Zonder voorbeelden is het';
    txt{5} = 'bijna onmogelijk voor ons om verbeteringen door te voeren op';
    txt{6} = 'basis van jouw commentaar';
    txt{7} = '';
    txt{8} = 'Sla dit bestand op!';
    txt{9} = '';
    txt{10} = 'JOUW COMMENTAAR:';
    fileID = fopen(apTxtFile,'a');
    for i = 1:length(txt)
        fprintf(fileID,'%s\r\n',txt{i});
    end
    open(apTxtFile)
    fclose('all');
end




















