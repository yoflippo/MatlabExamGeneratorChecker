function res = opdracht_1_versie_1_CHECK(apStudentSol)

% default
res = 0;
numtests = 1;


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
    var1ANS = ikbeneenvariabele;
    
    % Remove solution variables from Workspace.
    clear ikbeneenvariabele
    
    %% Run the original student scripts, if not working no points!
    try
        run(apStudentSol);
    catch
        return;
    end
    
    %% Perform tests for certain variables
    try
        if isequal(var1ANS,ikbeneenvariabele)
            res = res + (1/numtests);
        end
    catch ErrMess
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
        end
    end
    
    %     try
    %         if isequal(varANS,var)
    %             res = res + (1/numtests);
    %         end
    %     catch ErrMess
    %         WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
    %     end
    
    
    %% Delete temporary file
    delete(absPathTmp);
end

end %function
