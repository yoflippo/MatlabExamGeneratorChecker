function res = opdracht_7_versie_2_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % % % % % k = [3; 5; 8; 12; 16; 18];
% % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % oplossing:
% % % % % % % % % % % % % % % rp = logical([0; 1; 0; 1; 0; 1]);
% % % % % % % % % % % % % % % q = k(rp)
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'rp' 'q'};
checkingVar.literalsP = {'q = ' 1 '[0; 1; 0; 1; 0; 1' 1 'rp = ' 1};
checkingVar.literalsA = {'5;12;18' 5};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};
checkingVar.literalsSL = {};

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