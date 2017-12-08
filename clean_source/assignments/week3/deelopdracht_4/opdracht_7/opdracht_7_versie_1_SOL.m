%% Opdracht 7
% Gegeven de kolomvector v = [3; 5; 8; 12; 16; 18].
%
% Maak een logical kolomvector met de naam
% lv en inhoud [1; 0; 0; 1; 0; 1].
% Gebruik lv om het eerste, vierde en zesde
% element van v in een nieuwe vector r te stoppen.
%

v = [3; 5; 8; 12; 16; 18];

lv = logical([1; 0; 0; 1; 0; 1]);
r = v(lv);