function res = opdracht_3_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % %% Opdracht 4
% % % % % % % Zie onderstaande code. Plot de twee signalen in hun eigen figure.
% % % % % % 
% % % % % % signaal1 = randn(1,100);
% % % % % % signaal2 = randn(1,100);
% % % % % % 
% % % % % % figure(1)
% % % % % % plot(signaal1)
% % % % % % figure(2)
% % % % % % plot(signaal2)
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

% Variables that should be present in file and that should be compared to
% the SOLUTION:
checkingVar.nameVars = {};
checkingVar.literalsP = {'figure' 2 'figure' 2 'plot(signaal1)' 1 'plot(signaal2)' 1 }; 
checkingVar.literalsA = {'NaN'};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};

% checkingVar.nameVars = {'teller'};
% checkingVar.literalsP = {'teller < 100' 1 'teller + 1' 1 'teller=1' 1};
% checkingVar.literalsA = {'NaN'};
% checkingVar.literalsR = {};
% checkingVar.literalsO = {};
% checkingVar.literalsRO = {};


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
clear signaal1 signaal2
close all
end %function