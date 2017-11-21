De onderstaande code laat een plot zien met cirkeltjes in
plaats van een normale lijn.

======= Code =======
n = 1;
t = -n:0.1:n;
Y1 = t.^2;

figure;
plot(t,Y1,'ro','LineWidth',3);
======= Code =======