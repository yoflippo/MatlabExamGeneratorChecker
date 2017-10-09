function res = opdracht_6_versie_2_CHECK(apStudentSol)

% default
res = 0;
numtests = 6;
q = char(39);
%%========== PLACE SOLUTION IN COMMENTS HERE
%% Opdracht 6
% % % % Zie de onderstaande vectoren. 
% % % % 1 -   Tel bij de eerste vector de waarde 13 op en sla dit op in de 
% % % %       variabele vector1.
% % % % 2 -   Trek van de tweede vector de waarde 13 af en sla dit op in de 
% % % %       variabele vector2.
% % % % 3 -   Vermenigvuldig de derde vector met de waarde 13 en sla dit op
% % % %       in de variabele vector3.
% % % 
% % % vec1 = 20:0.1:22;
% % % vec2 = 10:29;
% % % vec3 = 33:40;
% % % 
% % % vector1 = vec1+13;
% % % vector2 = vec2-13;
% % % vector3 = vec3*13;
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
    nameVars = {'vector1' 'vector2' 'vector3'};
    
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
    literalsP = {'vec3*13' 'vec2-13' 'vec1+13'};
    for nLp = 1:length(literalsP)
        if readAndFindTextInFile(absPathTmp,literalsP{nLp}) || readAndFindTextInFile(absPathTmp,fliplr(literalsP{nLp}))
            res = res + 1;
        end
    end
    
    %% Check for literal answers, CAN NOT BE PRESENT,  REMOVE ALL SPACES FROM LITERAL!!
    literalsA = {'NaN'};  %<------- FILL THIS CELL
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
