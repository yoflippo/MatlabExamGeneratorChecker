function res = opdracht_2_versie_3_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % A = 1;
% % % % % % B = 0;
% % % % % % C = 1;
% % % % % % resultaat = B && (A || C);
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
nameVars = {'A' 'B' 'C' 'resultaat'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
literalsP = {'A' 2 'B' 2 'C' 2 '&' 1 'A=1' 1 'B=0' 1 'C=1' 1};
% FILL literalsA, With strings that should not be present.
literalsA = {'NaN' 'resultaat=0'};
% Reverse literals separated by spaces
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100' or 'size('
% PLEASE MIND THE REVERSED CASE: '10+2' or  '100+vector1'
literalsR = {};

checkingVar.nameVars = nameVars;
checkingVar.literalsP = literalsP;
checkingVar.literalsA = literalsA;
checkingVar.literalsR = literalsR;
checkingVar.literalsO = {};
checkingVar.literalsRO = {{'B &' 'B &&'} {'A | C' 'A || C'}};


%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.




%% Commence the TESTING !!!
res = runChecksOnScriptAssignment(mfilename,checkingVar,apStudentSol);

end %function