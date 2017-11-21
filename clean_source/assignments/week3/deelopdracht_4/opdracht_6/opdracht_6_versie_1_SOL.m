% Gegeven de rijvector v = [3 5 8 12]. Maak een function die de vector 'v'
% omzet naar de matrix m:
%
% m = [3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12];
%
% Noem deze function: 'opdracht6'. De input variabele krijgt de naam 'v'
% de output variabele krijgt de naam 'm'.
% Test de door jou geschreven functie ook met andere vectoren.

function m = opdracht6(v)
m = repmat(v,4,2);
end