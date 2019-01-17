function res = opdracht_2_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE

%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {};
checkingVar.literalsP = {'plot(t' 2 'signaal(' 1 'figure' 1 'signaal < 0.5' 1};
checkingVar.literalsA = {'NaN' 2 'for' 1 'while' 1};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};



%% Commence the TESTING !!!
res = 0;
res = runChecksOnScriptAssignment(mfilename('fullpath'),checkingVar,apStudentSol);

close all;
end %function