%% Opdracht 4
% Maak een function genaamd opdracht_4.
% In deze opdracht maak je enkel gebruik van operatoren en een
% if-statement (geen else-statement).
%
% Geef deze functie de volgende inputs:
% Gastronemicus, RectusFemoris, Brachialis
%
% Als de Gastronemicus ongelijk is aan 0 of 1 moet de output van de functie
% altijd -1 zijn.
% In elk ander geval moet je de waardes in RectusFemoris en Brachialis bij
% elkaar optellen.
%
% Voorbeelden:
% 1- opdracht_4(1,2,3)  geeft terug: -1
% 2- opdracht_4(2,2,3)  geeft terug:  5
% 3- opdracht_4(2,-1,1) geeft terug:  0
%

function output = opdracht_4(Gastronemicus, RectusFemoris, Brachialis)
    
    output = RectusFemoris + Brachialis;

    if (Gastronemicus == 0 | Gastronemicus == 1)
        output = -1;
    end

end