function res = opdracht_2_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % positie = [0 0.1 0.2 0.3 0.3 0.25 0.3 0.25 0.2 0.2 0.1 0.05 0];
% % % % % % % % laatsteElement = positie(end);
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'laatsteElement' 'snelheid'};
checkingVar.literalsP = {};
checkingVar.literalsA = {'NaN' 'snelheid(13)' 2};
checkingVar.literalsR = {};
checkingVar.literalsO = {{'snelheid(end,end)' 'snelheid(end)' }};
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
