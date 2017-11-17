% Gegeven de rijvector v:
% v = [3 5 8 12]
% Maak met behulp van v in 1 regel deze matrix m aan:
% m = [3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12];
% De code van regel 4-7 werkt ook, maar is verboden:

% oplossing:
v = [3 5 8 12];
m = repmat(v,4,2);