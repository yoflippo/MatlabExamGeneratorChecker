% Gegeven de rijvector v:
% v = [3; 5; 8; 12]
% Maak een function die met maximaal 2 coderegels
% de vector v zou omzetten naar de matrix m:
% m = [3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12];
% Noem deze function: 'opdracht6'
% De code van regel 5-8 werkt ook, maar is verboden:
% input variabele krijgt de naam v
% output variabele krijgt de naam m

v = [3; 5; 8; 12];
% oplossing:
function m = opdracht6(v) 
r = v';
m = repmat(r,4,2);
end