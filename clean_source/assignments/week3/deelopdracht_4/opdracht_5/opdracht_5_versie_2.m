% Hieronder is code gegeven waarmee je de afstanden tussen enkel en heup 
% genereert tijdens een kniestrekking. 
% Bepaal met behulp van een while/for-lus de kniehoek tijdens deze 
% beweging. 
% De kniehoek zet je in een variabele met de naam kniehoek.
%
% Gebruik de cosinusregel hiervoor:
%           c^2 = a^2 + b^2 - 2*a*b*cos(phi).
%                     _
%                   _/ \
%                 _/ phi\
%               _/       \
%           b _/          \ a
%           _/             \
%        _/                 \
%       /                    \
%       --------------------- 
%                   c
%
% Bedenk zelf wat de relatie is tussen a/b/c/phi in de formule en 
% L1/L2/L3/kniehoek.
%
% Plot de kniehoek tegen de bijbehorende enkel-heup afstand (x-as).

close all
% lengte onderbeen (knie-enkel):
L1 = 0.4;
% lengte bovenbeen (heup-knie):
L2 = 0.5;
% afstand tussen enkel en heup tijdens kniestrekking
L3 = 0.3:0.01:0.8;


