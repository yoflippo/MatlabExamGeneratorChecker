function res = opdracht_5_versie_3_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE

% % % % % % % % % % % % % close all
% % % % % % % % % % % % % kniehoekAchter = [30 35 39 43 49 59 62 80 110];
% % % % % % % % % % % % % 
% % % % % % % % % % % % % % De oplossing:
% % % % % % % % % % % % % phiVoor = zeros(size(kniehoekAchter));
% % % % % % % % % % % % % for i = 1:size(kniehoekAchter,2)
% % % % % % % % % % % % %     phiVoor(i) = 360-kniehoekAchter(i);
% % % % % % % % % % % % % end    
% % % % % % % % % % % % % figure
% % % % % % % % % % % % % plot(kniehoekAchter,phiVoor)
% % % % % % % % % % % % % title("Kniehoek acterzijde tegen kniehoek voorzijde");
% % % % % % % % % % % % % xlabel('kniehoek achter');
% % % % % % % % % % % % % ylabel('kniehoek voor');

%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'phiVoor'};
checkingVar.literalsP = {'phiVoor(i)' 1 'kniehoekAchter(' 1 'plot(kniehoekAchter,phiVoor)' 1 'title(' 1 'xlabel(' 1 'ylabel(' 1 'title' 1};
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
res = runChecksOnScriptAssignment(mfilename('fullpath'),checkingVar,apStudentSol);

close all
end %function