%% =========== BLIJF VAN HET ONDERSTAANDE CODE COMMENTAAR AF! =============
%                    |dcea065b586aa53e7d36c4e25a03b885|
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
 
%% Opdracht 3
% Maak een functie om de HELE spierdikte te berekenen (Jan Swammerdam).
%
% De naam van deze functie is 'opdracht_3'.
% De input van de functie moet 'oppervlakte' heten.
% De output van de functie moet 'heleSpierdikte' heten.
% Gebruik verder: 
%                   - 'halvespierlengte = 10;'.
%                   - 'halvespierdikte = oppervlakte gedeeld door 
%                                        (pi * halvespierlengte)
% De constante 'pi' zit standaard in Matlab, typ: 'pi' in het Command
% Window.


function heleSpierdikte = opdracht_3(oppervlakte)
    halvespierlengte = 10;
    % Keer 2 voor de hele heleSpierdikte, vergeet je dat dan staat er een
    % programmeerfout in de code.
    heleSpierdikte = 2*(oppervlakte/(pi*halvespierlengte));
end
