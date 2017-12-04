%% Opdracht_1
% Maak de volgende 3 variabelen aan:
% data1 met de getallen 1 tot en met 10.
% data2 met de getallen 11 tot en met 20.
% data3 met de getallen 21 tot en met 30.
% Maak een variabele genaamd data.
% Sla data1 tot en met data3 op als kolomvectoren in de variabele data.
% Schrijf deze variabele data weg als een Excel bestand genaamd output

data1 = (1:10)';
data2 = (11:20)';
data3 = (21:30)';
 
data = [data1 data2 data3];
dlmwrite('output.xls',data);
