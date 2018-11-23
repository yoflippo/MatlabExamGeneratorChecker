%% =========== BLIJF VAN HET ONDERSTAANDE CODE COMMENTAAR AF! =============
%                    |3ca9d51002795f39dcaf4000a95edf7f|
%                            1811231654
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
 
%% Opdracht 4
% Maak een functie genaamd 'opdracht_4' die een gegeven tekst plakt aan een
% bestaande tekst.
% 
% Je hebt een input variabele genaamd: txt.
% De output variable heet "result".
% De functie plakt de tekst van de input (txt) aan de tekst:
% 'opdracht: ' en geeft dat terug aan "result".
%
% Als de input variabele de volgende string bevat: 'Pectoralis'. 
% Dan geeft de functie "opdracht: Pectoralis" terug.
%
% Een function file mag enkel en alleen een functie bevatten. 
function result = opdracht_4(txt)
result = ['opdracht: ' txt];
end
