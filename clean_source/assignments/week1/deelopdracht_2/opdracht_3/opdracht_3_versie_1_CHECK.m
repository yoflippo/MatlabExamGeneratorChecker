function res = opdracht_3_versie_1_CHECK(apStudentSol)
% % % % % 
% % % % % % default
% % % % % res = 0;
% % % % % numtests = 2;

%%========== PLACE SOLUTION IN COMMENTS HERE
%% Opdracht 3
% % - Maak een variabele aan met de naam: varTekst.
% % - Geef deze variabele de tekst: "biostatica_matlab"
%
% varTekst = 'biostatica_matlab';
%%==========

% % % % % [path name ext] = fileparts(apStudentSol);
% % % % % tmp = readCleanMFile(apStudentSol);
% % % % % 
% % % % % if ~isempty(char(tmp))
% % % % %     
% % % % %     %% Run the solution file - HAS TO WORK!!
% % % % %     try
% % % % %         run(replace(mfilename,'_CHECK','_SOL'));
% % % % %     catch
% % % % %         return;
% % % % %     end
% % % % %     
% % % % %     % Copy the correct answers, this constructions allows us to test for
% % % % %     % certain variable names easily, by using the SOLUTION file.
% % % % %     nameVar1 = 'varTekst';
% % % % %     eval(['var1ANS = ' nameVar1 ';']);
% % % % %     
% % % % %     % Remove solution variables from Workspace.
% % % % %     eval(['clear ' nameVar1 ';']);
% % % % %     
% % % % %     %% Run the original student scripts, if not working no points!
% % % % %     try
% % % % %         run(apStudentSol);
% % % % %     catch
% % % % %         return;
% % % % %     end
% % % % %     
% % % % %     %% Perform tests for certain variables
% % % % %     try
% % % % %         if isequal(var1ANS,eval(nameVar1))
% % % % %             res = res + (1/numtests);
% % % % %         end
% % % % %     catch ErrMess
% % % % %         % Test for a generated file! Could also be done by testing for Hash
% % % % %         if ~contains(apStudentSol,'versie')
% % % % %             WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
% % % % %         end
% % % % %     end
% % % % %     
% % % % %     %     try
% % % % %     %         if isequal(var1ANS,eval(nameVar2))
% % % % %     %             res = res + (1/numtests);
% % % % %     %         end
% % % % %     %     catch ErrMess
% % % % %     %         if ~contains(apStudentSol,'versie')
% % % % %     %             WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
% % % % %     %         end
% % % % %     %     end
% % % % %     
% % % % %     %     try
% % % % %     %         if isequal(var1ANS,eval(nameVar3))
% % % % %     %             res = res + (1/numtests);
% % % % %     %         end
% % % % %     %     catch ErrMess
% % % % %     %         if ~contains(apStudentSol,'versie')
% % % % %     %             WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
% % % % %     %         end
% % % % %     %     end
% % % % %     
% % % % %     %% Check for literal values and variables
% % % % %     % Make temp file
% % % % %     absPathTmp = fullfile(path,'tmp');
% % % % %     makeMFileFromCells(absPathTmp,tmp);
% % % % %     absPathTmp = fullfile(path,'tmp.m');
% % % % %     
% % % % %     %% Check for literal answers, must be present
% % % % %     literal = 'biostatica_matlab';
% % % % %     if readAndFindTextInFile(absPathTmp,literal) || readAndFindTextInFile(absPathTmp,fliplr(literal))
% % % % %         res = res + (1/numtests);
% % % % %     end
% % % % %     
% % % % %     % HAVE YOU CHECKED the variable 'numtests'???
% % % % %     if exist(absPathTmp,'file')
% % % % %         delete(absPathTmp);
% % % % %     end
% % % % % end
% % % % % 
% % % % % end %function


%% FILL string cells below to test, if you are not using them, make them empty!
% Variables that should be present in file
checkingVar.nameVars = {'varTekst'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% The number to the right of the string designates the number of times the
% string should be present.
checkingVar.literalsP = {'biostatica_matlab' 1 'varTekst' 1};
% FILL literalsA, With strings that should not be present.
checkingVar.literalsA = {};
% Reverse literals separated by spaces
% FOR EXAMPLE:
% THE STUDENT SOLUTION, e.g.:    '2+10' or  'vector1+100'
% THE REVERSED CASE:             '10+2' or  '100+vector1'
checkingVar.literalsR = {};


%% Commence the TESTING !!!
res = runChecksOnAssignment(mfilename,checkingVar,apStudentSol);

end %function