% Denice heeft een Matlab code geschreven, echter had ze niet veel tijd en
% heeft daardoor enkele fouten gemaakt. Ze heeft onbewust 'Quick n Dirty'
% geprogrammeerd en heeft daardoor niet goed op zitten letten.

% Als het programma wordt gerunt, gebeurd niet hetgeen wat zij voor ogen had. 
% Verbeter de fouten van Denice waardoor de code naar wens werkt.

% Deze code dient ervoor om de afnemende Kinetische en toenemende Potentiële Energie te
% berekenen en te plotten.

% De Kinetische Energie kan worden berekend aan de hand van: 
% Ekinetisch = 0.5 .* m .* v.^2

% De Potentiële Energie kan worden berekend aan de hand van:
% Epotentieel = m * g * h

% De formule voor de Kinetische energie
Ekinetisch = 0.5 * m * v^2;
% De grafiek wordt geplot
subplot(2,1,1,);
plot(v, Ekinetich,'r')
title ('Kinetisch VS Snelheid')
xlabel('Snelheid')
ylabel('Kinetische Energie')
set(gca,'xdir','rev') % De snelheid wordt nu getransleerd van hoog naar laag

% Aan de variabele m en v worden waardes gegeven
m = 20; % Dit is de massa
v = 10:-0.1:1; % Dit is de snelheid

% Aan de variabele g en h worden waardes gegeven
h = 2:1:5: % Dit is de variërende hoogte
g = 10; % Dit is de zwaartekracht

% De formule voor de Potentiële Energie
Epotentieel = m * g * h;
% De grafiek wordt geplot
subplot(2,1,2)
plot{h,Epotentieel,'c'}
title ('Potentiële energie bij verschillende hoogtes')
xlabel('hoogtes')
ylabel_('Potentiële Energie')
