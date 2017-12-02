function res = opdracht_2_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % autoSnelheid= 1:3:900;
% % % % % % if autoSnelheid(3)<= 8
% % % % % %     Fstuw = 4;
% % % % % % else 
% % % % % %     Fstuw= 5; 
% % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
checkingVar.nameVars = {'Fstuw'};
checkingVar.literalsP = {'if autoSnelheid(3)' 1 'else' 1 'end' 1 '  Fstuw= 5;' 1 'autoSnelheid= 1:3:900;' 1};
checkingVar.literalsA = {'autoSnelhed' 3 '=<' 3 'autoSnelheid(3)<8' 3};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};
checkingVar.literalsSL = {};


%% Commence the TESTING !!!
res = 0;
res = runChecksOnScriptAssignment(mfilename,checkingVar,apStudentSol);
close all
%% Junk, but could be usefull
% % % % 
% % % % % Variables that should be present in file and that should be compared to
% % % % % the SOLUTION:
% % % % checkingVar.nameVars = {'XXX' 'XXX'};
% % % % % FILL literalsP,  WITH CODE THAT SHOULD BE PRESENT IN
% % % % % The number to the right of the string designates the number of times the
% % % % % string should be present.
% % % % checkingVar.literalsP = {'XXX' 2 'XXX' 1};
% % % % % FILL literalsA, With strings that should not be present. The number to
% % % % % the right represents the weight of the error. Default weight = 1.
% % % % checkingVar.literalsA = {'NaN' 'XXX' 2};
% % % % % Reverse literals separated by spaces
% % % % % EXAMPLE:
% % % % % THE STUDENT SOLUTION, e.g.:    {'2 + 10'  'vector1 + 100'}
% % % % % Will test for:  {'2 + 10'       | '10 + 2'      }    AND
% % % % % Will test for:  {'100 + vector' | 'vector + 100'}
% % % % % Every case and it reverse will be tested.
% % % % checkingVar.literalsR = {'X Y' 'Z U'};
% % % % 
% % % % %====== checkingVar below this line can be removed
% % % % % Test for literals and their variants
% % % % % EXAMPLE: {'varA>varB' 'varB<varA'}
% % % % checkingVar.literalsO = {{'varA>varB' 'varB<varA'} {'Z' 'M'}};
% % % % % Test for literals and their (reversed) variants
% % % % % NOTE THE LIMITED USABILITY OF RO: e.g. x > y has the reverse (y > x) and
% % % % % so the reversed case (which would be an error made by the student) could
% % % % % be accepted as correct.
% % % % %
% % % % % EXAMPLE: {'vecD & vecC' 'vecD && vecC'}
% % % % % Now one of these 4 strings have to be present: 
% % % % % 1:'vecD & vecC' 2:'vecD && vecC' 3:'vecC & vecD' 4:'vecC && vecD'
% % % % checkingVar.literalsRO = {{'Y' 'X'}};


%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.

% If the used tests above are not sufficient... design your own... you
% lazy cunt

end %function