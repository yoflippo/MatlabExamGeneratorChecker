function res = opdracht_1_versie_3_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % addpath(genpath(fullfile('..','Databestanden')))
% % % % % % data = load('herrefaber.txt');
% % % % % % 
% % % % % % hoeken = data(2,:);
% % % % % % sinusHoeken = sin(data(2,:));
% % % % % % plot(hoeken,sinusHoeken)
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

% Variables that should be present in file and that should be compared to
% the SOLUTION:
checkingVar.nameVars = {'hoeken' 'sinusHoeken'};
checkingVar.literalsP = {'plot(hoeken,' 1 'sin(' 1 'sinusHoeken)' 1};
checkingVar.literalsA = {'NaN' 3};
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

rmpath(genpath(fullfile('..','Databestanden')))
close all;
end %function