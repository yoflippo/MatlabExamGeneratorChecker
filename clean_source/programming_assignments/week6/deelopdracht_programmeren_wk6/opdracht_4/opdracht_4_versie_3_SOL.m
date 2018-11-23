%% Opdracht 4
% Hieronder staat code waarmee je een grafiek van een inverse tangens
% functie tekent. Maak een nieuw figuur aan. De variabele signaal bevat een
% heleboel opvolgende waardes. Trek steeds de opvolgende waardes
% van elkaar af (de tweede min de eerste)  en stop het resultaat in een 
% vector genaamd 'diffSignaal'. Gebruik hiertoe een daarvoor bedoelde
% standaard functie van Matlab.
% Plot dit signaal in het nieuwe figure (geen tijdstippen op de x-as).

close all
t = 0:0.01:pi;
signaal = 1./tan(t);
plot(t,signaal)

% De oplossing:
diffSignaal = diff(signaal);
figure
plot(diffSignaal)
