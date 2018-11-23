%% Opdracht 5
%
% Iemand ligt op zijn/haar rug met opgetrokken knie (zie onderstaande 
% schets). Hieronder staat een coderegel waarmee je verschillende 
% kniehoeken genereert van 30 graden tot 180 graden. 
% Bepaal met behulp van een loop (for/while) de 
% afstand tussen heup en enkel voor elk van deze kniehoeken.
% Deze heup-enkel afstand zet je in een variabele genaamd: L3.
%
% Gebruik hiervoor de cosinusregel:
%           c^2 = a^2 + b^2 - 2*a*b*cos(phi).
%                     _
%                   _/ \
%                 _/ phi\
%               _/       \
%        b=L2 _/          \ a=L1
%           _/             \
%        _/                 \
%       /                    \
%       --------------------- 
%                   c=L3
%
% Plot afstand L3 (op de y-as) tegen de bijbehorende kniehoek (phi, op de
% x-as).

close all
phi = 30*pi/180:1*pi/180:pi;
% lengte onderbeen:
L1 = 0.4;
% lengte bovenbeen:
L2 = 0.5;

% De oplossing:
L3 = zeros(size(phi));
for i = 1:size(phi,2)
    L3(i) = sqrt(L1^2+L2^2-2*L1*L2*cos(phi(i)));
end    
figure
plot(phi,L3)
