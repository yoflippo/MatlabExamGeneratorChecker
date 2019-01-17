function res = opdracht_3_versie_1_CHECK(apStudentSol)
% % % % % 
% % % % % % default
% % % % % res = 0;
% % % % % numtests = 2;

%%========== PLACE SOLUTION IN COMMENTS HERE
%% Opdracht 3
% % - Maak een variabele aan met de naam: varTekst.
% % - Geef deze variabele de tekst: "biostatica_matlab"
%
% varTekst = 'biostatica_matlab';
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.nameVars = {'varTekst'};
checkingVar.literalsP = {'biostatica_matlab' 1 'varTekst' 1};
checkingVar.literalsA = {};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};

%% Commence the TESTING !!!
res = runChecksOnScriptAssignment(mfilename('fullpath'),checkingVar,apStudentSol);


end %function