% Hieronder staat een regel waarmee je de kniehoek in
% graden, gemeten aan de achterzijde, tijdens een
% kniebeweging genereert. Bepaal met behulp van een loop
% de gelijktijdig optredende kniehoek aan de voorzijde.
% Plot de kniehoek aan de achterzijde tegen de
% kniehoek aan de voorzijde.
clearvars
close all

phiAchter = [30 35 39 43 49 59 62 80 110];
% oplossing:
phiVoor = zeros(size(phiAchter));
var360 = repmat(360,1,size(phiAchter,2));
for i = 1:size(phiAchter,2)
    phiVoor(i) = var360(i)-phiAchter(i);
end    
figure
plot(phiAchter,phiVoor)
