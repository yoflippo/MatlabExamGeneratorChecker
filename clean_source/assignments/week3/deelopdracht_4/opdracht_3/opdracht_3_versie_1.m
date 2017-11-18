% Hieronder staat code waarmee je een grafiek van een logaritmische 
% functie tekent. Maak een nieuw figuur aan. Maak alle waarden in 'signaal'
% die kleiner zijn dan 10 gelijk aan nul. 
% Ken die aangepaste vector toe aan een variabele 'data'. 
% Plot 'data' met de bijbehorende tijdstippen in het nieuwe figure. 

close all
t = 0:0.01:pi;
signaal = exp(t);
plot(t,signaal)

% Jouw oplossing:
