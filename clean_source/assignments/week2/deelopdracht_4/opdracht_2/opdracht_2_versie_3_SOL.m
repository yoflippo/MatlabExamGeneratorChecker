%% Opdracht 2
% Maak de volgende variabelen aan:
%   A met de waarde 1;
%   B met de waarde 0;
%   C met de waarde 1;
%   Combineer bovengenoemde variabelen m.b.v. enkel de OR- en/of 
%   AND-operator zodat ze allemaal worden gebruikt en worden geevalueerd 
%   tot '0'. Het resultaat van deze handeling moet worden toegekend aan 
%   een variabele genaamd 'resultaat'.
A = 1;
B = 0;
C = 1;
resultaat = B && (A || C);
% Ook goed gerekend:
% resultaat = B & (A | C);
% resultaat = B & (A & C);
% etc. Er zijn heel veel manieren.
% Merk op dat de volgorde niet uitmaakt (BV. (A|C) & B is ook goed)
% Let op dat je enkel de OR- en/of AND-operator gebruikt. Geen relationele
% operatoren of andere logische-operatoren.