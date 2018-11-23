function res = opdracht_2_versie_1_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % Een student heeft de volgende logische operatoren gebruikt, maar er gaat
% % % % iets fout. Pas het programma aan.
% % % 
% % % vectorA = [1 2 3];
% % % vectorB = [3 2 1];
% % % result = vectorA | vectorB
%%==========

%% FILL nameVars WITH VARIABLES PRESENT IN SOLUTION FILE THAT THE STUDENT
% SHOULD CHANGE!
nameVars = {'vectorA' 'vectorB' 'result'};
% FILL literalsA, With strings that should not be present.
literalsA = {'NaN' '||'};


checkingVar.nameVars = nameVars;
checkingVar.literalsP = {};
checkingVar.literalsA = literalsA;
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};

%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.




%% Commence the TESTING !!!
res = runChecksOnScriptAssignment(mfilename,checkingVar,apStudentSol);

end %function