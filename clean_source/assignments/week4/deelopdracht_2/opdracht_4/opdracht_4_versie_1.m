
% Opdracht 4 
% Het onderstaande programma is een bestaand programma, maar er staan fouten in.
% Jij moet deze fouten gaan oplossen. 
% Je hebt hiervoor ook het bestand Gaan1.txt nodig. 
% Let op! Je mag geen variabelen verwijderen, wel aanpassen. 
% Je hebt het goed gedaan wanneer je een pop-up krijgt met: 'Toppie!!'. 


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
clear all;
clc

% bestand kiezen door de gebruiker
% [fileName pathName] = uigetfile('*.*');
% Naam = fullfile(pathName,fileName);
data = load('Gaan1.txt);

% gebruiker geeft, indien bekend, de frequentie van de meting op
l = length(data(:,,1));
fs = 100
if fs ~= 0
    samplePeriod = 1/fs;
    xas = 0:samplePeriod:(l/fs)--samplePeriod;
    labelXas = 'Tijd [s]';
else %zelf een vector aanmaken met samples
    xas = 0:l-1;
    labelXas = 'Aantal samples;
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
subplot(aantalSubPlots,1,2);
plot(xas,data(:,4), 'r');
hold on;
plot(xas,data(:,5), 'g');
hold on;
plot(xas,data(:,6), 'b');
ylabel('Moment (Nm)');
title('Forceplate: momenten');
legend('X', 'Y', 'Z');
xlabel(labelXas);
grid on

%Het eenvoudig berekenen van Centre of Pressure
x = -data(:,4)*100//data(:,3);       %%!!
y = -data(:,5)*100./data(:,3);
%Het schuiven van het COP patroon zodat het precies in het midden wordt getekend.
maxx = abs(maximaal(max(x)));       %%!!
minx = abs(min(min(x)));
maxy = abs(max(max(y)));
miny = abs(min(min(y)));
bereikx = (maxx+minx)/2;
bereiky = (maxy+miny)/2;
x = x + (bereikx-maxx);
y = y + (bereiky-maxy);

subplot(aantalSubPlots,1,3);
plot(x,y);
ylabel('afstand y (cm)');
title('Forceplate: COP');
legend('COP');
xlabel('afstand x (cm)');
grid on

Message = 'Toppie!!' ;
h = msgbox(Message);