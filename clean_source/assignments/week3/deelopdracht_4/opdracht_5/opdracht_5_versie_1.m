%% Opdracht 5
%
% Hieronder staat een regel waarmee je kniehoeken genereert van 30 graden
% tot 180 graden. Bepaal met behulp van een loop (for/while) de 
% afstand tussen heup en enkel voor elk van deze kniehoeken.
% Deze afstand zet je in een variabele genaamd 'L3'.
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
%
% Bedenk zelf wat de relatie is tussen a/b/c in de formule en L1/L2/L3.
%
% Plot vervolgens deze afstand tegen de bijbehorende kniehoek (x-as).

close all
phi = 30*pi/180:1*pi/180:pi;
% lengte onderbeen:
L1 = 0.4;
% lengte bovenbeen:
L2 = 0.5;

