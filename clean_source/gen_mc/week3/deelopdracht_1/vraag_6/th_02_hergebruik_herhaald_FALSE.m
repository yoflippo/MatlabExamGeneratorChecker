De onderstaande code wordt zonder foutmelding uitgevoerd:

======= Code =======
%Genereren van random variabelen
randomWaardes = randn(1,20); 
for nR = 20:100
   z(nR) = randomWaardes(nR) + randomWaardes(nR+1);
end
======= Code =======