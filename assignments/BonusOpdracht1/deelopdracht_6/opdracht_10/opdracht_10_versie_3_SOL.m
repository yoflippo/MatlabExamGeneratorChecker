%% =========== BLIJF VAN HET ONDERSTAANDE CODE COMMENTAAR AF! =============
%                    |f7e4a21187ab6044f5e9660ef2d55e31|
%                            1811281704
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
% 
% Je hebt 10 keer gemeten hoe hard en hoever een pitcher een honkbal heeft gegooit. 
% Van deze 10 worpen wil de gemiddelde balsnelheid weten en de mediaan van de afstand.
% Maak een functie aan met de naam: 'opdracht_10'.
%
% Deze functie heeft 2 inputs: balSnelheid en balAfstand.
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