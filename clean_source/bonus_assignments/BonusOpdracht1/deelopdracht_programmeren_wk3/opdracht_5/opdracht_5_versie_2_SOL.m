%% Opdracht 5
% Je wilt weten wanneer een auto een snelheid heeft langzamer dan 50km/h. 
%
% Dit zijn de gemeten snelheden (1 rij- of kolomvector):
% 30    33    54    58     8    13    26     4    37    24
% 13    15    64    48    33
%
% Stop de snelheden in een variabele genaamd: 'snelheidAuto'.
%
% Gebruik hiertoe een functie die alle indices opvraagt van waardes 
% lager dan 50 km/h.
% Stop de gevonden indices in een variabele genaamd 'indSnelheden'.

snelheidAuto = [30    33    54    58     8    13    26     4    37    24  13    15    64    48    33];
indSnelheden = find(snelheidAuto<50);


