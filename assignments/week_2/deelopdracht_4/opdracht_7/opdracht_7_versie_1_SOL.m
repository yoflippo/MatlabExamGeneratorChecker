%% ==================== BLIJF VAN DE VOLGENDE CODE AF! ====================
%                    |43c9bc1847593e154009b76d549c095f|
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
 
%% Opdracht 7
%
% Als de variabele 'input' gelijk is aan 1 moet je een numerieke vector
% genereren met de waardes van 66 tot en met 99.
% Als de variabele 'input' gelijk is aan 0 moet je een numerieke vector
% genereren met de waardes 55 tot en met 99.
% In elk ander geval moet je een numerieke vector genereren van 0 tot en met
% 10.
%
% Maak een functie aan met de naam: 'opdracht_7'
% 
% Je mag niet gebruik maken van een switch-statement.
%
% De functie heeft 1 output en 1 input, geef deze variabelen zelf een naam.

function output = opdracht_7(input)

if isequal(input,1)
    output = 66:99;
elseif isequal(input,0)
    output = 55:99;
else
    output = 0:10;
end
    

end
