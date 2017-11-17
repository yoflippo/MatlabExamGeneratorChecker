% Gegeven de kolomvector v:
% v = [3;
%      5;
%      8;
%      12]
% Maak met behulp van v in 1 regel deze matrix m aan:
% m = [3  3  3;
%      5  5  5;
%      8  8  8;
%      12 12 12;
%      3  3  3;
%      5  5  5;
%      8  8  8;
%      12 12 12;
% De code van regel 7-14 werkt ook, maar is verboden:

% oplossing:
v = [3;
     5;
     8;
     12];

m = repmat(v,2,3);