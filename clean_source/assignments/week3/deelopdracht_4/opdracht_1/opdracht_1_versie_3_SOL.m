%% Opdracht 1
% In de folder Databestanden staat een bestand met de naam herrefaber.txt.
% Hieronder staat een regel waarmee je de gegevens uit dat bestand in de
% variabele 'data' zet. Deze bestaat uit 2 rijen en 5 kolommen.
% De tweede rij bestaat uit hoeken. 
% 
% Zet in de variabele 'hoeken' deze rij.
% Plot in de sinus van deze hoeken in een grafiek.
% x-as: hoeken
% y-as: sinus van de hoeken.

addpath(genpath(fullfile('..','Databestanden')))
data = load('herrefaber.txt');

% De oplossing:
hoeken = data(2,:);
plot(hoeken,sin(data(2,:)))