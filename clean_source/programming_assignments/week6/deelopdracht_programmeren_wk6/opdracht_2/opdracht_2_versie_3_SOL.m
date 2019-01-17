%% Opdracht 2
% Hieronder staat een regel waarmee je een grafiek van een arctangens
% tekent. 
% Maak eerst een nieuw figuur aan voordat je plot() aanroept. Selecteer alle 
% waarden uit 'signaal' die groter zijn dan 0.4 en kleiner  dan 0.8 en 
% plot de bijbehorende tijdstippen in het nieuwe figure.
%
% LET OP! Je mag geen while of for gebruiken. Tip: gebruik logische en 
% relationele operatoren.

close all
t = 0:0.01:pi;
signaal = atan(t);
plot(t,signaal)

idx = (signaal > 0.4 & signaal < 0.8);
figure
plot(t(idx),signaal(idx))