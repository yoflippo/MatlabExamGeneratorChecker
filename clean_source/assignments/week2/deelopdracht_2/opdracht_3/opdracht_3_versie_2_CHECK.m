function res = opdracht_3_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % %% Opdracht 3
% % % % % % % % Maak de volgende variabelen aan:  snelheid = [ 4 5 2 9 2 1]
% % % % % % % % Laat met een bestaande functie zien dat deze variabele niet leeg is.
% % % % % % % 
% % % % % % %  snelheid = [ 4 5 2 9 2 1]
% % % % % % %  isempty(snelheid)
% % % % % % %  
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

% Variables that should be present in file and that should be compared to
% the SOLUTION:
checkingVar.nameVars = {'snelheid'};
% FILL literalsP,  WITH CODE THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {'isempty(snelheid)' 1};
% FILL literalsA, With strings that should not be present. The number to
% the right represents the weight of the error. Default weight = 1.
checkingVar.literalsA = {'NaN' };
% Reverse literals separated by spaces
% EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    {'2 + 10'  'vector1 + 100'}
% Will test for:  {'2 + 10'       | '10 + 2'      }    AND
% Will test for:  {'100 + vector' | 'vector + 100'}
% Every case and it reverse will be tested.
checkingVar.literalsR = {};

%====== checkingVar below this line can be removed
% Test for literals and their variants
% EXAMPLE: {'varA>varB' 'varB<varA'}
checkingVar.literalsO = {};
% Test for literals and their (reversed) variants
% NOTE THE LIMITED USABILITY OF RO: e.g. x > y has the reverse (y > x) and
% so the reversed case (which would be an error made by the student) could
% be accepted as correct.
%
% EXAMPLE: {'vecD & vecC' 'vecD && vecC'}
% Now one of these 4 strings have to be present: 
% 1:'vecD & vecC' 2:'vecD && vecC' 3:'vecC & vecD' 4:'vecC && vecD'
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
res = runChecksOnScriptAssignment(mfilename,checkingVar,apStudentSol);

end %function
