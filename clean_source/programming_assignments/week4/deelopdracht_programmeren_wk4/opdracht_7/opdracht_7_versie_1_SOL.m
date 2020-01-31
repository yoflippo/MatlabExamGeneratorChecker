%% Opdracht 7
%
% Als de variabele 'input' gelijk is aan 1 moet je een numerieke vector
% genereren met de waardes van 66 tot en met 99.
% Als de variabele 'input' gelijk is aan 0 moet je een numerieke vector
% genereren met de waardes 55 tot en met 99.
% In elk ander geval moet je een numerieke vector genereren van 0 tot en met
% 10.
% Deze resultaten stop je in de outputvariabele van deze functie.
%
% Maak een functie aan met de naam: 'opdracht_7'
% 
% Je mag niet gebruik maken van een switch-statement.
%
% De functie heeft 1 output en 1 input, geef deze variabelen zelf een naam.

function output = opdracht_7(input)

if isequal(input,1)
    output = 66:99;
elseif isequal(input,0)
    output = 55:99;
else
    output = 0:10;
end
    

end