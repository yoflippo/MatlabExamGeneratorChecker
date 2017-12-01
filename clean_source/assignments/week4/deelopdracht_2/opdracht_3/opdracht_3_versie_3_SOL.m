% Opdracht 3

% In de onderstaande code staan fouten. Los de foutmelding op.
% Let op! Bij het oplossen mag je geen variabelen verwijderen.


balVast = logical([1 1 1 1 1 0 0 0 0 0 0 0 0 1 1 1]);
Pos = [30 31 33 35 38 36 34 32 30 28 26 24 22 22 23 24]; 

relevantPos = Pos(not(balVast));
naarVoren = diff(relevantPos);
[x,i] = find(naarVoren > 0);
if isempty(i) == true
  disp('Geen overtreding')
else
  disp('Overtreding!')
end


