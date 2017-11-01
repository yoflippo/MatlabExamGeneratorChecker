%% Opdracht 8
% Maak een functie aan met de naam 'opdracht_8'.
%
% De input van deze functie bestaat uit twee vectoren. 
% De eerste vector geef je de naam 'bovenbeen' en de tweede vector 
% de naam 'onderbeen'.  
%
% De output is de opgetelde waarde van het laatste element van de vector
% bovenbeen en het derde element van de vector onderbeen.


function opgeteldeWaarde = opdracht_8(bovenbeen, onderbeen)

waardeBovenbeen=bovenbeen(end);
waardeOnderbeen=onderbeen(:,3);
opgeteldeWaarde= waardeBovenbeen+waardeOnderbeen;

end
