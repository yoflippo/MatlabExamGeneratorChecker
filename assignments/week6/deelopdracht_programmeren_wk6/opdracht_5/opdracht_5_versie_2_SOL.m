%% =========== BLIJF VAN HET ONDERSTAANDE CODE COMMENTAAR AF! =============
%                    |c5c2386da754a87200276bbbb4e45aac|
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
% Hieronder is code gegeven waarmee je de afstanden tussen enkel en heup 
% genereert tijdens een kniestrekking. 
% Bepaal met behulp van een while/for-lus de kniehoek tijdens deze 
% beweging. 
% De kniehoek zet je in een variabele met de naam kniehoek.
%
% Gebruik de cosinusregel hiervoor:
%           c^2 = a^2 + b^2 - 2*a*b*cos(phi).
%                     _
%                   _/ \
%                 _/ phi\
%               _/       \
%           b _/          \ a
%           _/             \
%        _/                 \
%       /                    \
%       --------------------- 
%                   c
%
% Bedenk zelf wat de relatie is tussen a/b/c/phi in de formule en 
% L1/L2/L3/kniehoek.
%
% Plot de kniehoek tegen de bijbehorende enkel-heup afstand (x-as).

close all
% lengte onderbeen (knie-enkel):
L1 = 0.4;
% lengte bovenbeen (heup-knie):
L2 = 0.5;
% afstand tussen enkel en heup tijdens kniestrekking
L3 = 0.3:0.01:0.8;

kniehoek = zeros(size(L3));
for i = 1:size(L3,2)
    cosw = (L1^2+L2^2-L3(i))/(2*L1*L2);
    kniehoek(i) = acos(cosw);
end    
plot(L3,kniehoek)
