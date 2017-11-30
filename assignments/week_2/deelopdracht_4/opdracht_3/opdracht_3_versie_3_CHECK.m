function res = opdracht_3_versie_2_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % lengteA = 200;
% % % % % % % lengteB = 190;
% % % % % % % result = lengteB == lengteA; 
%%==========

%% FILL nameVars WITH VARIABLES PRESENT IN SOLUTION FILE THAT THE STUDENT
checkingVar.nameVars = {'result'};
checkingVar.literalsP = {};
checkingVar.literalsA = {'NaN'};
checkingVar.literalsR = {};
checkingVar.literalsO = {{  'lengteA == lengteB' 'lengteB == lengteA' ... 
                            'isequal(lengteA,lengteB)' 'isequal(lengteB,lengteA)'} };
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