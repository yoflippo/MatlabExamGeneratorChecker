% Hieronder staat een regel waarmee je kniehoeken genereert van 30 graden
% tot 180 graden. Bepaal met behulp van een loop de afstand tussen heup en
% enkel voor elk van deze kniehoeken. Gebruik de cosinusregel hiervoor.
% Plot deze afstand tegen de bijbehorende kniehoek.

close all
phi = 30*pi/180:1*pi/180:pi;
% lengte onderbeen:
L1 = 0.4;
% lengte bovenbeen:
L2 = 0.5;

% De oplossing:
L3 = zeros(size(phi));
for i = 1:size(phi,2)
    L3(i) = L1^2+L2^2-2*L1*L2*cos(phi(i));
end    
figure
plot(phi,L3)
