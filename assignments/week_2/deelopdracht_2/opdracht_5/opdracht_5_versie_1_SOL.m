%% ==================== BLIJF VAN DE VOLGENDE CODE AF! ====================
%                    |cc66d95da4a8f267767adabfb70702ef|
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
 
%% Opdracht 5
% Je wilt weten wanneer een bergbeklimmer hoger is dan 311 meter. 
% Je hebt om de 10 minuten gemeten hoe hoog hij zit.
%
% Gebruik een functie die alle indices vind van de getallen groter dan 311. 
% De data moet in de een variabele genaamd 'hoogteBergbeklimmer' staan.
%
% Dit zijn de waardes van de variabele 'hoogteBergbeklimmer' : 
% 301   303   305   313   323   306   311   320   320 319   320   320
% 310   317   314   309   319   316   320   314
%
% De gevonden indices stop je in een variabele genaamd 'tijdstippen'.

hoogteBergbeklimmer = [301   303   305   313   323   306   311   320   320 319   320   320   310   317   314   309   319   316   320   314];
tijdstippen = find(hoogteBergbeklimmer > 311);


