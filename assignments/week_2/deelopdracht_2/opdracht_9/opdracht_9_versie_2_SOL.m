%% ==================== BLIJF VAN DE VOLGENDE CODE AF! ====================
%                    |a063dec7cf187a3e7dc98eda03a84f00|
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
% Deze opdracht bestaat uit het schrijven/aanvullen van een FUNCTIE. De
% specifieke opdracht staat hieronder.
%
% LET OP!!!!
% Dit bestand mag alleen de FUNCTIE bevatten en niets anders.
%
% =================== BLIJF VAN VOORGAANDE CODE AF! ======================
 
%% Opdracht 9
% Maak een functie aan met de naam: 'opdracht_9'. 

% Deze functie heeft 1 input: een 3x3 matrix met de naam Matrix
% Deze functie heeft 3 outputs: de eerste kolomvector, 
% de tweede kolomvector en de derde kolomvector van de Matrix.  

% De drie output variabelen geef je de volgende namen mee:
% eersteKolomVector,tweedeKolomVector,derdeKolomVector

% Maak deze functie aan.

function [eersteKolomVector,tweedeKolomVector,derdeKolomVector]=opdracht_9(Matrix);

eersteKolomVector=Matrix(:,1);
tweedeKolomVector=Matrix(:,2);
derdeKolomVector= Matrix(:,3);

end
