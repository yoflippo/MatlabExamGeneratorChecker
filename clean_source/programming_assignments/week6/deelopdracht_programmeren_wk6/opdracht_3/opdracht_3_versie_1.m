%% Opdracht 3
% Hieronder staat code waarmee je een grafiek van een logaritmische 
% functie tekent. Maak een nieuw figuur aan. Maak alle waarden in 'signaal'
% die kleiner zijn dan 1 gelijk aan nul. 
% Ken die aangepaste vector toe aan een variabele 'data'. 
% Plot 'data' met de bijbehorende tijdstippen in het nieuwe figure. 
%
% Je mag geen gebruik maken van een loop (for/while). Tip: gebruik
% relationele operatoren.

close all
t = 0:0.01:pi;
signaal = log(t);
plot(t,signaal)
