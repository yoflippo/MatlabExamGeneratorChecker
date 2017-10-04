function res = opdracht_XXX_versie_X_CHECK(apStudentSol)
res = 0;

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
    % This part must run without errors!
    nameVars = {'vec1' 'vec2' 'vec3'};   %<======== FILL THIS CELL
    
    for nV = 1:length(nameVars)
        % Save the variables in the SOLUTION FILE
        eval(['var' num2str(nV) 'ANS = ' nameVars{nV} ';']);
        % Remove solution variables from Workspace.
        eval(['clear ' nameVars{nV}  ';']);
    end
    
    
    %% Run the original student scripts, if not working no points!
    try
        run(apStudentSol);
    catch
        return;
    end
    
    %% Perform tests for certain variables
    for nV = 1:length(nameVars)
        try
            eval(['blTest = isequal(var' num2str(nV) 'ANS, ' nameVars{nV} ');']);
            if blTest
                res = res + 1;
            end
        catch ErrMess
            % Test for a generated file! Could also be done by testing for Hash
            if ~contains(apStudentSol,'versie')
                WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
            end
        end
    end
    
    %% Check for literal values and variables
    % Make temp file
    absPathTmp = fullfile(path,'tmp');
    makeMFileFromCells(absPathTmp,tmp);
    absPathTmp = fullfile(path,'tmp.m');
    
    %% Check for literal answers, must be present
    literalsP = {'XXX' 'XXX' 'XXX'};    %<======== FILL THIS CELL
    for nLp = 1:length(literalsP)
        if readAndFindTextInFile(absPathTmp,literalsP{nLp}) || readAndFindTextInFile(absPathTmp,fliplr(literalsP{nLp}))
            res = res + 1;
        end
    end
    
    
    %% Check for literal answers, CAN NOT BE PRESENT,  REMOVE ALL SPACES FROM LITERAL!!
    literalsA = {'NaN'};    %<======== FILL THIS CELL
    for nLa = 1:length(literalsA)
        if ~readAndFindTextInFile(absPathTmp,literalsA{nLa}) && ~readAndFindTextInFile(absPathTmp,fliplr(literalsA{nLa}))
            res = res + 1;
        end
    end
    
    %% Delete the tmp file
    if exist(absPathTmp,'file')
        delete(absPathTmp);
    end
end
res = res/(length(literalsA)+length(literalsP)+length(nameVars));
end %function