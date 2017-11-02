%% Opdracht 10
% Maak een functie aan met de naam: 'opdracht_10'. 

% Deze functie heeft 2 inputs:  een hoek in radialen (hoekRad) en een 
% hoek in Gradenen (hoekGraden). Beide hoeken zijn hieronder meegegeven.
% Deze functie heeft 4 outputs: de cosinus en de sinus berekend uit de hoekRad 
% en de cosinus en sinus berekend vanuit de hoekGraden.

% De vier output variabelen geef je de volgende namen mee:
% cosinusRad, sinusRad, cosinusGraden, sinusGraden

function [cosinusRad, sinusRad, cosinusGraden, sinusGraden] = opdracht_10(hoekRad, hoekGraden)

cosinusRad = cos(hoekRad);
sinusRad = sin(hoekRad);

cosinusGraden= cosd(hoekGraden);
sinusGraden= sind(hoekGraden);

end
