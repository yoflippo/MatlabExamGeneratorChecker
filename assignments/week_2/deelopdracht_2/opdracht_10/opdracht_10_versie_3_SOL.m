%% ==================== BLIJF VAN DE VOLGENDE CODE AF! ====================
%                    |c78b27e8790d92eab3108360558d09be|
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

% Je hebt 10 keer gemeten hoe hard en hoever een pitcher een honkbal heeft gegooit. 
% Van deze 10 worpen wil de gemiddelde balsnelheid weten en de mediaan van de afstand.
% Maak een functie aan met de naam: 'opdracht_10'.
%
% Deze functie heeft 2 inputs: balSnelheid en balAfstand, beide zijn hieronder
% meegegeven in een vector.
% Deze functie heeft 2 outputs: het gemiddelde van de balsnelheiden en de mediaan van
% de afstanden
%
% De twee output variabelen geef je de volgende namen mee:
% gemiddeldeBalSnelheid en mediaanAfstand.
%
% Maak deze functie aan.

function [gemiddeldeBalsnelheid, mediaanAfstand] = opdracht_10(balSnelheid, balAfstand)

gemiddeldeBalsnelheid = mean(balSnelheid);
mediaanAfstand = median(balAfstand);

end
