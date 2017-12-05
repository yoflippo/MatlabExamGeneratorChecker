%% Opdracht 3
% Gebruik een while-lus om een gegeven getal (in de variabele 'getal') in
% elke herhaling te delen door 6 en er 3 bij op te tellen. Sla het
% resultaat van die bewerking op in diezelfde variabele (anders krijg je 
% een eeuwige lus en dat is fout). Herhaal m.b.v. een while-lus zolang het 
% getal groter is dan 6.

getal = 66;
while getal > 6
    getal = getal / 6;
    getal = getal + 3;
end