%% Opdracht 2
% Gegeven is onderstaande code. Je moet de verhouding (ratio) bepalen
% tussen de grootste beenlengte en de kleinste beenlengte.
% 1 - Bepaal m.b.v. een standaardfunctie de maximum waarde van de input 
% variabele 'beenlengtes'.
% 2 - Bepaal ook de minimum waarde van de input variabele 'beenlengtes'.
% 3 - Deel de maximum waarde door de minimum waarde geef die waarde als 
% output terug.
%
% De functie in dit bestand moet je zelf aanroepen m.b.v. een extra script
% en dat script moet je zelf maken en mag je in dezelfde folder zetten
% als dit bestand. Dat script wordt niet nagekeken of gebruikt door ons.

function MaxDivMin = opdracht_1(beenlengtes)
MaxDivMin = max(beenlengtes)/min(beenlengtes);
end