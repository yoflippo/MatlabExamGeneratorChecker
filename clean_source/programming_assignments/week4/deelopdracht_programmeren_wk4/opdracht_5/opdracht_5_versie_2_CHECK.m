function res = opdracht_5_versie_2_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % % % % % function [CC, D] = opdracht_5(AA,B)
% % % % % % % % % % % % % % %    
% % % % % % % % % % % % % % % if strlength(AA) > 8
% % % % % % % % % % % % % % %     CC = AA;
% % % % % % % % % % % % % % % else
% % % % % % % % % % % % % % %     CC = '';
% % % % % % % % % % % % % % % end
% % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % if strlength(B) < 8
% % % % % % % % % % % % % % %     D = B;
% % % % % % % % % % % % % % % else
% % % % % % % % % % % % % % %     D = '';
% % % % % % % % % % % % % % % end
% % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
q = char(39);
checkingVar.testFunctionInput = {{'XaX','XaX'} {'XXXXXYYYYYZ','XXXXXYYYYYZ'}  {'XXXXXYYYYY','XXXXXYYYaaYYZ'}};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {'length(AA)' 1 'length(B)' 1 'D = B' 1 'CC = AA' 1 'B' 3 'D' 3};
% FILL literalsA, With strings that should not be present.
% The numeric directly to the right represents the weight
checkingVar.literalsA = {'NaN' 3};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {};
checkingVar.literalsO = {{'length(B) < 8' '8 > length(B)'} {'length(AA) > 8' '8 < length(AA)'}};
checkingVar.literalsRO = {};

%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Literals that should be present and
% 2- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.

%% Commence the TESTING !!!
res = 0;
res = runChecksOnFunctionAssignment(mfilename('fullpath'),checkingVar,apStudentSol);


end %function