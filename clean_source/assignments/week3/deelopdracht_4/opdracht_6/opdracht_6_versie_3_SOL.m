% Gegeven de kolomvector v = [3; 5; 8; 12]. Maak een function die met 
% maximaal 2 coderegels de vector v zou omzetten naar de matrix m:
% m = [3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12];
% Noem deze function: 'opdracht_6'.
% De input variabele krijgt de naam 'v'.
% De output variabele krijgt de naam 'm'.
% Test de door jou geschreven functie ook met andere vectoren.

% De oplossing:
function m = opdracht_6(v) 
r = v';
m = repmat(r,4,2);
end