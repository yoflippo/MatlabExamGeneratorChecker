% Gegeven de kolomvector v = [3;5;8;12]. Maak een function die de vector
% 'v' omzet naar de matrix m:
%
% m = [3  3  3
%      5  5  5
%      8  8  8
%      12 12 12
%      3  3  3
%      5  5  5
%      8  8  8
%      12 12 12]
%
% Noem deze function: 'opdracht_6'. De input variabele krijgt de naam 'v'
% de output variabele krijgt de naam 'm'.
% Test de door jou geschreven functie ook met andere vectoren.

function m = opdracht_6(v)
m = repmat(v,2,3);
end