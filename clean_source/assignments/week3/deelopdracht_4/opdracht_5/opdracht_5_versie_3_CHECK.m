function res = opdracht_5_versie_3_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE

% % % % % % % % % % close all
% % % % % % % % % % % lengte onderbeen (knie-enkel):
% % % % % % % % % % L1 = 0.4;
% % % % % % % % % % % lengte bovenbeen (heup-knie):
% % % % % % % % % % L2 = 0.5;
% % % % % % % % % % % afstand tussen enkel en heup tijdens kniestrekking
% % % % % % % % % % L3 = 0.3:0.01:0.8;
% % % % % % % % % % 
% % % % % % % % % % % De oplossing:
% % % % % % % % % % kniehoek = zeros(size(L3));
% % % % % % % % % % for i = 1:size(L3,2)
% % % % % % % % % %     cosw = (L1^2+L2^2-L3(i))/(2*L1*L2);
% % % % % % % % % %     kniehoek(i) = acos(cosw);
% % % % % % % % % % end    
% % % % % % % % % % plot(L3,kniehoek)

%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'kniehoek'};
checkingVar.literalsP = {'for' 1 'end' 1 'L3(' 1 'L1^2' 1 'acos(' 1 '2*L1*L2' 1 'plot(L3,kniehoek)' 1 '=1:' 1 'plot(L3,kniehoek)' 1};
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

end %function