% Gegeven de kolomvector v:
% v = [3; 5; 8; 12; 16; 18]
% Maak een logical rijvector met de naam
% lv en inhoud [1; 0; 0; 1; 0; 1].
% Gebruik lv om het eerste, vierde en zesde
% element van v in een nieuwe vecor r te stoppen.

v = [3; 5; 8; 12; 16; 18];

% oplossing:
lv = logical([1; 0; 0; 1; 0; 1]);
r = v(lv)