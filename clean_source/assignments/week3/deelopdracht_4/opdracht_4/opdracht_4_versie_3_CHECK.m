function res = opdracht_4_versie_3_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % 
% % % % % % % % % % % close all
% % % % % % % % % % % t = 0:0.01:pi;
% % % % % % % % % % % signaal = tan(t);
% % % % % % % % % % % plot(t,signaal)
% % % % % % % % % % % 
% % % % % % % % % % % % oplossing:
% % % % % % % % % % % diffSignaal = diff(signaal);
% % % % % % % % % % % figure
% % % % % % % % % % % plot(diffSignaal)

%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'diffSignaal'};
checkingVar.literalsP = {'figure' 1 'plot(diffSignaal)' 1};
checkingVar.literalsA = {};
checkingVar.literalsR = {};
checkingVar.literalsO = {{'for' 'diff('}};
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
close all
end %function