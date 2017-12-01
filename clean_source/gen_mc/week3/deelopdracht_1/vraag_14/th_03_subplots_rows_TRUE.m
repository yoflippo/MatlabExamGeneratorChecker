De onderstaande code laat een figure zien met 2 horizontale subplots.

======= Code =======
n = 10;
t = -n:0.1:n;
Y1 = t.^2;

subplot(2,1,1); 
plot(Y1);    

subplot(2,1,2);
plot(t,Y1);   
======= Code =======