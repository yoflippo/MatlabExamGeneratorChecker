%% ==================== BLIJF VAN DE VOLGENDE CODE AF! ====================
%                    |0593aeaa963e2ed73bac739f6c055758|
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
 
%% Opdracht 10
%  Je wilt de maximale waarde en de minimale waarde van de snelheid en de
%  positie van een schaatster weten.
% Maak een functie aan met de naam: 'opdracht_10'.

% Deze functie heeft twee inputs: snelheid en positie, beide zijn hieronder  
% meegegeven als een vector.
% Deze functie heeft 4 outputs: de maximale waarde van de snelheidsvector en de
% minimale waarde van de snelheidsvector. Daarnaast heeft die ook 
% de maximale waarde van de positievector en de minimale waarde van de snelheidsvector

% De 4 output variabelen geef je de volgende namen mee:
% maxSnelheid, minSnelheid, maxPositie en minPositie.

% Maak deze functie aan.

function [maxSnelheid, minSnelheid, maxPositie, minPositie] = opdracht_10(snelheid, positie)

maxSnelheid = max( snelheid);
minSnelheid = min(snelheid );

maxPositie = max(positie);
minPositie= min(positie);

end

