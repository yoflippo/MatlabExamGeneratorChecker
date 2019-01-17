function res = opdracht_1_versie3_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % % % % % %% Opdracht 1
% % % % % % % % % % % % % % % % Maak een plot van alleen de variabele 'x'.
% % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % t = 0:0.2:20;
% % % % % % % % % % % % % % % x = t*2;
% % % % % % % % % % % % % % % y = t.^2;
% % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % plot(x);
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

% Variables that should be present in file and that should be compared to
% the SOLUTION:
checkingVar.nameVars = {};
checkingVar.literalsP = {'plot' 1 'plot(x)' 1};
checkingVar.literalsA = {'NaN' 2 'plot(t,x)' 1};
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

close all;
end %function