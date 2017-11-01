function res = opdracht_1_versie_1_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % % % % %% Opdracht 1
% % % % % % % % Maak een matrix A aan: A =    2  56   3
% % % % % % % %                               8  9    23
% % % % % % % %                               81 7    67
% % % % % % % % Stop de eerste kolomvector van matrix A in een variabele genaamd 'B'. Je
% % % % % % % % mag geen getallen toekennen aan B. Je moet een Matlab commando gebruiken
% % % % % % % % om de kolomvector van A toe te kennen aan variabele B.
% % % % % % % 
% % % % % % % A = [2 56 3; 8 9 23; 81 7 67];
% % % % % % % B = A(:,1);
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'A' 'B'};
checkingVar.literalsP = {'B = A(:,1)' 1 ':' 1 'A(:,' 1 };
checkingVar.literalsA = {'NaN' 'A(1,:)' 2};
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
res = runChecksOnScriptAssignment(mfilename,checkingVar,apStudentSol);

end %function
