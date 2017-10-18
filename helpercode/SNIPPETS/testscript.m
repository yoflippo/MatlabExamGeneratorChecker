function res = opdracht_XXX_versie_X_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE

%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

% Variables that should be present in file and that should be compared to
% the SOLUTION:
checkingVar.nameVars = {'XXX' 'XXX' 'XXX'};
% FILL literalsP,  WITH CODE THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {'XXX' 2 'XXX' 1};
% FILL literalsA, With strings that should not be present. The number to
% the right represents the weight of the error. Default weight = 1.
checkingVar.literalsA = {'NaN' 'XXX' 2};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {'X Y' 'Z U'};

%====== checkingVar below this line can be removed
% Test for literals and their variants
% THIS IS AN USEFUL EXAMPLE: varA > varB  and  varB < varA
checkingVar.literalsO = {{'Y' 'X'} {'X' 'Y'}};
% Test for literals and their (reversed) variants
% NOTE THE LIMITED USABILITY OF RO: e.g. x > y has the reverse (y > x) and
% so the reversed case (which would be an error made by the student) could
% be accepted as correct.
%
% THIS IS AN USEFUL EXAMPLE: varA == varB (with reverse: varB == varA)
% EXAMPLE {{'a & b' 'a && b'}} this will check for 'a&b' 'b&a' 'a&&b' 'b&&a'
checkingVar.literalsRO = {{'Y' 'X'}};


%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.


% If the used tests above are not sufficient... design your own... you
% lazy cunt


%% Commence the TESTING !!!
res = 0;
res = runChecksOnScriptAssignment(mfilename,checkingVar,apStudentSol);

end %function