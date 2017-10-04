function res = opdracht_XXX_versie_X_CHECK(apStudentSol)

% default
res = 0;
numtests = XXX;

%%========== PLACE SOLUTION IN COMMENTS HERE

%%==========

[path name ext] = fileparts(apStudentSol);
tmp = readCleanMFile(apStudentSol);

if ~isempty(char(tmp))
    
    %% Run the solution file - HAS TO WORK!!
    try
        run(replace(mfilename,'_CHECK','_SOL'));
    catch
        return;
    end
    
    % Copy the correct answers, this constructions allows us to test for
    % certain variable names easily, by using the SOLUTION file.
    nameVar1 = '';
    nameVar2 = '';
    nameVar3 = '';
    eval(['var1ANS = ' nameVar1 ';']);
    eval(['var2ANS = ' nameVar2 ';']);
    eval(['var3ANS = ' nameVar3 ';']);
    
    % Remove solution variables from Workspace.
    eval(['clear ' nameVar1 ';']);
    eval(['clear ' nameVar2 ';']);
    eval(['clear ' nameVar3 ';']);
    
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
        % Test for a generated file! Could also be done by testing for Hash
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
        end
    end
    
    %     try
    %         if isequal(var2ANS,eval(nameVar2))
    %             res = res + (1/numtests);
    %         end
    %     catch ErrMess
    %         if ~contains(apStudentSol,'versie')
    %             WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
    %         end
    %     end
    
    %     try
    %         if isequal(var3ANS,eval(nameVar3))
    %             res = res + (1/numtests);
    %         end
    %     catch ErrMess
    %         if ~contains(apStudentSol,'versie')
    %             WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
    %         end
    %     end
    
    %% Check for literal values and variables
    % Make temp file
    absPathTmp = fullfile(path,'tmp');
    makeMFileFromCells(absPathTmp,tmp);
    absPathTmp = fullfile(path,'tmp.m');
    
    %     %% Check for literal answers that must be present,  REMOVE ALL SPACES FROM LITERAL!!
    %     literal = 'XXX';
    %     if readAndFindTextInFile(absPathTmp,literal) || readAndFindTextInFile(absPathTmp,fliplr(literal))
    %         res = res + (1/numtests);
    %     end
    %
    %% Check for literal answers, CAN NOT BE PRESENT,  REMOVE ALL SPACES FROM LITERAL!!
    literal = 'NaN';
    if ~readAndFindTextInFile(absPathTmp,literal) && ~readAndFindTextInFile(absPathTmp,fliplr(literal))
        res = res + (1/numtests);
    end
    
    %     %% Check for literal answers, CAN NOT BE PRESENT,  REMOVE ALL SPACES FROM LITERAL!!
    %     literal = 'txtWithoutSpaces';
    %     if ~readAndFindTextInFile(absPathTmp,literal) && ~readAndFindTextInFile(absPathTmp,fliplr(literal))
    %         res = res + (1/numtests);
    %     end
    
    %% HAVE YOU CHECKED the variable 'numtests'???
    if exist(absPathTmp,'file')
        delete(absPathTmp);
    end
end

end %function