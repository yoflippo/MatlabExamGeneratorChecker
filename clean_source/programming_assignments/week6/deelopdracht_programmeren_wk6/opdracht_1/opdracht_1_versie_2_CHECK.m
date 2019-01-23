function res = opdracht_1_versie_2_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % addpath(genpath(fullfile('.','Databestanden')))
% % % % % % % % data = load('herrefaber.txt');
% % % % % % % % 
% % % % % % % % % Oplossing:
% % % % % % % % data2 = data(2,3:4);
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

% Variables that should be present in file and that should be compared to
% the SOLUTION:
checkingVar.nameVars = {'data2'};
checkingVar.literalsP = {'data(2' 1};
checkingVar.literalsA = {'NaN' 3 'uigetfile' 1 'uigetdir' 1};
checkingVar.literalsR = {};
checkingVar.literalsO = {{'[data(2,2) data(2,3) data(2,4)]' 'data(2,2:4'}};
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
end %function