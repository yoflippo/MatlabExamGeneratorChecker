%% Opdracht 5
% Je wilt weten wanneer een bergbeklimmer hoger is dan 311 meter. 
% Je hebt om de 10 minuten gemeten hoe hoog hij zit.
%
% Gebruik een functie die alle indices vind van de getallen groter dan 311. 
% De data moet in de een variabele genaamd 'hoogteBergbeklimmer' staan.
%
% Dit zijn de waardes van de variabele 'hoogteBergbeklimmer' : 
% 301   303   305   313   323   306   311   320   320 319   320   320
% 310   317   314   309   319   316   320   314
%
% De gevonden indices stop je in een variabele genaamd 'tijdstippen'.

hoogteBergbeklimmer = [301   303   305   313   323   306   311   320   320 319   320   320   310   317   314   309   319   316   320   314];
tijdstippen = find(hoogteBergbeklimmer > 311);


