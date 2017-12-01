% Opdracht 7
% Het onderstaande programma is een bestaand programma, maar er staat *één* programmeerfouten in.
% Jij moet deze programmeerfout op gaan lossen.

% Je hebt het goed gedaan wanneer de variabele waardeXpYp de goede waardes
% heeft. Nu bevat die nog de verkeerde waardes. 
% Wanneer je het programma laat runnen en je krijgt de melding
% 'WHIEHOEE' dan heb je het goed gedaan. 
% In het begin krijg je een melding met: 'Nog even doorzoeken'. 
% Wanneer je deze melding krijgt dan heb je de programmeerfout nog niet opgelost. 

% LET OP: Je mag code verwijderen, maar geen volledige variabelen.
% Je mag de namen van variabelen wel aanpassen. 

%% ---------------- Programma ------------------ %%
% Dit script geeft je een basale bouwsteen voor een verder zelf te bouwen
% model van de rocker shoe. In deze kale vorm heeft het model (in wording)
% slechts input parameters (straal, booghoek, tophoek en beenlengte) maar
% genereert het geen output. Met andere woorden de effecten van wijzigingen
% van de inputparameters op het gedrag van het model worden niet berekend.
% Het model doorloopt ook nog geen bipedale fase.
% de keuze van die output parameters en de daarvoor benodigde berekeningen
% moeten door de projectgroep zelf worden toegevoegd aan dit script.
% bestudeer voor het formuleren van de relevante output de  in het introductie
% college genoemde literatuur.
% In het script worden rotatiematrices en translatievectoren gebruikt. In de
% lessen biokinematica van Herre Faber wordt de bijbehorende theorie verder toegelicht
% veel succes met het project
% Daphne  wezenberg en Aad Lagerberg
% versie 1.00 november 2015
% gemaakt door A.Lagerberg

clear all
close all
% INPUTS
r =30; % straal van de rockervoet. Maak de straal 0 en je krijgt een model zonder rocker
tophoek = 50; % tophoek tussen de benen
numsteps = 20; % aantal animatie stappen
booghoek = 80; %  cirkelsegment van de rockervoet moet minimaal gelijk zijn aan de tophoek
beenlengte= 90; % spreekt voor zich
time = 0.1; % Pauseduur in de animatie


% BEREKENINGEN
x = 0; %startpositie (x coordinaat centrum cirkelsegment) %% !!
y =0; % startpositie (y coordinaat centrum cirkelsegment)
%model rechtop tekenen
starthoek = -((180-booghoek)/2); % starthoek cirkelsegment
eindhoek = (starthoek-booghoek);
starthoek = starthoek*(pi/180);
eindhoek = eindhoek*(pi/180);
stap = (tophoek/numsteps); %  
stap = stap*(pi/180);
tophoek = tophoek*(pi/180);
booghoek = booghoek*(pi/180);
booglengte = tophoek*r;
stapboog = stap*r; % afgelegde weg op profiel en onderlaag per stap
ang=starthoek:-0.01:eindhoek;
% punten berekenen in rechtopstaande positie vh model
xp= x+r*cos(ang); % x coordinaten van het profiel
yp=y+r*sin(ang); % y coordinaten van het profiel
xendoffoot = x; %snijpunt van been met profiel
yendoffoot = y-r;
j=10;
xheup = x ;
yheup = beenlengte-r;

xknie = 3;

if xknie == 3
    yknie = 'positief';
else
    yknie = 'negatief';
end                             

% alle punten die samen het model vormen in een matrix stoppen
model(1,:)= [xp x xendoffoot xheup];

% maak een vector aan:
model(2,:) = [yp y yendoffoot yheup];

% dan linksom roteren over halve tophoek
starthoek = (tophoek/2);
% de rotatiematrix maken zie: https://nl.wikipedia.org/wiki/Rotatiematrix
Rm = [cos(starthoek) -sin(starthoek);sin(starthoek) cos(starthoek)];
model = Rm*model;
% model animeren
%roteren over een staphoek (rechtsom dus -) (steeds over dezelfde hoek dus 1 matrix volstaat voor de hele
%animatie. Elk geroteerd model wordt apart opgeslagen (3d matrix)
Rstapm =  [cos(-stap) -sin(-stap);sin(-stap) cos(-stap)];
for i =1:numsteps+1
    model(:,:,i+1) = Rstapm*model(:,:,i);
end

% nu hebben we dus een serie  modellen die elk een staphoek verder
% rechtsom geroteerd staan maar nog allemaal om de oorsprong draaien

 % xp en yp element per element optellen
for i = 1:length(xp)
    XpYp(i) = xp(i) + yp(j);     
end


% XpYp vermenigvuldigen met 10
waardeXpYp= XpYp.*10;

% model naar juiste positie in de animatie transleren
% het eerste middelpunt moet naar x = 0 y= r
% daarna steeds in x richting een stapboog verder op de x as
T1(1:2,numsteps+1) = zeros; %lege matrix maken
T1(2,:) = r;                    
for i = 1:numsteps
    T1(1,i+1) = T1(1,i)+stapboog;
end
% Toepassen op het model
for i =1:numsteps+1
    model(1,:,i) = T1(1,i)+model(1,:,i);
    model(2,:,i) = T1(2,i)+model(2,:,i);
end

% hier pak je het derde element van de eerste rij van T1 
derdeElementT1 = T1(1,3);            

%  De animatie plotten
% figure('units','normalized','outerposition',[0 0 1 1],'Name', ' Rocker Animation ');
% axis ([-60 200 -5 120])
% for i = 1:numsteps+1
%     eop = length(model)-3;% bepalen van end of profile coordinaten in het model (de lengte varieert obv de gekozen booghoek)
%     hArea =(area([model(1,eop+1,i) model(1,1:eop+1,i)],[model(2,eop+1,i) model(2,1:eop+1,i)],'FaceColor',[0.9583  0.9583  0.8594],'EdgeColor','none'));
%     hold on
%     hLine(1)=(plot(model(1,1:eop,i),model(2,1:eop,i)));
%     hLine(2)=(line([model(1,eop+1,i) model(1,eop,i)],[model(2,eop+1,i) model(2,eop,i)]));
%     hLine(3)=(line([model(1,eop+1,i) model(1,1,i)],[model(2,eop+1,i) model(2,1,i)]));
%     hLine(4)=(line([model(1,eop+1,i) model(1,eop+2,i)],[model(2,eop+1,i) model(2,eop+2,i)],'Linestyle',':'));
%     hLine(5)=(line([model(1,eop+1,i) model(1,eop+3,i)],[model(2,eop+1,i) model(2,eop+3,i)]));
%     hPoint(1) =(plot(model(1,eop+1,i), 0, '.r', 'MarkerSize',10));% contactpunt
%     hPoint(2)=(plot(model(1,eop+3,i),model(2,eop+3,i), '.r', 'MarkerSize',15)); % heuppositie
%     axis equal
%     line([-60 200],[0 0])
%     axis([-60 200 -5 120])
%     pause(time)
%     if i > 1 && i <numsteps+1 % eerste en laatste positie niet wissen in de plot
%         delete(hLine)
%         delete(hArea)        
%     end
% end


waardeXpYp = floor(waardeXpYp);

if waardeXpYp(end) == -423
    message = 'WHIEHOEEE';
else
    message = 'Nog even doorzoeken';
end


 msgbox(message)
