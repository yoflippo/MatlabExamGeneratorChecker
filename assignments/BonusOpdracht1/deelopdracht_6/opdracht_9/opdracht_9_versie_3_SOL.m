%% =========== BLIJF VAN HET ONDERSTAANDE CODE COMMENTAAR AF! =============
%                    |315612fb37402dcfdc2d5f927f1f703e|
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
 
%% Opdracht 9
% Maak een functie aan met de naam: 'opdracht_9'. 

% Deze functie heeft 1 input: een 3x3 matrix met de naam Matrix
% Deze functie heeft 3 outputs: de eerste rijvector, 
% de tweede kolomvector en het laatste element van de Matrix.  

% De drie output variabelen geef je de volgende namen mee:
% eersteRijVector,tweedeKolomVector,laatsteElement

% Maak deze functie aan.

function [eersteRijVector, tweedeKolomVector, laatsteElement] = opdracht_9(Matrix)

eersteRijVector = Matrix(1,:);
tweedeKolomVector = Matrix(:,2);
laatsteElement = Matrix(end,end);

end
