%% Opdracht 3
% Hieronder staat een regel waarmee je een grafiek van een kwadratische
% cosinus functie tekent. Maak een nieuw figuur aan. 
% Maak alle waarden in 'signaal' die groter zijn dan 0.5 gelijk aan nul.
% Ken die aangepaste vector toe aan een variabele 'data'.
% Plot 'data' met de bijbehorende tijdstippen in het nieuwe figure. 
%
% Je mag geen gebruik maken van een loop (for/while). Tip: gebruik
% relationele operatoren.

close all
t = 0:0.01:pi;
signaal = cos(t).^2;
plot(t,signaal)