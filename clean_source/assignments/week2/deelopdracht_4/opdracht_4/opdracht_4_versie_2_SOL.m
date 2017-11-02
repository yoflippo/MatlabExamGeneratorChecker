%% Opdracht 4
% Maak een function genaamd opdracht_4.
% In deze opdracht maak je enkel gebruik van operatoren en een
% if-statement (geen else-statement).
%
% Geef deze functie de volgende inputs:
% Gastronemicus, RectusFemoris, Brachialis
%
% Als de Gastronemicus ongelijk is aan 2 of 1 moet de output van de functie
% altijd 10 zijn.
% In elk ander geval moet je de waardes in RectusFemoris en Brachialis bij
% elkaar optellen.
%
% Voorbeelden:
% 1- opdracht_4(1,2,3)      geeft terug: 10
% 2- opdracht_4(0,-1,-1)    geeft terug: -1
% 3- opdracht_4(3,-1,-6)    geeft terug:  7
%

function output = opdracht_4(Gastronemicus, RectusFemoris, Brachialis)
    
    output = RectusFemoris + Brachialis;

    if (Gastronemicus == 2 | Gastronemicus == 1)
        output = 10;
    end

end