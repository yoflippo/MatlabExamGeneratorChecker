% Hieronder staat code waarmee je een grafiek van een inverse tangens
% functie tekent. Maak een nieuw figuur aan. De variabele signaal bevat een
% heleboel opvolgende cosinuswaardes. Trek steeds de opvolgende waardes
% van elkaar af (de tweede min de eerste) en plot de nieuwe grafiek in het
% nieuwe figure (geen tijdstippen op de x-as).

close all
t = 0:0.01:pi;
signaal = 1./tan(t);
plot(t,signaal)

