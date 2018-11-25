% function res = opdracht_1_versie_2_CHECK(absPathStudentSol)
% res = 0;
%
% try
%     run(absPathStudentSol);
% catch
%     return;
% end
%
% % Test for script specific variables and values
% if exist('ditiseenvar')
%     if ditiseenvar == 33
%         res = 1.0;
%     end
% end

function res = opdracht_1_versie_2_CHECK(apStudentSol)

% default
res = 0;
numtests = 1;

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
    nameVar1 = 'ditiseenvar';
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
