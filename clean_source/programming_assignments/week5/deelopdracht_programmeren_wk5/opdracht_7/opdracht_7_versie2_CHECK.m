function res = opdracht_7_versie2_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % function output = resultaat(start,eind)
% % % % % % % % % % % 
% % % % % % % % % % % output = 0;
% % % % % % % % % % % for i = start:eind
% % % % % % % % % % %     output = i + output;
% % % % % % % % % % % end
% % % % % % % % % % % 
% % % % % % % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file

checkingVar.testFunctionInput.data = {{2,10} {0,1} {0,10} {-10,10} {3,6}};

% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {'function' 1 'start' 2 'eind' 2 'opdracht_7' 1 '-1' 1};
% FILL literalsA, With strings that should not be present.
% The numeric directly to the right represents the weight
checkingVar.literalsA = {'NaN' 3};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {};

% checkingVar below this line can be removed
% Test for literals and their variants
% THIS IS AN USEFUL EXAMPLE: varA > varB  and  varB < varA
checkingVar.literalsO = {};
% Test for literals and their (reversed) variants
% NOTE THE LIMITED USABILITY OF RO: e.g. x > y has the reverse (y > x)
% THIS IS AN USEFUL EXAMPLE: varA == varB (with reverse: varB == varA)
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