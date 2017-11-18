% Gegeven: een rijvector met tijdstippen waarop een
% rugbyspeler een bal vast heeft (1) en de bal door 
% niemand wordt vastgehouden (0).
% De positie van de bal in voorwaartse richting
% (zeg maar de x-coordinaat) wordt gegeven in Pos.
% Geef de indexen van de tijdstippen waarop een
% speler de bal niet vast heeft en de bal naar voren
% beweegt. Zo'n tijdstip wordt gedefinieerd als een
% tijdstip i waarbij de positie op het volgende tijdstip i+1
% groter is dan op tijdstip i. Op tijdstip i en op
% i+1 moet hij de bal vast hebben. Dus, geef een logical
% vector met de naam vastNaarVoren die enen bevat op de
% tijdstippen waarop de speler met de bal naar voren
% loopt en nullen als hij naar achter loopt of niemand
% de bal vast heeft.

clearvars
close all
balVast = logical([1 1 1 1 1 0 0 0 0 0 0 0 0 1 1 1]);
Pos = [30 31 33 35 38 36 34 32 30 28 26 24 22 22 23 24];

% oplossing:
d = diff(Pos);
naarVoren = d > 0;
balVast2 = balVast(1:end-1);
vastNaarVoren = (balVast2 == 1 & naarVoren ==1) 
