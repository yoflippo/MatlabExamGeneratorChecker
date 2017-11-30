%% ==================== BLIJF VAN DE VOLGENDE CODE AF! ====================
%                    |63300dff22426822711e5993d41c325e|
%                            1711221742
%
% LEES DE VOLGENDE REGELS:
%
% 1 -   De volgende DOOR ONS AANGEMAAKTE zaken mag je NIET aanpassen:
%                           A: Bestandsnamen
%                           B: Door ons aangemaakt commentaar
%                           C: Folders en folderstructuur
%                           D: De code in deze codesectie
%       Doe je dat toch dan krijg je GEEN punten voor deze weekopdracht.
% 2 -   Als dit bestand niet uit te voeren valt, bijvoorbeeld doordat je
%       tijdens het uitvoeren een foutmelding krijgt, krijg je GEEN punten!
% 3 -   Elke variabele waar 'NaN' aan wordt toegekend moet JIJ bewerken.
% 4 -   Je maakt de opdracht in dit bestand. Vul het bestand alleen met
%       voor de opdracht nuttige code. Doe je dit niet dan kan dat een
%       vermindering van het te verdienen aantal punten als gevolg hebben.
% 5 -   Door JOU geschreven commentaar regels (met %% of %) worden niet
%       door ons gelezen of gebruikt. 
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
% =================== BLIJF VAN VOORGAANDE CODE AF! ======================
 
%% Opdracht 2
% Maak de volgende variabelen aan:
%   A met de waarde 1;
%   B met de waarde 0;
%   C met de waarde 1;
%   Combineer bovengenoemde variabelen m.b.v. enkel de OR- en/of 
%   AND-operator zodat ze allemaal worden gebruikt en worden geevalueerd 
%   tot '0'. Het resultaat van deze handeling moet worden toegekend aan 
%   een variabele genaamd 'resultaat'.
A = 1;
B = 0;
C = 1;
resultaat = B && (A || C);
% Ook goed gerekend:
% resultaat = B & (A | C);
% resultaat = B & (A & C);
% etc. Er zijn heel veel manieren.
% Merk op dat de volgorde niet uitmaakt (BV. (A|C) & B is ook goed)
% Let op dat je enkel de OR- en/of AND-operator gebruikt. Geen relationele
% operatoren of andere logische-operatoren.
