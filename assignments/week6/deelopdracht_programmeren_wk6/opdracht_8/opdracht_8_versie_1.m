%% =========== BLIJF VAN HET ONDERSTAANDE CODE COMMENTAAR AF! =============
%                    |729f9380fd7217c59fc7a8b4fc4c15b5|
%                            1811231301
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
% Deze opdracht bestaat uit het schrijven/aanvullen van een SCRIPT. De
% specifieke opdracht staat hieronder.
%
% LET OP!
% Exacte naamgeving is heel belangrijk! Merk bv. het verschil op tussen
% de twee variabelen: 'mekker' en de variabele 'Mekker'. Matlab maakt dus 
% onderscheid tussen kleine letters en hoofdletters.
%
%% =========== BLIJF VAN HET BOVENSTAANDE CODE COMMENTAAR AF! =============
 
%% Opdracht 8
% Gegeven: een rijvector met tijdstippen waarop een rugbyspeler een bal
% vast heeft (1) en de bal door niemand wordt vastgehouden (0).
%
% De positie van de bal (de x-coordinaat) wordt gegeven in Pos. 
%
% Geef de indexen van de tijdstippen waarop een speler de bal vast heeft en 
% naar achter rent. Zo'n tijdstip wordt gedefinieerd als een tijdstip i 
% waarbij de positie op het volgende tijdstip i+1 kleiner is dan op
% tijdstip i. Op tijdstip i en op i+1 moet hij de bal vast hebben.
%
% Dus, geef een logical vector met de naam 'vastNaarAchter' die enen bevat 
% op de tijdstippen waarop de speler met de bal naar achter loopt EN nullen
% als hij naar voren loopt of niemand de bal vast heeft.

close all
balVast = logical([ 1  1  1  1  1  0  0  0  0  0  0  0  0  1  1  1]);
Pos = [30 31 33 35 38 36 34 32 30 28 26 24 22 22 23 24];
