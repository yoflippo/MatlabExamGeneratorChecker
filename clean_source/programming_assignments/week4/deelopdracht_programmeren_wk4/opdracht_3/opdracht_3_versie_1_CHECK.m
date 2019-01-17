function res = opdracht_3_versie_1_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % lengteA = 180;
% % % % % % lengteB = 190;
% % % % % % result = lengteA > lengteB; % Hier komt een test m.b.v. een relationele operator
%%==========

%% FILL nameVars WITH VARIABLES PRESENT IN SOLUTION FILE THAT THE STUDENT
% SHOULD CHANGE!
nameVars = {};
% FILL literalsA, With strings that should not be present.
literalsA = {'NaN'};


checkingVar.nameVars = nameVars;
checkingVar.literalsP = {};
checkingVar.literalsA = literalsA;
checkingVar.literalsR = {};
checkingVar.literalsO = {{'lengteA > lengteB' 'lengteB < lengteA'} };
checkingVar.literalsRO = {};

%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.




%% Commence the TESTING !!!
res = runChecksOnScriptAssignment(mfilename('fullpath'),checkingVar,apStudentSol);


end %function