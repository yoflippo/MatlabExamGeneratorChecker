function res = opdracht_4_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% voornaam = 'Jan';
% achternaam = 'Janssen';
% volledig = [voornaam achternaam];
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
checkingVar.nameVars = {'voornaam' 'achternaam' 'volledig'};
checkingVar.literalsP = {};
checkingVar.literalsA = {};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};
checkingVar.literalsSL = {};


%% Commence the TESTING !!!
res = 0;
res = runChecksOnScriptAssignment(mfilename('fullpath'),checkingVar,apStudentSol);

close all
% % Open the cleansource variant
% edit(insertAfter(which(mfilename),['Biostatica_Auto_Matlab' filesep],['clean_source' filesep]));



%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.

% If the used tests above are not sufficient... design your own... you
% lazy cunt

end %function