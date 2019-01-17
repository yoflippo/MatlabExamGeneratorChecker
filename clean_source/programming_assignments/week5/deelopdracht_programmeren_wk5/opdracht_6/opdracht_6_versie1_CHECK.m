function res = opdracht_6_versie1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % t = 0:0.01:10;
% % % % % % % vector1 = sin(t);
% % % % % % % vector2 = cos(t);
% % % % % % % vector3 = t.^3;
% % % % % % % 
% % % % % % % for n = 1:length(t)
% % % % % % %     resultaat(n) = vector1(n)+vector2(n)+vector3(n);
% % % % % % % end
% % % % % % % plot(t,resultaat)
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!
checkingVar.nameVars = {'resultaat'};
checkingVar.literalsP = {'vector1(' 1 'vector2(' 1 'vector3(' 1 '+' 2 'resultaat(' 1 '=' 5 'plot(t,resultaat)' 1};
checkingVar.literalsA = {'NaN' 1 'vector1 + vector2 + vector3' 2};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};


%% Commence the TESTING !!!
res = 0;
[res,num] = runChecksOnScriptAssignment(mfilename('fullpath'),checkingVar,apStudentSol);
close all;
end %function