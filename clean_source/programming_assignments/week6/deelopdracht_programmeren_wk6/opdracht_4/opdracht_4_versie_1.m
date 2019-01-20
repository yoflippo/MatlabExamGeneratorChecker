%% Opdracht 4
% Hieronder staat code waarmee je een grafiek van een cosinus functie
% tekent. Maak een nieuw figuur aan. De variabele signaal bevat een
% heleboel opvolgende cosinuswaardes. Trek steeds de opvolgende waardes
% van elkaar af (de tweede min de eerste) en stop het resultaat in een 
% vector genaamd 'diffSignaal'. Gebruik hiertoe een daarvoor bedoelde
% standaard functie van Matlab.
% Plot dit signaal in het nieuwe figure (geen tijdstippen op de x-as).
%
% Je mag geen gebruik maken van een loop (for/while).

close all
t = 0:0.01:pi;
signaal = cos(t);
plot(t,signaal)
