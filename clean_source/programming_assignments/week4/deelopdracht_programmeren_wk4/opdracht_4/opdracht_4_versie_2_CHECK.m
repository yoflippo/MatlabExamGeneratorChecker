function res = opdracht_4_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % function output = opdracht_4(Gastronemicus, RectusFemoris, Brachialis)
% % % % % % % %     
% % % % % % % %     output = RectusFemoris + Brachialis;
% % % % % % % % 
% % % % % % % %     if (Gastronemicus == 2 | Gastronemicus == 1)
% % % % % % % %         output = 10;
% % % % % % % %     end
% % % % % % % % 
% % % % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.testFunctionInput = {{1,2,3} {0,2,3} {2,2,3} {3,3,3} {-1,2,-2}};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {'= 10' 1};
% FILL literalsA, With strings that should not be present.
% The numeric directly to the right represents the weight
checkingVar.literalsA = {'NaN' 3};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    {'2+10'  'vector1+100'}
% WILL TEST FOR:    {'2 + 10' '10 + 2' '100 + vector' 'vector + 100'}
checkingVar.literalsR = {'RectusFemoris + Brachialis' 'Gastronemicus == 2' 'Gastronemicus == 1'};

% checkingVar below this line can be removed
% Test for literals and their variants
% THIS IS AN USEFUL EXAMPLE: varA > varB  and  varB < varA
checkingVar.literalsO = {};
checkingVar.literalsRO = {};


%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Literals that should be present and
% 2- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.



%% Commence the TESTING !!!
res = 0;
res = runChecksOnFunctionAssignment(mfilename,checkingVar,apStudentSol);

end %function