% Hieronder staat een regel waarmee je een grafiek van een cosinus tekent.
% Maak een nieuw figuur met de function 'figure'. Selecteer alle waarden
% uit 'signaal' die kleiner zijn dan 0.5 en plot deze met de bijbehorende
% tijdstippen in het nieuwe figure.
close all
t = 0:0.01:2*pi;
signaal = cos(t);
plot(t,signaal)


% oplossing:
idx = signaal < 0.5;
figure
plot(t(idx),signaal(idx))
