function res = opdracht_2_versie3_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % %% Opdracht 2
% % % % % % % % % % % % Druk m.b.v. een while-lus de getallen 15 tot en met 105 af in het Command
% % % % % % % % % % % % Window. Gebruik hiertoe de gegeven variabele genaamd 'teller' en
% % % % % % % % % % % % initialiseer deze variabele op 1. 
% % % % % % % % % % % 
% % % % % % % % % % % teller = 15;
% % % % % % % % % % % while teller < 106
% % % % % % % % % % %     teller = teller + 1;
% % % % % % % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'teller'};
checkingVar.literalsP = { 'teller + 1' 1};
checkingVar.literalsA = {'NaN'};
checkingVar.literalsR = {};
checkingVar.literalsO = {{'teller=15' 'teller=14'}, {'teller < 105' 'teller < 106'}};
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