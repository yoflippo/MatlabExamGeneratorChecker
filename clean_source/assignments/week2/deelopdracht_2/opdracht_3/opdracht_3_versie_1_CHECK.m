function res = opdracht_3_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % %% Opdracht 3
% % % % % % % % Maak de volgende variabelen aan:  versnelling=[].
% % % % % % % % Laat met een bestaande functie zien dat deze variabele leeg is. 
% % % % % % % 
% % % % % % % versnelling = [];
% % % % % % % isempty(versnelling);
% % % % % % % 

%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

% Variables that should be present in file and that should be compared to
% the SOLUTION:
checkingVar.nameVars = {'versnelling'};
checkingVar.literalsP = {'isempty(versnelling)' 1 'versnelling = []' 1};
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
