De onderstaande code zonder foutmeldingen uitgevoerd:

======= Code =======
clc
clear variables
var = randn(1,100); %Genereren van random variabelen
for nHerhaling = 1:10
   z(nHerhaling+1) = var(2*nHerhaling);
end
======= Code =======