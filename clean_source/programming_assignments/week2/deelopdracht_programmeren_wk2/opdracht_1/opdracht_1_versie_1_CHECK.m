
function res = opdracht_1_versie_1_CHECK(apStudentSol)


%% FILL string cells below to test, if you are not using them, make them empty!
checkingVar.nameVars = {};
checkingVar.nameVarsOr = {};
checkingVar.literalsP = {'hello world' 1 'opdracht_1' 1 'function' 1 'function opdracht_1()' 1 'end' 1};
checkingVar.literalsA = {};
checkingVar.literalsR = {};
checkingVar.literalsO = {};
checkingVar.literalsRO = {};
checkingVar.literalsSL = {};


%% Commence the TESTING !!!
res = 0;
res = runChecksOnScriptAssignment(mfilename('fullpath'),checkingVar,apStudentSol);
close all
% % Open the cleansource variant
% edit(insertAfter(which(mfilename),['Biostatica_Auto_Matlab' filesep],['clean_source' filesep]));

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





% function res = opdracht_1_versie_1_CHECK(apStudentSol)
% res = 0;
% 
% %%========== PLACE SOLUTION IN COMMENTS HERE
% % % function opdracht_1()
% % % 'hello world'
% % % end
% %%==========
% 
% 
% % FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% % THE STUDENT SOLUTION, e.g.: '2+10' or 'vector1+100' or 'size('
% % NO SPACES ALLOWED!!
% literalsP = {'hello world' 'opdracht_1' 'function' 'function opdracht_1()' 'end'};
% % FILL literalsA, With strings that should not be present.
% % NO SPACES ALLOWED!!
% literalsA = {};
% 
% 
% 
% 
% %% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% % 1- Literals that should be present and
% % 2- Lterals that should be abscent
% % You should take cornercases in to consideration as well. So add those
% % tests as well.
% 
% 
% 
% 
% %% Commence the TESTING !!!
% [path name ext] = fileparts(apStudentSol);
% nmSolution = replace(mfilename,'_CHECK','_SOL');
% [txtCleanedStudentSolution apCleaned] = readCleanMFile('-ap',apStudentSol,'mc');
% [apClean nmClean extClean] = fileparts(apCleaned);
% %txtCleanedStudentSolution= readCleanMFile(apStudentSol);
% 
% if ~isempty(char(txtCleanedStudentSolution))
%     
%     %% Create a file from the cleaned file that contains no spaces, for easy txt comparisons
%     txtns = nospaces(apCleaned);
%     apNospaces = replace(apCleaned,'.m','_NS.m');
%     writetxtfile(apNospaces,txtns);
%     
%     %% Check for literal answers that MUST BE PRESENT
%     for nLp = 1:length(literalsP)
%         lit = literalsP{nLp};
%         lit = lit(lit ~= ' ');% Remove spaces
%         if readAndFindTextInFile(apNospaces,lit) || readAndFindTextInFile(apNospaces,fliplr(lit))
%             res = res + 1;
%         end
%     end
%     
%     %% Check for literal answers, CAN NOT BE PRESENT,  REMOVE ALL SPACES FROM LITERAL!!
%     nAbs = 0;
%     if ~isequal(res,0)
%         for nLa = 1:length(literalsA)
%             lit = literalsA{nLa};
%             %             lit = lit(lit ~= ' ');% Remove spaces
%             if readAndFindTextInFile(apNospaces,lit) || readAndFindTextInFile(apNospaces,fliplr(lit))
%                 nAbs = nAbs + 1;
%             end
%         end
%     end
%     
%     %% Calculate the result
%     res = (res-nAbs)/(length(literalsP));
%     if res < 0
%         res = 0;
%     elseif res > 1
%         res = 1;
%     end
% end
% 
% %% Delete the tmp file
% try
%     if exist(apCleaned,'file')
%         delete(apCleaned);
%     end
% catch
% end
% try
%     if exist(apNospaces,'file')
%         delete(apNospaces);
%     end
% catch
% end
% 
% end %function