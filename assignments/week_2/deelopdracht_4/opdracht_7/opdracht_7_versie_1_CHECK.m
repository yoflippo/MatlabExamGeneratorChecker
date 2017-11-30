function res = opdracht_7_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % % % function output = opdracht_7(input)
% % % % % % % % % % % % % 
% % % % % % % % % % % % % if isequal(input,1)
% % % % % % % % % % % % %     output = 66:99;
% % % % % % % % % % % % % elseif isequal(input,0)
% % % % % % % % % % % % %     output = 55:99;
% % % % % % % % % % % % % else
% % % % % % % % % % % % %     output = 0:10;
% % % % % % % % % % % % % end
% % % % % % % % % % % % %     
% % % % % % % % % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.testFunctionInput = {1 0 -1 2 55};
checkingVar.literalsP = {'output' 4 '66:99' 1 '55:99' 1};
checkingVar.literalsA = {'NaN' 3 'switch' 3};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {{'isequal(input,0)' 'input == 0'} {'isequal(input,1)' 'input == 1'}};


%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Literals that should be present and
% 2- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.



%% Commence the TESTING !!!
res = 0;
res = runChecksOnFunctionAssignment(mfilename,checkingVar,apStudentSol);

end %function