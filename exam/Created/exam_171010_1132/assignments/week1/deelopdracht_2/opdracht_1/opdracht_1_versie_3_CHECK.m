function res = opdracht_1_versie_3_CHECK(apStudentSol)

% default
res = 0;
numtests = 1;


% % % %% Opdracht 1
% % % % Maak een variabele aan met de naam: variable.
% % % % Geef de variabele de waarde 'tekstineenstring';
% % % variable = 'tekstineenstring';

[path name ext] = fileparts(apStudentSol);
tmp = readCleanMFile(apStudentSol);

%% Use the cleaned code to check for certain lines
if ~isempty(char(tmp))
   
    %% Run the solution file - HAS TO WORK!!
    try
        run(replace(mfilename,'_CHECK','_SOL'));
    catch
        return;
    end
    
    % Copy the correct answers
    nameVar1 = 'variable';
    eval(['var1ANS = ' nameVar1 ';']);
    
    % Remove solution variables from Workspace.
    eval(['clear ' nameVar1 ';']);
    
    %% Run the original student scripts, if not working no points!
    try
        run(apStudentSol);
    catch
        return;
    end
    
    %% Perform tests for certain variables
    try
        if isequal(var1ANS,eval(nameVar1))
            res = res + (1/numtests);
        end
    catch ErrMess
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
        end
    end

end

end %function
