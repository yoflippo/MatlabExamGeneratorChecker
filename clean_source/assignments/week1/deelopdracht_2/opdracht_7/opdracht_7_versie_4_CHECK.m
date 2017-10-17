function res = opdracht_7_versie_4_CHECK(apStudentSol)
res = 0;


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.nameVars = {'kol' 'rij'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {'size(' 1};
% FILL literalsA, With strings that should not be present.
checkingVar.literalsA = {'NaN' 'kol=13' 'rij=2'};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {};


%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.


% If the used tests above are not sufficient... design your own down... you
% lazy cunt


%% Commence the TESTING !!!
res = runChecksOnScriptAssignment(mfilename,checkingVar,apStudentSol);

end %function
