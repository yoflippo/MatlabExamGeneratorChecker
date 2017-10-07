%% Opdracht 2
% Gegeven is onderstaande code om de spierdikte te berekenen.
% De functie heeft twee 
% Deze functie moet jezelf aanroepen m.b.v. een extra script.
% Dat script moet jezelf maken en mag je  in dezelfde folder zetten als dit 
% bestand. Dat script wordt niet nagekeken of gebruikt door ons.

function spierdikte = opdracht_1(oppervlakte)
    % De constante 'pi' zit standaard in Matlab, typ: 'pi' in het Command
    % Window.
    halvespierlengte = 10;
    spierdikte = oppervlakte/(pi*halvespierlengte);
end