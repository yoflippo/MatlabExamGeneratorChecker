function res = opdracht_4_versie_3_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE

%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
checkingVar.nameVars = {'data'};
checkingVar.literalsP = {"data = load('Gaan8.txt')" 1 "xas = 0:samplePeriod:(l/fs)-samplePeriod;" 1 ...
    "xas = 0:l-1;" 1 "subplot(aantalSubPlots,1,2); " 1 "legend('X', 'Y', 'Z');" 1 "x = x + (bereikx-maxx);" 1 ... 
    "xlabel('afstand x (cm)');" 1 };
checkingVar.literalsA = {};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};
checkingVar.literalsSL = {};
checkingVar.NoLiteralsA = true;

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