%% Opdracht 7
% Maak een functie aan met de naam 'opdracht_7'.
% Deze functie heeft 1 input: een Matrix met de naam data
% Deze functie heeft 2 outputs: aantalRijen en aantalKolommen
% 
% Zorg dat de outputvariabele 'aantalRijen' het aantal rijen van een matrix
% teruggeeft. Bedenk zelf wat de outputvariabele 'aantalKolommen' moet
% teruggeven.

function [aantalRijen, aantalKolommen] = opdracht_7(data)

grootte = size(data);
aantalRijen = grootte(1);
aantalKolommen = grootte(2);

end
