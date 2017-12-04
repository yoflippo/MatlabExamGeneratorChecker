function res = opdracht_1_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % Matrix= [12 31 31; 123    124 14; 102 182       21];
% % % % % % % % % Matrix(1,3)
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
checkingVar.nameVars = {'Matrix'};
checkingVar.literalsP = {'Matrix(' 1};
checkingVar.literalsA = {'.'};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};
checkingVar.literalsSL = {};

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