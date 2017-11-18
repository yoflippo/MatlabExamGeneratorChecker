% In de folder Databestanden staat een bestand met de naam herrefaber.txt.
% Hieronder staat twee regels waarmee je de gegevens uit dat bestand in de
% variabele data zet. Deze bestaat uit 2 rijen en 5 kolommen. Zet onder 
% deze regels de code om het 2e, 3e en 4e getal uit de tweede rij in de 
% variabele 'data2' te zetten.
addpath(genpath(fullfile('..','Databestanden')))
data = load('herrefaber.txt');


data2 = NaN