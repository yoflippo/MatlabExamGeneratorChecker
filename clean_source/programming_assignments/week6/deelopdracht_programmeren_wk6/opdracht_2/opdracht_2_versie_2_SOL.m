%% Opdracht 2
% Hieronder staat een regel waarmee je een grafiek van een tangens tekent.
% Maak een nieuw figuur met de function 'figure'. Selecteer alle waarden
% uit 'signaal' die kleiner zijn dan 0 en plot deze met de bijbehorende 
% tijdstippen in het nieuwe figure. 
close all
t = 0:0.01:pi;
signaal = tan(t);
plot(t,signaal)

% oplossing:
idx = signaal < 0;
figure
plot(t(idx),signaal(idx))
