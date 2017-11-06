%% Opdracht 2
% Gegeven is onderstaande code.
% Tel m.b.v. een while-lus de waardes van de vectoren x, y en z bij elkaar
% op. Het resultaat van de optelling sla je op in een vector genaamd
% 'resultaat'.
%
% Merk op dat dit in principe gemakkelijk kan met vector optelling, 
% het is echter de bedoeling dat je dit in deze opdracht doet m.b.v. een
% while-lus.
%
% TIP: Maak gebruik van de variabele 'teller'. Deze variabele laat je elke
% herhaling ophogen (teller + 1). 

n = 100;
t = 0:0.1:n;
x = sin(t);
y = cos(t);
z = tan(t);
teller = 1

% Hier komt de while-lus
while teller <= 100
    resultaat(teller) = x(teller)+y(teller)+z(teller)
    teller = teller + 1;
end