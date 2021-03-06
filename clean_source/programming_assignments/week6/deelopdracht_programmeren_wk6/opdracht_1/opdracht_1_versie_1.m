%% Opdracht 1
% In de folder Databestanden staat een bestand met de naam herrefaber.txt.
% Zet de inhoud van dat bestand in een variabele met de naam 'data'.
%
% Dit is niet toegestaan: data = load('herrefaber.txt'); Je mag ook geen
% gebruik maken van 'uigetfile' of 'uigetdir'. Tip: let op was is gegeven.
%
% Gebruik in plaats daarvan een variabele voor de bestandsnaam. 
% Ter controle: 'data' bestaat uit 2 rijen en 5 kolommen met getallen.

%Folder 'Databestanden' toevoegen aan Matlab Path
addpath(genpath(fullfile('..','Databestanden')))
bestand = 'herrefaber.txt';

% Schrijf onder deze regel jouw oplossing:
data = NaN;