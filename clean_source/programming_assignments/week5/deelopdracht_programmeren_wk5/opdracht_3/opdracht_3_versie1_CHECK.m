function res = opdracht_3_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % getal = 53;
% % % % % % % % % % % while getal > 5
% % % % % % % % % % %     getal = getal / 2;
% % % % % % % % % % %     getal = getal + 1
% % % % % % % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

% Variables that should be present in file and that should be compared to
% the SOLUTION:
checkingVar.nameVars = {};
checkingVar.literalsP = {'getal > 5' 1 'getal > 5' 1 'getal > 5' 1 'getal / 2' 1 'while' 1 }; 
checkingVar.literalsA = {'NaN'};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};
clear getal
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
res = runChecksOnScriptAssignment(mfilename('fullpath'),checkingVar,apStudentSol);


end %function