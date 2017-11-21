% Hieronder staat code waarmee je de afstanden tussen enkel en heup 
% genereert tijdens een kniestrekking. Bepaal met behulp van een while/for-
% lus de kniehoek tijdens deze beweging. Gebruik de cosinusregel hiervoor. 
% Plot deze kniehoek tegen de bijbehorende enkel-heup afstand.

close all
% lengte onderbeen:
L1 = 0.4;
% lengte bovenbeen:
L2 = 0.5;
L3 = 0.3:0.01:0.8;

% De oplossing:
phi = zeros(size(L3));
for i = 1:size(L3,2)
    cosw = (L1^2+L2^2-L3(i))/(2*L1*L2);
    phi(i) = acos(cosw);
end    
figure
plot(L3,phi)
