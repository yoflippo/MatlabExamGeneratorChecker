function res = opdracht_XXX_versie_X_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE

%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.testFunctionInput.data = {'XXX' 'XXX' 'XXX'};
checkingVar.testFunctionInput.DOUBLE_OUTPUT = false;
checkingVar.testFunctionInput.DOUBLE_INPUT = false;
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {'XXX' 2 'XXX' 1};
% FILL literalsA, With strings that should not be present.
% The numeric directly to the right represents the weight
checkingVar.literalsA = {'NaN' 3};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {'X Y' 'Z U'};

% checkingVar below this line can be removed
% Test for literals and their variants
% THIS IS AN USEFUL EXAMPLE: varA > varB  and  varB < varA
checkingVar.literalsO = {{'varA>varB' 'varB<varA'} {'Z' 'M'}};
% Test for literals and their (reversed) variants
% NOTE THE LIMITED USABILITY OF RO: e.g. x > y has the reverse (y > x)
% THIS IS AN USEFUL EXAMPLE: varA == varB (with reverse: varB == varA)
checkingVar.literalsRO = {{'Y' 'X'}};

checkingVar.testFunctionInput = {'XXX'};
checkingVar.literalsP = {'XXX' 2 'XXX' 1};
checkingVar.literalsA = {'NaN' 2};
checkingVar.literalsR = {};
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