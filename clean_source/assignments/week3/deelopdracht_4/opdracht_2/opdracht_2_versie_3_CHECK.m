function res = opdracht_2_versie_3_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % close all
% % % % % % % % % % t = 0:0.01:pi;
% % % % % % % % % % signaal = atan(t);
% % % % % % % % % % plot(t,signaal)
% % % % % % % % % % 
% % % % % % % % % % % oplossing:
% % % % % % % % % % idx = (signaal > 0.4 & signaal < 0.8);
% % % % % % % % % % figure
% % % % % % % % % % plot(t(idx),signaal(idx))

%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {};
checkingVar.literalsP = {'plot(t' 2 'signaal(' 1 'figure' 1};
checkingVar.literalsA = {'NaN' 2};
checkingVar.literalsR = {};
checkingVar.literalsO = {{'> 0.4' '0.4 <'} {' < 0.8' '0.8 >'} {'&' '&&'}};
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