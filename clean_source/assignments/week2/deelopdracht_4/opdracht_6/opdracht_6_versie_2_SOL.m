%% Opdracht 6
%
% Maak een functie met de naam opdracht_6.
% De functie heeft 1 input genaamd: inputvar.
% De functie heeft 1 output genaamd: outputvar.
%
% De functie geeft bij verschillende numerieke waardes van 'inputvar'
% (de waardes 6 tot en met 10) verschillende tekstuele outputs.
%
% Je mag geen gebruik maken van een if-else-statement.
% Als de gebruiker van deze functie een getal kleiner dan 6 of groter dan
% 10 invult moet de output de numerieke waarde '-1' terug geven.
%
% Voorbeeld:
%   opdracht_6(6) -> 'zes'
%   opdracht_6(7) -> 'zeven'
%   opdracht_6(10) -> 'tien'
%   etc.
%

function outputvar = opdracht_6(inputvar)

switch inputvar
    case 6
        outputvar = 'zes';
    case 8 %Merk op dat volgorde er bij een switch-statement niet toe doet.
        outputvar = 'acht';
    case 7
        outputvar = 'zeven';
    case 9
        outputvar = 'negen';
    case 10
        outputvar = 'tien';
    otherwise
        outputvar = -1;
end

end