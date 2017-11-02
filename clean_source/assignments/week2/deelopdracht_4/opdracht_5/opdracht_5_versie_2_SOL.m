%% Opdracht 5
% Maak een functie met de naam opdracht_5.
% De functie heeft twee inputs genaamd: AA en B.
% De functie heeft twee outputs genaamd: CC en D.
%
% M.b.v. de functie strlength() kun je de lengte van een string opvragen.
% Als de lengte van de string in input AA groter is dan 8 moet de
% string aan CC worden meegegeven. In elk ander geval wordt "CC = '';" (een
% lege string).
% Als de lengte van de string in input B kleiner is dan 8 moet de
% string aan D worden meegegeven. In elk ander geval wordt "D = '';" (een
% lege string).
%
% Voorbeeld aanroep:
%                   [AA b] = opdracht_5_versie_1_SOL('abcdeabcdea','abc') 
% geeft als output:
%                   AA = 'abcdeabcdea'
%                   b = 'abc'
%

function [CC, D] = opdracht_5(AA,B)
   
if strlength(AA) > 8
    CC = AA;
else
    CC = '';
end

if strlength(B) < 8
    D = B;
else
    D = '';
end

end