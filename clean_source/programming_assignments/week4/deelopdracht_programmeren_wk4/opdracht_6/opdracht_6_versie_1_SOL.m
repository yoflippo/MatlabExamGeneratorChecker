%% Opdracht 6
%
% Maak een functie met de naam opdracht_6.
% De functie heeft 1 input genaamd: inputvar.
% De functie heeft 1 output genaamd: outputvar.
%
% De functie geeft bij verschillende numerieke waardes van 'inputvar'
% (de waardes 1 tot en met 5) verschillende tekstuele outputs.
% 
% Je mag geen gebruik maken van een if-else-statement.
% Als de gebruiker van deze functie een getal kleiner dan 1 of groter dan 5
% invult moet de output de numerieke waarde '-1' terug geven.
%
% Voorbeeld:
%   opdracht_6(1) -> 'een'
%   opdracht_6(2) -> 'twee'
%   opdracht_6(4) -> 'vier'
%   etc.
%

function outputvar = opdracht_6(inputvar)

switch inputvar
    case 1
        outputvar = 'een';
    case 2
        outputvar = 'twee';
    case 4 %Merk op dat volgorde er bij een switch-statement niet toe doet.
        outputvar = 'vier';
    case 3
        outputvar = 'drie';
    case 5
        outputvar = 'vijf';
    otherwise
        outputvar = -1;
end

end