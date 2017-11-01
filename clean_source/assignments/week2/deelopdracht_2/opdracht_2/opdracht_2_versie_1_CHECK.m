function res = opdracht_2_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % %% Opdracht 2
% % % % % % % Hieronder hebben wij voor jou een vector genaamd 'snelheid' aangemaakt.
% % % % % % % Vraag het laatste element op van de vector snelheid en stop dit element
% % % % % % % in de variabele 'laatsteElement'. 
% % % % % % % Je mag geen NUMERIKE index gebruiken (bijvoorbeeld snelheid(1) of 
% % % % % % % snelheid(8).
% % % % % % 
% % % % % % snelheid = [0 0.1 0.2 0.3 0.3 0.25 0.3 0.25 0.2 0.2 0.1 0.05 0];
% % % % % % laatsteElement = snelheid(end);
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'laatsteElement' 'snelheid'};
checkingVar.literalsP = {'snelheid(end)' 1 'snelheid(' 1};
checkingVar.literalsA = {'NaN' 'snelheid(13)' 2};
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
