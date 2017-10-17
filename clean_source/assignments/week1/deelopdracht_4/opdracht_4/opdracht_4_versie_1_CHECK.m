function res = opdracht_4_versie_1_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % function result = opdracht_4(txt)
% % % % % % result = ['opdracht_4: ' txt];
% % % % % % end
%%==========



%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.testFunctionInput = {'XXX' 'XXXXXX' '____'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {   'function' 1 'result' 2 'opdracht_4(' 1 'opdracht_4(txt)' 1 'end' 1 ...
                                        'opdracht_4: ' 1 'txt' 2};
% FILL literalsA, With strings that should not be present.
checkingVar.literalsA = {'NaN'};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {};

    

%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Literals that should be present and
% 2- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.



%% Commence the TESTING !!!
res = runChecksOnFunctionAssignment(mfilename,checkingVar,apStudentSol);

end %function

