%% Opdracht 3
% Maak een functie om de spierdikte te berekenen.
%
% Deze functie moet jezelf aanroepen m.b.v. een extra script.
% De naam van deze functie is 'opdracht_3'.
% De input van de functie moet 'oppervlakte' heten.
% De output van de functie moet 'spierdikte' heten.
% Gebruik verder: 'halvespierlengte = 10;'.
% De constante 'pi' zit standaard in Matlab, typ: 'pi' in het Command
% Window.
%
% De functie in dit bestand moet je zelf aanroepen m.b.v. een extra script
% en dat script moet je zelf maken en mag je in dezelfde folder zetten
% als dit bestand. Dat script wordt niet nagekeken of gebruikt door ons.


function spierdikte = opdracht_3(oppervlakte)
    halvespierlengte = 10;
    spierdikte = oppervlakte/(pi*halvespierlengte);
end