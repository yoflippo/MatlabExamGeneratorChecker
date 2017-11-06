%% Opdracht 6
% Gebruik een for-lus om de onderstaande vectoren element-voor-element bij
% elkaar op te tellen. Stop de opgetelde element in variabele genaamd
% 'resultaat'.

t = 0:0.01:10;
vector1 = sin(t);
vector2 = cos(t);
vector3 = t.^3;

for n = 1:length(t)
    resultaat(n) = vector1(n)+vector2(n)+vector3(n);
end