function res = opdracht_2_versie_2_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % % %% Opdracht 1
% % % % % % % % % % % % % Een student heeft de volgende logische operatoren gebruikt, maar er gaat
% % % % % % % % % % % % % iets fout. Pas het programma aan.
% % % % % % % % % % % % 
% % % % % % % % % % % % vectorC = [1 2 3];
% % % % % % % % % % % % vectorD = [3 2 1];
% % % % % % % % % % % % result = vectorC & vectorD
%%==========

%% FILL nameVars WITH VARIABLES PRESENT IN SOLUTION FILE THAT THE STUDENT
% SHOULD CHANGE!
nameVars = {'vectorC' 'vectorD' 'result'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100' or 'size('
% PLEASE MIND THE REVERSED CASE: '10+2' or  '100+vector1'
% The number to the right of the string designates the number of times the
% string should be present.
literalsP = {'vectorC' 2 'vectorD' 2 '&' 1 };
% FILL literalsA, With strings that should not be present.
literalsA = {'NaN' 'vectorA' 'vectorB' '&&'};
literalsRO = {{'vectorD & vectorC' 'vectorD && vectorC'}};




%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.

checkingVar.nameVars = nameVars;
checkingVar.literalsP = literalsP;
checkingVar.literalsA = literalsA;
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = literalsRO;


%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.




%% Commence the TESTING !!!
res = runChecksOnScriptAssignment(mfilename,checkingVar,apStudentSol);


end %function