%% =========== BLIJF VAN HET ONDERSTAANDE CODE COMMENTAAR AF! =============
%                    |88982202e49819c94ebc5e972307bdee|
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
 
%% Opdracht 5
%
% Iemand ligt op zijn/haar rug met opgetrokken knie (zie onderstaande 
% schets). Hieronder staat een coderegel waarmee je verschillende 
% kniehoeken genereert van 30 graden tot 180 graden. 
% Bepaal met behulp van een loop (for/while) de 
% afstand tussen heup en enkel voor elk van deze kniehoeken.
% Deze heup-enkel afstand zet je in een variabele genaamd: L3.
%
% Gebruik hiervoor de cosinusregel:
%           c^2 = a^2 + b^2 - 2*a*b*cos(phi).
%                     _
%                   _/ \
%                 _/ phi\
%               _/       \
%        b=L2 _/          \ a=L1
%           _/             \
%        _/                 \
%       /                    \
%       --------------------- 
%                   c=L3
%
% Plot afstand L3 (op de y-as) tegen de bijbehorende kniehoek (phi, op de
% x-as).

close all
phi = 30*pi/180:1*pi/180:pi;
% lengte onderbeen:
L1 = 0.4;
% lengte bovenbeen:
L2 = 0.5;

% De oplossing:
L3 = zeros(size(phi));
for i = 1:size(phi,2)
    L3(i) = sqrt(L1^2+L2^2-2*L1*L2*cos(phi(i)));
end    
figure
plot(phi,L3)
