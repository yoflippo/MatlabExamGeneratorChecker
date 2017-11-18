function res = opdracht_6_versie_2_CHECK(apStudentSol)

% default
res = 0;
numtests = 6;
q = char(39);
%%========== PLACE SOLUTION IN COMMENTS HERE
%% Opdracht 6
% % % % % % % vec1 = 20:0.1:22;
% % % % % % % vec2 = 10:29;
% % % % % % % vec3 = 33:40;
% % % % % % % 
% % % % % % % vector1 = vec1+3;
% % % % % % % vector2 = vec2-6;
% % % % % % % vector3 = vec3*9;
%%==========

%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.nameVars = {'vector1' 'vector2' 'vector3'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {};
% FILL literalsA, With strings that should not be present.
checkingVar.literalsA = {'NaN' 3};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {'vec1 + 3' 'vec3 * 9'};
checkingVar.literalsO = {{'vec2-6' '-6 + vec2'}};
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
res = runChecksOnScriptAssignment(mfilename,checkingVar,apStudentSol);

end %function
