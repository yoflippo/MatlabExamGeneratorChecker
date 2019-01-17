%% Opdracht 2
% Hieronder staat een regel waarmee je een grafiek van een cosinus tekent.
% Maak eerst een nieuw figuur aan voordat je plot() aanroept. 
% Selecteer alle waarden uit 'signaal' die kleiner zijn dan 0.5 en plot 
% deze met de bijbehorende tijdstippen in het nieuwe figure.
%
% LET OP! Je mag geen while of for gebruiken. Tip: gebruik logische en 
% relationele operatoren.

close all
figure
t = 0:0.01:2*pi;
signaal = cos(t);
plot(t,signaal)

idx = NaN;