%% ==================== BLIJF VAN DE VOLGENDE CODE AF! ====================
%                    |b1e120b178d172ed238f584ee10bea65|
%                            exam_171009_1056
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
% Maak een functie genaamd 'opdracht_3' om de gemiddelde beenlengte 
% te berekenen.
% 
% Je hebt ��n input variabele genaamd 'getallen'.
% De output variabele heet 'result'.
% Bereken het gemiddelde van de
% vector 'getallen' zonder gebruik te maken van de standaard
% Matlab functie mean().
%
% De functie in dit bestand moet je zelf aanroepen m.b.v. een extra script
% en dat script moet je zelf maken en mag je in dezelfde folder zetten
% als dit bestand. Dat script wordt niet nagekeken of gebruikt door ons.

function result = opdracht_3(getallen)
result = sum(getallen)/length(getallen);
end
