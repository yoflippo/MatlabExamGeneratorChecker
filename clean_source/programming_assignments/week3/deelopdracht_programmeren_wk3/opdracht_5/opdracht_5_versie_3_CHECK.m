function res = opdracht_5_versie_3_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % kniehoekHardloper = [61     9    62   118    87   104   131    46   105   123    61    74    92    66    26    32    58     3   106   9];
% % % % % % % % % % % indKniehoeken = find(kniehoekHardloper>70);
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'kniehoekHardloper' 'indKniehoeken'};
checkingVar.literalsP = {'find(kniehoekHardloper >' 1 '>70' 1};
checkingVar.literalsA = {'NaN'};
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


end %function
