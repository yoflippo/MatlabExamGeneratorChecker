function res = opdracht_7_versie_1_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
%% Opdracht 7
% % % % % % % Gegeven onderstaande script met een bijzondere vector.
% % % % % % % Vraag m.b.v. een standaard Matlab functie de afmetingen op van de
% % % % % % % vector 'matx'.
% % % % % % % Deze functie geeft het aantal rijen en kolommen terug van de variabele.
% % % % % % % Stop vervolgens de het aantal rijen in de variabele: 'rijn' en
% % % % % % % stop daarna het aantal kolommen in de variabele 'koln'.
% % % % % %
% % % % % % matx = [3 5 6 7 8 5 4 5;
% % % % % %         5 4 5 8 7 6 5 3;
% % % % % %         3 2 3 6 5 4 3 1;];
% % % % % %
% % % % % % [koln rijn] = size(matx);
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.nameVars = {'koln' 'rijn'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {'size(' 1};
% FILL literalsA, With strings that should not be present.
checkingVar.literalsA = {'NaN' 'koln=8' 'rijn=3'};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};

%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.


% If the used tests above are not sufficient... design your own... you
% lazy cunt


%% Commence the TESTING !!!
res = runChecksOnScriptAssignment(mfilename('fullpath'),checkingVar,apStudentSol);


end %function