function res = opdracht_XXX_versie_X_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % hoogteBergbeklimmer = [301   303   305   313   323   306   311   320   320 319   320   320   310   317   314   309   319   316   320   314];
% % % tijdstippen = find(hoogteBergbeklimmer > 311);
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'hoogteBergbeklimmer' 'tijdstippen'};
checkingVar.literalsP = {'find(hoogteBergbeklimmer >' 1 '> 311' 1};
checkingVar.literalsA = {'NaN'};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};

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
