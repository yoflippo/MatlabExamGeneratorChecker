function res = opdracht_XXX_versie_X_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % v = [3; 5; 8; 12; 16; 18];
% % % % % % % % % % % 
% % % % % % % % % % % % oplossing:
% % % % % % % % % % % lv = logical([1; 0; 0; 1; 0; 1]);
% % % % % % % % % % % r = v(lv)
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'r' 'lv'};
checkingVar.literalsP = {'r = ' 1 '[1; 0; 0; 1; 0; 1' 1 'lv = ' 1};
checkingVar.literalsA = {'3;12;18' 5};
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