% Gegeven de rijvector v:
% v = [3; 5; 8; 12]
% Maak van v een rijvector r en gebruik r om deze
% matrix m aan te maken:
% m = [3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12;
%      3 5 8 12 3 5 8 12];
% De code van regel 5-8 werkt ook, maar is verboden:

v = [3; 5; 8; 12];
% oplossing:

r = v';
m = repmat(r,4,2)