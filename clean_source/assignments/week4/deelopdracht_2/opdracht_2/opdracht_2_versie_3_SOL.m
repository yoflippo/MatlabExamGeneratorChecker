% Opdracht 2

% In de onderstaande code staan fouten. Los de foutmelding op.
% Let op! Bij het oplossen mag je geen variabele verwijderen. 
% de tangentieleVersnelling moet 4 worden.

t= 1:0.01:10;
hoekKogelSlingeraar= sin(t);

if length(hoekKogelSlingeraar)== length(t)
    tangentieleVersnelling=4;   
elseif hoekKogelSlingeraar(1) == 6.44
    tangentieleVersnelling=5; 
end
