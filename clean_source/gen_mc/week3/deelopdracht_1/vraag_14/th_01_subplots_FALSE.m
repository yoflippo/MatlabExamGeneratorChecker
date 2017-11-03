De onderstaande code laat een figure zien met 2 subplots.

======= Code =======
n = 10;
t = -n:0.1:n;
y1 = t.^2;
y2 = t.^3;
subplot(2,1,1); 
plot(t,y1);    
grid on         
grid minor
subplot(2,1,1);
plot(t,y2);    
grid on        
grid minor  
======= Code =======