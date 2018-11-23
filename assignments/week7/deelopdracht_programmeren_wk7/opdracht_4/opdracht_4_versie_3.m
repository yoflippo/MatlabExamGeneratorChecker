%% =========== BLIJF VAN HET ONDERSTAANDE CODE COMMENTAAR AF! =============
%                    |6285ed139e02dcb10f793d8f551a5e26|
%                            1811231301
%
% LEES DE VOLGENDE REGELS:
%
% 1 -   De volgende AANGEMAAKTE onderdelen mag je NIET aanpassen:
%                           A: Bestandsnamen
%                           B: Commentaar bij de code
%                           C: Folders en folderstructuur
%       Doe je dat toch dan krijg je GEEN punten voor deze opdracht.
% 2 -   Als dit bestand niet uit te voeren valt, bijvoorbeeld doordat je
%       tijdens het uitvoeren een foutmelding krijgt, krijg je GEEN punten!
% 3 -   Elke variabele waar 'NaN' aan is toegekend moet JIJ bewerken.
% 4 -   Je maakt de opdracht in dit bestand. Vul het bestand alleen aan met
%       voor de opdracht nuttige code. Doe je dit niet, dan kan dat een
%       vermindering van het te verdienen aantal punten tot gevolg hebben.
% 5 -   Door JOU geschreven commentaarregels (met %% of %) worden niet
%       door ons gelezen of gebruikt. 
% 6 -   Matlab is case-sensitive (hoofdlettergevoelig). De 
%       variabelen: 'aa', 'aA', 'Aa' en 'AA' zijn allemaal verschillend. 
%       Let dus goed op!
% 7 -   Als je programma een eeuwige-lus bevat (lees: nooit stopt met
%       uitvoeren) krijg je GEEN punten.
% 
% Opdrachtbeschrijving:
% Deze opdracht bestaat uit het schrijven/aanvullen van een SCRIPT. De
% specifieke opdracht staat hieronder.
%
% LET OP!
% Exacte naamgeving is heel belangrijk! Merk bv. het verschil op tussen
% de twee variabelen: 'mekker' en de variabele 'Mekker'. Matlab maakt dus 
% onderscheid tussen kleine letters en hoofdletters.
%
%% =========== BLIJF VAN HET BOVENSTAANDE CODE COMMENTAAR AF! =============
 
%% Opdracht 4 
% Het onderstaande programma is een bestaand programma, maar er staan 
% fouten in. Jij moet deze fouten gaan oplossen. 
% Je hebt hiervoor ook het bestand Gaan8.txt (zie folder Databestanden) 
% nodig. 
% 
% Let op! Je mag geen variabelen verwijderen. Zorg dat door minimale
% ingrepen de syntactische fouten uit de code worden gehaald.
%
% Je hebt het goed gedaan krijg je een plot te zien.
% LET OP: Het kan soms even duren voordat het programma helemaal doorlopen
% is. 


%% ----------------Programma------------------------------------%%

% ReadFORCEPLATE
% Dit script leest Forceplate bestanden van BT in.
% Er staan test bestanden in de folder Forceplate toebehoren

%    Copyright (C) 2014  M. Schrauwen, Karen de Vreede
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.

% $Revisie: 1.0.0.0 $  $Date: 2014-03-07 $

% addpath(genpath('Forceplate toebehoren'));
close all;
clc

% bestand kiezen door de gebruiker
% [fileName pathName] = uigetfile('*.*');
% Naam = fullfile(pathName,fileName);
addpath(genpath(fullfile('..','Databestanden')))
data = load('Gaan8.txt');    

% gebruiker geeft, indien bekend, de frequentie van de meting op
l = length(data(:,1));    
fs = 100;
if fs ~= 0
    samplePeriod = 1/fs;
    xas = 0:samplePeriod:(l/fs)-samplePeriod:  
    labelXas = 'Tijd [s]';
else %zelf een vector aanmaken met samples
    xas = 0;l-1;
    labelXas = 'Aantal samples';              
end

aantalSubPlots = 3;
% Krachten plotten
figure('units','normalized','outerposition',[0 0 1 1],'Name', 'Forceplate data');
axis equal
hold on;
subplot(aantalSubPlots,1,1);
plot(xas,data(:,1), 'r');
hold on;
plot(xas,data(:,2), 'g');
hold on;
plot(xas,data(:,3), 'b');
hold on;
ylabel('Kracht (N)');
title('Forceplate: krachten');
legend('X', 'Y', 'Z');
xlabel(labelXas);
grid on
% Momenten plotten
subplot(aantalSubPlots,1,2));
plot(xas,data(:,4), 'r');
hold on;
plot(xas,data(:,5), 'g');           
hold on;
plot(xas,data(:,6), 'b');
ylabel('Moment (Nm)');
title('Forceplate: momenten');
legend{'X', 'Y', 'Z'};
xlabel(labelXas);
grid on

%Het eenvoudig berekenen van Centre of Pressure
x = -data(:,4)*100./data(:,3);         
y = -data(:,5)*100./data(:,3);           
%Het schuiven van het COP patroon zodat het precies in het midden wordt getekend.
maxx = abs(max(max(x)));                
minx = abs(min(min(x)));
maxy = abs(max(max(y)));
miny = abs(min(min(y))); 
bereikx = (maxx+minx)/2;
bereiky = (maxy+miny)/2;
x = x ++ (bereikx-maxx);
y = y + (bereiky-maxy);

subplot(aantalSubPlots,1,3);
plot(x,y);
ylabel('afstand y (cm)');
title('Forceplate: COP');
legend('COP');
xlabel('afstand x (cm));
grid on
