De onderstaande code laat een plot zien met cirkeltjes in
plaats van een normale lijn.

======= Code =======
n = 1;
t = -n:0.1:n;
Y1 = t.^3;

figure;
plot(t,Y1,'r-','LineWidth',3);
======= Code =======