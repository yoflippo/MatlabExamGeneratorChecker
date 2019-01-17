function res = opdracht_6_versie_1_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % vector1 = 11:18;
% % % % vector2 = 22:29;
% % % % vector3 = 33:40;
% % % % 
% % % % vec1 = vector1 + 10;
% % % % vec2 = vector2 - 10;
% % % % vec3 = vector3 * 10;
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.nameVars = {'vec1' 'vec2' 'vec3'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {'vector2 - 10' 1};
% FILL literalsA, With strings that should not be present.
checkingVar.literalsA = {'NaN'};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {'vector1 + 10' 'vector3 * 10'};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};

%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.


% If the used tests above are not sufficient... design your own down... you
% lazy cunt


%% Commence the TESTING !!!
res = runChecksOnScriptAssignment(mfilename('fullpath'),checkingVar,apStudentSol);


end %function