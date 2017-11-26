function res = opdracht_5_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE

% % % % % % % % % % close all
% % % % % % % % % % phi = 30*pi/180:1*pi/180:pi;
% % % % % % % % % % % lengte onderbeen:
% % % % % % % % % % L1 = 0.4;
% % % % % % % % % % % lengte bovenbeen:
% % % % % % % % % % L2 = 0.5;
% % % % % % % % % % 
% % % % % % % % % % % De oplossing:
% % % % % % % % % % L3 = zeros(size(phi));
% % % % % % % % % % for i = 1:size(phi,2)
% % % % % % % % % %     L3(i) = L1^2+L2^2-2*L1*L2*cos(phi(i));
% % % % % % % % % % end    
% % % % % % % % % % figure
% % % % % % % % % % plot(phi,L3)
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'L3'};
checkingVar.literalsP = {'for' 1 'L3(' 1 'L1^2' 1 'cos(phi' 1 '2*L1*L2' 1 'plot(phi,L3)' 1 '=1:' 1 'plot(phi,L3)' 1};
checkingVar.literalsA = {};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};
checkingVar.literalsSL = {{'for' 'phi'} {'L3' 'L2' 'L1'}};

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