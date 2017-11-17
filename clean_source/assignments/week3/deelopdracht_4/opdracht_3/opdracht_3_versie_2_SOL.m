% Hieronder staat een regel waarmee je een
% grafiek van een inverse logaritmische functie tekent.
% Maak een nieuw figuur met de function
% figure. Maak alle waarden in signaal die kleiner
% zijn dan 10 gelijk aan nul. Plot de aangepaste
% grafiek met de bijbehorende tijdstippen
% in het nieuwe figure. 

clearvars
close all
t = 0:0.01:pi;
signaal = 1./exp(t);
plot(t,signaal)

% oplossing:
signaal(signaal > 0.5) = 0;
figure
plot(t,signaal)
