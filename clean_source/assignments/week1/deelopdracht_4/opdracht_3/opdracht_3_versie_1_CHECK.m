function res = opdracht1_versie_1_CHECK(apStudentSol)

res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % %% Opdracht 3
% % % % % Gegeven is onderstaande code. Bereken het gemiddelde van de
% % % % % vector 'getallen' zonder gebruik te maken van de standaard
% % % % % Matlab functie mean().
% % % % %
% % % % % Deze functie moet jezelf aanroepen m.b.v. een extra script.
% % % % % Dat script mag je in dezelfde folder zetten als dit bestand.
% % % % % Dat script wordt niet nagekeken of gebruikt door ons.
% % % %
% % % % function result = gemiddelde(getallen)
% % % % result = sum(getallen)/length(getallen);
% % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.testFunctionInput = {{1:5} {2:2:10} {0:1}};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {'getallen' 3 'result' 2 'function' 1  'sum' 1};
% FILL literalsA, With strings that should not be present.
checkingVar.literalsA = {'NaN' 'mean(' 4};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {};
checkingVar.literalsO = {{'length' 'numel'}};
checkingVar.literalsRO = {};
    

%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Literals that should be present and
% 2- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.



%% Commence the TESTING !!!
res = runChecksOnFunctionAssignment(mfilename,checkingVar,apStudentSol);

end %function