%% Opdracht 6
% Gebruik een for-lus om de onderstaande vectoren element-voor-element bij
% elkaar op te tellen plus de index van de vectoren.
% 
% Bijvoorbeeld
% element 1 van: vector 1 + vector 2 + vector 3 + 1
% element 8 van: vector 1 + vector 2 + vector 3 + 8
% etc.
%
% Stop de opgetelde elementen in een vector genaamd 'resultaat'. 
% Plot als laatste de vector resultaat (op de x-as komt de variabele 't').

t = 0:0.01:10;
vector1 = sin(t);
vector2 = cos(t);
vector3 = t.^3;
