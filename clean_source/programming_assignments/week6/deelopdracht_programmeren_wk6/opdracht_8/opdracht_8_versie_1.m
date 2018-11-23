%% Opdracht 8
% Gegeven: een rijvector met tijdstippen waarop een rugbyspeler een bal
% vast heeft (1) en de bal door niemand wordt vastgehouden (0).
%
% De positie van de bal (de x-coordinaat) wordt gegeven in Pos. 
%
% Geef de indexen van de tijdstippen waarop een speler de bal vast heeft en 
% naar achter rent. Zo'n tijdstip wordt gedefinieerd als een tijdstip i 
% waarbij de positie op het volgende tijdstip i+1 kleiner is dan op
% tijdstip i. Op tijdstip i en op i+1 moet hij de bal vast hebben.
%
% Dus, geef een logical vector met de naam 'vastNaarAchter' die enen bevat 
% op de tijdstippen waarop de speler met de bal naar achter loopt EN nullen
% als hij naar voren loopt of niemand de bal vast heeft.

close all
balVast = logical([ 1  1  1  1  1  0  0  0  0  0  0  0  0  1  1  1]);
Pos = [30 31 33 35 38 36 34 32 30 28 26 24 22 22 23 24];
