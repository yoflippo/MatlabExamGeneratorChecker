%% ==================== BLIJF VAN DE VOLGENDE CODE AF! ====================
%                    |df8c7722151de9c778bae7d2a1632637|
%                            1711221742
%
% LEES DE VOLGENDE REGELS:
%
% 1 -   De volgende DOOR ONS AANGEMAAKTE zaken mag je NIET aanpassen:
%                           A: Bestandsnamen
%                           B: Door ons aangemaakt commentaar
%                           C: Folders en folderstructuur
%                           D: De code in deze codesectie
%       Doe je dat toch dan krijg je GEEN punten voor deze weekopdracht.
% 2 -   Als dit bestand niet uit te voeren valt, bijvoorbeeld doordat je
%       tijdens het uitvoeren een foutmelding krijgt, krijg je GEEN punten!
% 3 -   Elke variabele waar 'NaN' aan wordt toegekend moet JIJ bewerken.
% 4 -   Je maakt de opdracht in dit bestand. Vul het bestand alleen met
%       voor de opdracht nuttige code. Doe je dit niet dan kan dat een
%       vermindering van het te verdienen aantal punten als gevolg hebben.
% 5 -   Door JOU geschreven commentaar regels (met %% of %) worden niet
%       door ons gelezen of gebruikt. 
% 
% Opdrachtbeschrijving:
% Deze opdracht bestaat uit het schrijven/aanvullen van een FUNCTIE. De
% specifieke opdracht staat hieronder.
%
% LET OP!!!!
% Dit bestand mag alleen de FUNCTIE bevatten en niets anders.
%
% =================== BLIJF VAN VOORGAANDE CODE AF! ======================
 
%% Opdracht 5
% Maak een functie met de naam opdracht_5.
% De functie heeft twee inputs genaamd: AA en B.
% De functie heeft twee outputs genaamd: CC en D.
%
% M.b.v. de functie strlength() kun je de lengte van een string opvragen.
% Als de lengte van de string in input AA groter is dan 8 moet de
% string aan CC worden meegegeven. In elk ander geval wordt "CC = '';" (een
% lege string).
% Als de lengte van de string in input B kleiner is dan 8 moet de
% string aan D worden meegegeven. In elk ander geval wordt "D = '';" (een
% lege string).
%
% Voorbeeld aanroep:
%                   [AA b] = opdracht_5_versie_1_SOL('abcdeabcdea','abc') 
% geeft als output:
%                   AA = 'abcdeabcdea'
%                   b = 'abc'
%

function [CC, D] = opdracht_5(AA,B)
   
if strlength(AA) > 8
    CC = AA;
else
    CC = '';
end

if strlength(B) < 8
    D = B;
else
    D = '';
end

end
