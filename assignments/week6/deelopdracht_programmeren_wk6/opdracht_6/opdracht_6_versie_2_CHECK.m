function res = opdracht_6_versie_2_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % % function m = opdracht_6(v)
% % % % % % % % % % % % m = repmat(v,2,3);
% % % % % % % % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file

checkingVar.testFunctionInput.data = {{'[4; 3; 2; 1;]'} {'[4 3 2 1]'} {'[3 4 5; 1 2 3; 5 6 7;]'} {'[4 3; 2 1]'} {'[1 2 3 4 5]'} {'[1 2 3; 4 5 6]'} {'[1; 2]'}};
checkingVar.literalsP = {'function' 1 'm=' 1};
checkingVar.literalsA = {'NaN' 3};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};

%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Literals that should be present and
% 2- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.

%% Commence the TESTING !!!
res = 0;
res = runChecksOnFunctionAssignment(mfilename,checkingVar,apStudentSol);

end %function