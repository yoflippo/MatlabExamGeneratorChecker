%% =========== BLIJF VAN HET ONDERSTAANDE CODE COMMENTAAR AF! =============
%                    |f1732ae4e0aa6f629aade03b3e62f226|
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
 
%% Opdracht 4
% Zie onderstaande code. Plot de twee signalen in hun eigen figure.

signaal1 = randn(1,100);
signaal2 = randn(1,100);

figure(1)
plot(signaal1)
figure(2)
plot(signaal2)
