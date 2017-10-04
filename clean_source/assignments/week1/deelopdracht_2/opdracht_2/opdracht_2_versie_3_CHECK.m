function res = opdracht_2_versie_3_CHECK(apStudentSol)

% default
res = 0;
numtests = 2;

%%========== PLACE SOLUTION IN COMMENTS HERE
%% Opdracht 2
% % Maak een variabele aan met de naam: boeya.
% % Voer een berekening uit waarbij je de waardes 7 en 13 bij elkaar
% % optelt.
% 
% boeya = 7 + 13;

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
    nameVar1 = 'boeya';
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
        % Test for a generated file! Could also be done by testing for Hash
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
        end
    end
    
    %     try
    %         if isequal(var1ANS,eval(nameVar2))
    %             res = res + (1/numtests);
    %         end
    %     catch ErrMess
    %         if ~contains(apStudentSol,'versie')
    %             WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
    %         end
    %     end
    
    %     try
    %         if isequal(var1ANS,eval(nameVar3))
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
    
        %% Check for literal answers, must be present
        literal = '7+13';
        if readAndFindTextInFile(absPathTmp,literal) || readAndFindTextInFile(absPathTmp,fliplr(literal))
            res = res + (1/numtests);
        end
    
%         %% Check for literal answers, CAN NOT BE PRESENT
%         literal = 'XXX';
%         if ~readAndFindTextInFile(absPathTmp,literal) && ~readAndFindTextInFile(absPathTmp,fliplr(literal))
%             res = res + (1/numtests);
%         end
    
    % HAVE YOU CHECKED the variable 'numtests'???
        %% Delete temporary file
        delete(absPathTmp);
end

end %function