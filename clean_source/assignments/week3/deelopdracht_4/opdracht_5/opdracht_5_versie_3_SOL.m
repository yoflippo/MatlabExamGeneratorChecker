% Gegeven onderstaande code waarmee je de kniehoek in graden, gemeten
% aan de achterzijde, tijdens een kniebeweging genereert. 
% 
% Bepaal met  behulp van een lus (while/for) de gelijktijdig optredende 
% kniehoek aan de voorzijde. Plot de kniehoek aan de achterzijde tegen de 
% kniehoek aan de voorzijde.

close all
kniehoekAchter = [30 35 39 43 49 59 62 80 110];

% De oplossing:
phiVoor = zeros(size(kniehoekAchter));
for i = 1:size(kniehoekAchter,2)
    phiVoor(i) = 360-kniehoekAchter(i);
end    
figure
plot(kniehoekAchter,phiVoor)
