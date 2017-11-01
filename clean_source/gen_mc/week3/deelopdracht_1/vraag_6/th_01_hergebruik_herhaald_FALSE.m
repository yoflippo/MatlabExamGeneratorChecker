De onderstaande code wordt niet correct uitgevoerd:

======= Code =======
var = randn(1,100); %Genereren van random variabelen
for nRep = 2:10
   z(nRep) = var(nRep-1) + var(nRep) + var(nRep+1) / 3;
end
======= Code =======