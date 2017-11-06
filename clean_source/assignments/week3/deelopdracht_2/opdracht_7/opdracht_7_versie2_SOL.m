%% Opdracht 7
% Maak een functie met twee inputs: 'start' en 'eind'. De variabele 'start'
% bevat een start getal (bijvoorbeeld 1) en de variabele 'eind' bevat een
% eind getal (groter dan 'start').
%
% Zorg dat de functie alle elementen van start tot en met eind minus 1 bij
% elkaar optelt. 
% 
% Bijvoorbeeld: start = 2 en eind = 5 dan wordt 1+2+3+4 bij
% elkaar opgeteld. Als start = 0 end eind = 3 dan wordt -1+0+1+2 opgeteld.
%
% Noem de functie: 'opdracht_7'.
function output = opdracht_7(start,eind)

output = 0;
for i = start-1:eind-1
    output = i + output;
end

end