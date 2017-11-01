De onderstaande code wordt niet correct uitgevoerd:

======= Code =======
randomWaardes = randn(1,20); %Genereren van random randomWaardesiabelen
for nR = 20:100
   z(nR) = randomWaardes(nR) + randomWaardes(nR+1);
end
======= Code =======