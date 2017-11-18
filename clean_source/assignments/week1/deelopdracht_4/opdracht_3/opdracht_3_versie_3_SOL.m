%% Opdracht 3
% Maak een functie om de HELE spierdikte te berekenen (Jan Zwammerdan).
%
% De naam van deze functie is 'opdracht_3'.
% De input van de functie moet 'oppervlakte' heten.
% De output van de functie moet 'spierdikte' heten.
% Gebruik verder: 
%                   - 'halvespierlengte = 10;'.
%                   - 'halvespierdikte = oppervlakte gedeeld door pi * 
%                                           halvespierlengte
% De constante 'pi' zit standaard in Matlab, typ: 'pi' in het Command
% Window.


function spierdikte = opdracht_3(oppervlakte)
    halvespierlengte = 10;
    % Keer 2 voor de hele spierdikte, vergeet je dat dan staat er een
    % programmeerfout in de code.
    spierdikte = 2*(oppervlakte/(pi*halvespierlengte));
end