function res = opdracht_1_versie_2_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % % % % % A = [2 56 3; 8 9 23; 81 7 67];
% % % % % % % % % % % B = A(3,:);
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

% Variables that should be present in file and that should be compared to
% the SOLUTION:
checkingVar.nameVars = {'A' 'B'};
checkingVar.literalsP = {'B = ' 1 'A(3' 1};
checkingVar.literalsA = {'NaN' 'A(:,3)' 2};
checkingVar.literalsR = {};
checkingVar.literalsO = {{'A(3,1:end)' 'A(3,:)' 'A(3,1:3)'}};
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
