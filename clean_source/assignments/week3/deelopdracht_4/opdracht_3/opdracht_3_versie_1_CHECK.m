function res = opdracht_3_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % 
% % % % % % % % % close all
% % % % % % % % % t = 0:0.01:pi;
% % % % % % % % % signaal = exp(t);
% % % % % % % % % plot(t,signaal)
% % % % % % % % % 
% % % % % % % % % % De oplossing:
% % % % % % % % % signaal(signaal < 10) = 0;
% % % % % % % % % data = signaal;
% % % % % % % % % figure
% % % % % % % % % plot(t,data)

%%==========


%% FILL string cells below to test, if you are not using them, make them empty!


checkingVar.nameVars = {'data'};
checkingVar.literalsP = {'plot(t,data' 1 '10' 1 '<' 1};
checkingVar.literalsA = {};
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
close all;
end %function