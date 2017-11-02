%% Opdracht 9
% Maak een functie aan met de naam: 'opdracht_9'. 

% Deze functie heeft 1 input: een 3x3 matrix met de naam Matrix
% Deze functie heeft 3 outputs: de eerste rijvector, 
% de tweede kolomvector en het laatste element van de Matrix.  

% de drie output variabelen geef je de volgende namen mee:
% eersteRijVector,tweedeKolomVector,laatsteElement

% Maak deze functie aan.

function [eersteRijVector, tweedeKolomVector, laatsteElement] = opdracht_9(Matrix)

eersteRijVector = Matrix(1,:);
tweedeKolomVector = Matrix(:,2);
laatsteElement = Matrix(end,end);

end
