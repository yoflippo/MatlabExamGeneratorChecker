% Gegeven de kolomvector k = [3; 5; 8; 12; 16; 18].
% Maak een logical kolomvector met de naam rp en inhoud [0; 1; 0; 1; 0; 1].
% Gebruik rp om het tweede, vierde en zesde element van k in een nieuwe 
% vector q te stoppen.

k = [3; 5; 8; 12; 16; 18];

% oplossing:
rp = logical([0; 1; 0; 1; 0; 1]);
q = k(rp);