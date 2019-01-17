function res = opdracht_5_versie3_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % %% Opdracht 5
% % % % % % % % % Gebruik een for-lus om de getallen 
% % % % % % % % % tussen -5 en 5 af te drukken in het Command Window.
% % % % % % % % 
% % % % % % % % for i = -4:4
% % % % % % % %     i;%de puntkomma mag er in jouw uitwerking niet bij zitten.
% % % % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'i' };
checkingVar.literalsP = {'-4:4' 1 'i = -4:4' 1 'for' 1};
checkingVar.literalsA = {'NaN' 1 'i=5' 3 'i=4' 3};
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
res = runChecksOnScriptAssignment(mfilename('fullpath'),checkingVar,apStudentSol);


end %function