function res = opdracht_3_versie_3_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % function spierdikte = opdracht_3(oppervlakte)
% % % % % % %     halvespierlengte = 10;
% % % % % % %     spierdikte = 2*(oppervlakte/(pi*halvespierlengte));
% % % % % % % end
%%==========



%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.testFunctionInput = {2 5 6 8 9 10 33};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = { 'oppervlakte/' 1 'halvespierlengte = 10' 1 'function' 1 'heleSpierdikte' 2 'pi' 1};
% FILL literalsA, With strings that should not be present.
% The numeric directly to the right represents the weight
checkingVar.literalsA = {'NaN' 'pi*10' '10*pi'}; 
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {'pi * halvespierlengte'};
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