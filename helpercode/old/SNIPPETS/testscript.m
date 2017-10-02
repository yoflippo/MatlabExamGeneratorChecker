function res = opdracht_XXX_versie_X_CHECK(apStudentSol)

% default
res = 0;
numtests = XXX;


%% Get cleaned temporary file
[path name ext] = fileparts(apStudentSol);
tmp = readCleanMFile(apStudentSol);

%% Use the cleaned code to check for certain lines
if ~isempty(char(tmp))
    % Make temp file
    absPathTmp = fullfile(path,'tmp');
    makeMFileFromCells(absPathTmp,tmp);
    absPathTmp = fullfile(path,'tmp.m');
    
    %% Run the solution file
    try
        run(replace(mfilename,'_CHECK','_SOL'));
    catch
        return;
    end
    
    % Copy the correct answers
    var1ANS = var1;
    var2ANS = var2;
    var3ANS = var3;
    
    % Remove solution variables from Workspace.
    clear var1XXX var2XXX var3XXX
    
    %% Run the original student scripts, if not working no points!
    try
        run(apStudentSol);
    catch
        return;
    end
    
    %% Perform tests for certain variables
    try
        if isequal(var1ANS,XXX)
            res = res + (1/numtests);
        end
    catch ErrMess
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
        end
    end
    
    %     try
    %         if isequal(var2ANS,XXX)
    %             res = res + (1/numtests);
    %         end
    %     catch ErrMess
    %         if ~contains(apStudentSol,'versie')
    %             WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
    %         end
    %     end
    
    
    
    %     %% Check for literal answer, may not be present
    %     if ~readAndFindTextInFile(absPathTmp,varANS)
    %         res = res + (1/numtests);
    %     end
    
    %% Delete temporary file
    delete(absPathTmp);
end

end %function
