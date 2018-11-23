%% =========== BLIJF VAN HET ONDERSTAANDE CODE COMMENTAAR AF! =============
%                    |7ae8a9d56d1a62e13c0c87952c78d681|
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
 
%% Opdracht 6
% Gebruik een for-lus om de onderstaande vectoren element-voor-element bij
% elkaar op te tellen plus de index van de vectoren.
% 
% Bijvoorbeeld
% element 1 van: vector 1 + vector 2 + vector 3 + 1
% element 1 van: vector 1 + vector 2 + vector 3 + 8
% etc.
%
% Stop de opgetelde elementen in een vector genaamd 'resultaat'. 
% Plot als laatste de vector resultaat (op de x-as komt de variabele 't').

t = 0:0.01:10;
vector1 = sin(t);
vector2 = cos(t);
vector3 = t.^3;

for n = 1:length(t)
    resultaat(n) = vector1(n)+vector2(n)+vector3(n)+n;
end
plot(t,resultaat)
