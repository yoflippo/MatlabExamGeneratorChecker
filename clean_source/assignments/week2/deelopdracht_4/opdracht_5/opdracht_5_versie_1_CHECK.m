function res = opdracht_5_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % function [C, D] = opdracht_5(A,B)
% % % % % % % % % % %    
% % % % % % % % % % % if strlength(A) > 10
% % % % % % % % % % %     C = A;
% % % % % % % % % % % else
% % % % % % % % % % %     C = '';
% % % % % % % % % % % end
% % % % % % % % % % % 
% % % % % % % % % % % if strlength(B) < 10
% % % % % % % % % % %     D = B;
% % % % % % % % % % % else
% % % % % % % % % % %     D = '';
% % % % % % % % % % % end
% % % % % % % % % % % 
% % % % % % % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.testFunctionInput = {{'XaX','XaX'} {'XXXXXYYYYYZ','XXXXXYYYYYZ'}  {'XXXXXYYYYY','XXXXXYYYaaYYZ'}};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {'strlength(A)' 1 'strlength(B)' 1 'D = B' 1 'C = A' 1 'B' 3 'D' 3};
% FILL literalsA, With strings that should not be present.
% The numeric directly to the right represents the weight
checkingVar.literalsA = {'NaN' 3};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {};
checkingVar.literalsO = {{'< 10' '10 >'}};
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