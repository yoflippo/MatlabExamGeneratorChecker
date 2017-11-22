%% Opdracht 3
% Maak een functie om de HELE spierdikte te berekenen (Jan Swammerdam).
%
% De naam van deze functie is 'opdracht_3'.
% De input van de functie moet 'oppervlakte' heten.
% De output van de functie moet 'heleSpierdikte' heten.
% Gebruik verder: 
%                   - 'halvespierlengte = 10;'.
%                   - 'halvespierdikte = oppervlakte gedeeld door 
%                                        (pi * halvespierlengte)
% De constante 'pi' zit standaard in Matlab, typ: 'pi' in het Command
% Window.


function heleSpierdikte = opdracht_3(oppervlakte)
    halvespierlengte = 10;
    % Keer 2 voor de hele heleSpierdikte, vergeet je dat dan staat er een
    % programmeerfout in de code.
    heleSpierdikte = 2*(oppervlakte/(pi*halvespierlengte));
end