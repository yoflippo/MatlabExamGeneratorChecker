%% =========== BLIJF VAN HET ONDERSTAANDE CODE COMMENTAAR AF! =============
%                    |304628af5628014bd4d3479fac8b54ba|
%                            1811261147
%
% LEES DE VOLGENDE REGELS:
%
% 1 -   De volgende AANGEMAAKTE onderdelen mag je NIET aanpassen:
%                           A: Bestandsnamen
%                           B: Commentaar bij de code
%                           C: Folders en folderstructuur
%       Doe je dat toch dan krijg je GEEN punten voor deze opdracht.
% 2 -   Als dit bestand niet uit te voeren valt, bijvoorbeeld doordat je
%       tijdens het uitvoeren een foutmelding krijgt, krijg je GEEN punten!
% 3 -   Elke variabele waar 'NaN' aan is toegekend moet JIJ bewerken.
% 4 -   Je maakt de opdracht in dit bestand. Vul het bestand alleen aan met
%       voor de opdracht nuttige code. Doe je dit niet, dan kan dat een
%       vermindering van het te verdienen aantal punten tot gevolg hebben.
% 5 -   Door JOU geschreven commentaarregels (met %% of %) worden niet
%       door ons gelezen of gebruikt. 
% 6 -   Matlab is case-sensitive (hoofdlettergevoelig). De 
%       variabelen: 'aa', 'aA', 'Aa' en 'AA' zijn allemaal verschillend. 
%       Let dus goed op!
% 7 -   Als je programma een eeuwige-lus bevat (lees: nooit stopt met
%       uitvoeren) krijg je GEEN punten.
% 
% Opdrachtbeschrijving:
% Deze opdracht bestaat uit het schrijven/aanvullen van een FUNCTIE. De
% specifieke opdracht staat hieronder.
%
% LET OP!!!!
% Dit bestand mag alleen de FUNCTIE bevatten en niets anders.
%
%% =========== BLIJF VAN HET BOVENSTAANDE CODE COMMENTAAR AF! =============
 
%% Opdracht 10
% Maak een functie aan met de naam: 'opdracht_10'. 
%
% Deze functie heeft 2 inputs:  een hoek in radialen (hoekRad) en een 
% hoek in Graden (hoekGraden).
% Deze functie heeft 4 outputs: de cosinus en de sinus berekent uit de 
% hoekRad en de cosinus en sinus berekend vanuit de hoekGraden.
%
% Maak gebruik van standaard Matlab functie (lees: ga niet zelf radialen
% naar graden omrekenen).
%
% De vier output variabelen geef je de volgende namen mee:
% cosinusRad, sinusRad, cosinusGraden, sinusGraden

function [cosinusRad, sinusRad, cosinusGraden, sinusGraden] = opdracht_10(hoekRad, hoekGraden)
cosinusRad = cos(hoekRad);
sinusRad = sin(hoekRad);
cosinusGraden= cosd(hoekGraden);
sinusGraden= sind(hoekGraden);
end
