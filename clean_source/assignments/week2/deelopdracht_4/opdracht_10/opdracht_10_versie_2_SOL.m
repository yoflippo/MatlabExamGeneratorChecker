%% Opdracht 10
%  Je wilt de maximale waarde en de minimale waarde van de snelheid en de
%  positie van een schaatster weten.
% Maak een functie aan met de naam: 'opdracht_10'.

% Deze functie heeft twee inputs: snelheid en positie, beide zijn hieronder  
% meegegeven als een vector.
% Deze functie heeft 4 outputs: de maximale waarde van de snelheidsvector en de
% minimale waarde van de snelheidsvector. Daarnaast heeft die ook 
% de maximale waarde van de positievector en de minimale waarde van de snelheidsvector

% De 4 output variabelen geef je de volgende namen mee:
% maxSnelheid, minSnelheid, maxPositie en minPositie.

% Maak deze functie aan.

function [maxSnelheid, minSnelheid, maxPositie, minPositie] = opdracht_10(snelheid, positie)

maxSnelheid = max( snelheid);
minSnelheid = min(snelheid );

maxPositie = max(positie);
minPositie= min(positie);

end

