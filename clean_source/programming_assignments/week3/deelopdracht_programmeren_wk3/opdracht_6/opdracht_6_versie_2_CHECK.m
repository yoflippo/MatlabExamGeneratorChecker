function res = opdracht_6_versie_2_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % function [maximaleWaarde, minimaleWaarde] = maxMin(vector)
% % % % % % % % % 
% % % % % % % % % maximaleWaarde = max(vector);
% % % % % % % % % minimaleWaarde = min(vector);
% % % % % % % % % 
% % % % % % % % % end
%%==========


checkingVar.testFunctionInput.data = {{round(randn(1,10)*10)} {round(randn(1,8)*10)} {round(randn(1,12)*10)}};
checkingVar.testFunctionInput.DOUBLE_OUTPUT = true;
checkingVar.literalsP = {'vector' 2 'max(vector)' 1 'min(vector)' 1 'function' 1};
checkingVar.literalsA = {'NaN' 2};
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