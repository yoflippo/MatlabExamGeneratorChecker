% In de folder databestanden staat
% een bestand met de naam herrefaber.txt.
% Hieronder staat een regel waarmee je de
% gegevens uit dat bestand in de variabele
% data zet. Deze bestaat uit 2 rijen en 5 kolommen.
% De tweede rij bestaat uit hoeken. Plot in 1 regel
% de sinus van deze hoeken in een grafiek.
% x-as: hoeken
% y-as: sinus van de hoeken.

data = load('herrefaber.txt');
plot(data(2,:),sin(data(2,:)))