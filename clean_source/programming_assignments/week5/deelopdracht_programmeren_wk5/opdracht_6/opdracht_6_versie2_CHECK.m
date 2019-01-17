function res = opdracht_6_versie1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % %% Opdracht 6
% % % % % % % % % % % % Gebruik een for-lus om de onderstaande vectoren element-voor-element bij
% % % % % % % % % % % % elkaar op te tellen plus de index van de vectoren.
% % % % % % % % % % % % 
% % % % % % % % % % % % Bijvoorbeeld
% % % % % % % % % % % % element 1 van: vector 1 + vector 2 + vector 3 + 1
% % % % % % % % % % % % element 1 van: vector 1 + vector 2 + vector 3 + 8
% % % % % % % % % % % % etc.
% % % % % % % % % % % %
% % % % % % % % % % % % Stop de opgetelde elementen in een vector genaamd 'resultaat'. 
% % % % % % % % % % % % Plot als laatste de vector resultaat (op de x-as komt de variabele 't').
% % % % % % % % % % % 
% % % % % % % % % % % t = 2:0.05:8;
% % % % % % % % % % % vector1 = sin(t);
% % % % % % % % % % % vector2 = cos(t*2);
% % % % % % % % % % % vector3 = t.^2;
% % % % % % % % % % % 
% % % % % % % % % % % for n = 1:length(t)
% % % % % % % % % % %     resultaat(n) = vector1(n)+vector2(n)+vector3(n)+n;
% % % % % % % % % % % end
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'resultaat'};
checkingVar.literalsP = {'vector1(' 1 'vector2(' 1 'vector3(' 1 '+' 2 'resultaat(' 1 '=' 5};
checkingVar.literalsA = {'NaN' 1 'vector1 + vector2 + vector3' 1 'vector2 + vector3 + vector1' 1 'vector3 + vector1 + vector1' 1};
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
res = runChecksOnScriptAssignment(mfilename('fullpath'),checkingVar,apStudentSol);


end %function