close all;
clc
data = load(fullfile('Databestanden','Gaan1.txt'));
l = length(data(:,1));
fs = 100;
if fs ~= 0
    samplePeriod = 1/fs;
    xas = 0:samplePeriod:(l/fs)-samplePeriod;
    labelXas = 'Tijd [s]';
else
    xas = 0:l-1;
    labelXas = 'Aantal samples';
end
aantalSubPlots = 3;
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
x = -data(:,4)*100./data(:,3);
y = -data(:,5)*100./data(:,3);
maxx = abs(max(max(x)));
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
