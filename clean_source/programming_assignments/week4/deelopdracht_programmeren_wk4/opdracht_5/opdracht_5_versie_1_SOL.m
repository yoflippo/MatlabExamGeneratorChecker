%% Opdracht 5
% Maak een functie met de naam opdracht_5.
% De functie heeft twee inputs genaamd:  A en B.
% De functie heeft twee outputs genaamd: C en D.
%
% M.b.v. de functie strlength() kun je de lengte van een string opvragen.
% Als de lengte van de string in input A groter is dan 10 moet de
% string aan C worden meegegeven. In elk ander geval wordt "C = '';" (een
% lege string, zonder spaties).
% Als de lengte van de string in input B kleiner is dan 10 moet de
% string aan D worden meegegeven. In elk ander geval wordt "D = '';" (een
% lege string, zonder spaties).
%
% Voorbeeld aanroep:
%                   [a b] = opdracht_5('abcdeabcdea','abc') 
% geeft als output:
%                   a = 'abcdeabcdea'
%                   b = 'abc'

function [C, D] = opdracht_5(A,B)
   
if strlength(A) > 10
    C = A;
else
    C = '';
end

if strlength(B) < 10
    D = B;
else
    D = '';
end

end