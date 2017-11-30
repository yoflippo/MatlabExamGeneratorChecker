function res = opdracht_6_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % % % function outputvar = opdracht_6(inputvar)
% % % % % % % % % % % % % 
% % % % % % % % % % % % % switch inputvar
% % % % % % % % % % % % %     case 1
% % % % % % % % % % % % %         outputvar = 'een';
% % % % % % % % % % % % %     case 2
% % % % % % % % % % % % %         outputvar = 'twee';
% % % % % % % % % % % % %     case 4 %Merk op dat volgorde er bij een switch-statement niet toe doet.
% % % % % % % % % % % % %         outputvar = 'vier';
% % % % % % % % % % % % %     case 3
% % % % % % % % % % % % %         outputvar = 'drie';
% % % % % % % % % % % % %     case 5
% % % % % % % % % % % % %         outputvar = 'vijf';
% % % % % % % % % % % % %     otherwise
% % % % % % % % % % % % % end
% % % % % % % % % % % % % 
% % % % % % % % % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

% Variables that should be present in file and that should be compared to
% the SOLUTION:
checkingVar.testFunctionInput = {1 2 3 4 5 6 7};
checkingVar.literalsP = {'case' 5 'switch' 1 'outputvar' 5};
checkingVar.literalsA = {'NaN' 'if' 2 'else' 2 'zes' 1 };
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
res = runChecksOnFunctionAssignment(mfilename,checkingVar,apStudentSol);

end %function