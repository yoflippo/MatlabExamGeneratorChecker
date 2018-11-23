%% =========== BLIJF VAN HET ONDERSTAANDE CODE COMMENTAAR AF! =============
%                    |5f890c3818c5b69c79601fecd83bb68a|
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
 
%% Opdracht 1
% In de folder Databestanden staat een bestand met de naam herrefaber.txt.
% Hieronder staat een regel waarmee je de gegevens uit dat bestand in de
% variabele 'data' zet. Deze bestaat uit 2 rijen en 5 kolommen.
% De tweede rij bestaat uit hoeken. 
% 
% Zet in de variabele 'hoeken' deze rij. Zet in de variabele 'sinusHoeken'
% de sinus van de variabele 'hoeken'.
%
% Plot in de sinus van deze hoeken in een grafiek.
% x-as: hoeken
% y-as: sinus van de hoeken.

addpath(genpath(fullfile('..','Databestanden')))
data = load('herrefaber.txt');

hoeken = NaN;
sinusHoeken = NaN;
