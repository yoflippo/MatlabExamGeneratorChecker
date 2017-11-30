function res = opdracht_6_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % function outputvar = opdracht_6(inputvar)
% % % % % % % % % % % 
% % % % % % % % % % % switch inputvar
% % % % % % % % % % %     case 6
% % % % % % % % % % %         outputvar = 'zes';
% % % % % % % % % % %     case 8 %Merk op dat volgorde er bij een switch-statement niet toe doet.
% % % % % % % % % % %         outputvar = 'acht';
% % % % % % % % % % %     case 7
% % % % % % % % % % %         outputvar = 'zeven';
% % % % % % % % % % %     case 9
% % % % % % % % % % %         outputvar = 'negen';
% % % % % % % % % % %     case 10
% % % % % % % % % % %         outputvar = 'tien';
% % % % % % % % % % %     otherwise
% % % % % % % % % % %         outputvar = -1;
% % % % % % % % % % % end
% % % % % % % % % % % 
% % % % % % % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

% Variables that should be present in file and that should be compared to
% the SOLUTION:
checkingVar.testFunctionInput = {6 7 8 9 10 11 12};
checkingVar.literalsP = {'case' 5 'switch' 1 'outputvar' 5 '-1' 1};
checkingVar.literalsA = {'NaN' 'if' 2 'else' 2};
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