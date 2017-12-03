function res = opdracht_6_versie1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % t = 0:0.01:10;
% % % % % % % % % % % vector1 = sin(t);
% % % % % % % % % % % vector2 = cos(t);
% % % % % % % % % % % vector3 = t.^3;
% % % % % % % % % % % 
% % % % % % % % % % % for n = 1:length(t)
% % % % % % % % % % %     resultaat(n) = vector1(n)+vector2(n)+vector3(n);
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
[res,num] = runChecksOnScriptAssignment(mfilename,checkingVar,apStudentSol);

end %function