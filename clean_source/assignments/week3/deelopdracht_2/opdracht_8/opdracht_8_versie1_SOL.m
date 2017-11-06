%% Opdracht 8
% Maak een functie met 2 inputs genaamd 'vector' en 'kleinerdan'.
% Zorg dat de functie alle getallen in 'vector' kleiner dan de waarde in de
% inputvariabele 'kleinerdan' gelijk aan -1 maakt. 
%
% Als je dat hebt gedaan, zorg dat de functie deze vector teruggeeft EN
% er een plot van maakt.
%
% Je mag de waarde van een inputvariabele NIET aanpassen. Maak altijd een
% kopie.
%
% Noem de functie: 'opdracht_8'.

function output = opdracht_8(vector,kleinerdan)

output = vector;
output = output(output<kleinerdan);
plot(output)

end