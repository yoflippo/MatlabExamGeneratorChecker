%% Opdracht 7
% Gegeven de rijvector r = [3 5 8 12 16 18].
% Maak een logical rijvector met de naam pv en inhoud [1 1 0 1 0 1].
% Gebruik pv om het eerste, tweede, vierde en zesde element van r in een 
% nieuwe vecor qq te stoppen.

r = [3 5 8 12 16 18];

% De oplossing:
pv = logical([1 1 0 1 0 1]);
qq = r(pv);