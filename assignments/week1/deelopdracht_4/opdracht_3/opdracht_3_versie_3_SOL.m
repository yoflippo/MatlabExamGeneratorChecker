%% ==================== BLIJF VAN DE VOLGENDE CODE AF! ====================
%                    |2548ea51ec799cf86536c9a89f25b177|
%
% LEES EN BEGRIJP DE VOLGENDE REGELS:
%
% 1 - De volgende DOOR ONS AANGEMAAKTE zaken mag je NIET aanpassen!:
%                           A: Bestandsnamen
%                           B: Door ons aangemaakt commentaar
%                           C: Folders en folderstructuur
%                           D: De code in deze codesectie
%     Pas je toch iets aan dan krijg je GEEN punten voor deze weekopdracht.
% 2 - Als dit bestand niet uit te voeren valt, krijg je GEEN punten!
% 3 - Elke variabele waar 'NaN' aan wordt toegekend moet JIJ bewerken.
% 4 - JIJ mag geen aparte scripts/functies gebruiken tenzij dit expliciet
%     is aangegeven.
% 5 - Door JOU geschreven commentaar regels (met %% of %) worden niet
%     door ons gelezen of gebruikt. 
% 
% Opdrachtbeschrijving:
% Deze opdracht bestaat uit het schrijven/aanvullen van een FUNCTIE. De
% specifieke opdracht staat hieronder.
%
% LET OP!!!!
% -> Maak een apart script dat deze FUNCTIE test. Dit bestand mag alleen de
% FUNCTIE bevatten en niets anders. <-
%
% =================== BLIJF VAN VOORGAANDE CODE AF! ======================
 
%% Opdracht 3
% Maak een functie om de spierdikte te berekenen.
%
% Deze functie moet jezelf aanroepen m.b.v. een extra script.
% De naam van deze functie is 'opdracht_3'.
% De input van de functie moet 'oppervlakte' heten.
% De output van de functie moet 'spierdikte' heten.
% Gebruik verder: 'halvespierlengte = 10;'.
% De constante 'pi' zit standaard in Matlab, typ: 'pi' in het Command
% Window.
%
% De functie in dit bestand moet je zelf aanroepen m.b.v. een extra script
% en dat script moet je zelf maken en mag je in dezelfde folder zetten
% als dit bestand. Dat script wordt niet nagekeken of gebruikt door ons.


function spierdikte = opdracht_3(oppervlakte)
    halvespierlengte = 10;
    spierdikte = oppervlakte/(pi*halvespierlengte);
end