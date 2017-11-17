% Hieronder staat een regel waarmee je een
% grafiek van een arctangens tekent.
% Maak een nieuw figuur met de function
% figure. Selecteer alle waarden uit signaal
% die groter zijn dan 0.4 en kleiner 
% dan 0.8 en plot de bijbehorende tijdstippen
% in het nieuwe figure. 
close all
clearvars
t = 0:0.01:pi;
signaal = atan(t);
plot(t,signaal)

% oplossing:
idx = (signaal > 0.4 & signaal < 0.8);
figure
plot(t(idx),signaal(idx))
