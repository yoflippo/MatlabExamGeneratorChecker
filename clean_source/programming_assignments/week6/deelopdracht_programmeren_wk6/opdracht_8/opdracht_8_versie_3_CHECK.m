function res = opdracht_8_versie_2_CHECK(apStudentSol)


%%========== PLACE SOLUTION IN COMMENTS HERE


% % % % % % % balVast = logical([1 1 1 1 1 0 0 0 0 0 0 0 0 1 1 1]);
% % % % % % % Pos = [30 31 33 35 37 36 34 32 32 28 26 24 22 22 23 24];
% % % % % % % 
% % % % % % % % oplossing:
% % % % % % % d = diff(Pos);
% % % % % % % naarVoren = d > 0;
% % % % % % % balVast2 = balVast(1:end-1);
% % % % % % % vastNaarVoren = (balVast2 == 1 & naarVoren ==1) 


% % % % % % % balVast = logical([1 1 1 1 1 0 0 0 0 0 0 0 0 1 1 1]);
% % % % % % % Pos = [30 31 33 35 37 36 34 32 32 28 26 24 22 22 23 24];
% % % % % % % 
% % % % % % % for i = 1: length(balVast)-1
% % % % % % %     if (balVast(i)== logical(1)) && (Pos(i+1) > Pos(i)) 
% % % % % % %         vastNaarVoren(i) = logical(1); 
% % % % % % %     else 
% % % % % % %         vastNaarVoren(i) = logical(0);
% % % % % % %     end 
% % % % % % % end 
%%==========


%% FILL string cells below to test, if you are not using them, make them empty!

checkingVar.nameVars = {'vastNaarVoren' };
checkingVar.literalsP = { };
checkingVar.literalsA = {};
checkingVar.literalsR = {};
checkingVar.literalsO = {{'&' '&&'} {'for' 'diff('} {'<' '>'}};
checkingVar.literalsRO = {};
checkingVar.literalsSL = {};


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