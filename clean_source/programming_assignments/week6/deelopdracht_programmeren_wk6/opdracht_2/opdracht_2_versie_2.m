%% Opdracht 2
% Hieronder staat een regel waarmee je een grafiek van een tangens tekent.
% Maak eerst een nieuw figuur met de function 'figure'. Selecteer alle waarden
% uit 'signaal' die kleiner zijn dan 0 en plot deze met de bijbehorende 
% tijdstippen in het nieuwe figure. 
%
% LET OP! Je mag geen while of for gebruiken. Tip: gebruik logische en 
% relationele operatoren.

close all
t = 0:0.01:pi;
signaal = tan(t);
plot(t,signaal)

