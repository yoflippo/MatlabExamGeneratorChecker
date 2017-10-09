function res = opdracht_6_versie_1_CHECK(apStudentSol)
res = 0;

%%========== PLACE SOLUTION IN COMMENTS HERE
% % % % vector1 = 11:18;
% % % % vector2 = 22:29;
% % % % vector3 = 33:40;
% % % % 
% % % % vec1 = vector1 + 10;
% % % % vec2 = vector2 - 10;
% % % % vec3 = vector3 * 10;
%%==========

%% FILL nameVars WITH VARIABLES PRESENT IN SOLUTION FILE THAT THE STUDENT
% SHOULD CHANGE!
nameVars = {'vec1' 'vec2' 'vec3'};
% FILL literalsP, FOR INSTANCE WITH OPERATIONS THAT SHOULD BE PRESENT IN
% THE STUDENT SOLUTION, e.g.: '2+10' or 'vector1+100' or 'size('
% NO SPACES ALLOWED!!
literalsP = {'vector1+10' 'vector2-10' 'vector3*10'};
% FILL literalsA, With strings that should not be present.
% NO SPACES ALLOWED!!
literalsA = {'NaN'};




%% PLEASE THINK CAREFULLY ABOUT THE TESTING OF:
% 1- Variables with specific values and
% 2- Literals that should be present and
% 3- Lterals that should be abscent
% You should take cornercases in to consideration as well. So add those
% tests as well.




%% Commence the TESTING !!!
[path name ext] = fileparts(apStudentSol);
[txtCleanedStudentSolution apCleaned] = readCleanMFile('-ap',apStudentSol,'mc');
%txtCleanedStudentSolution= readCleanMFile(apStudentSol);

if ~isempty(char(txtCleanedStudentSolution))
    %% Run the solution file - HAS TO WORK!!
    try
        run(replace(mfilename,'_CHECK','_SOL'));
    catch
        return;
    end
    
    % Get values and variables from the SOLUTION file
    for nV = 1:length(nameVars)
        % Save the variables in the SOLUTION FILE
        eval(['var' num2str(nV) 'ANS = ' nameVars{nV} ';']);
        % Remove solution variables from Workspace.
        eval(['clear ' nameVars{nV}  ';']);
    end
    
    %% Run the cleaned student script, if not working no points!
    try
        if exist(apCleaned,'file')
            run(apCleaned);
            txtns = nospaces(apCleaned);
            apNospaces = replace(apCleaned,'.m','_NS.m');
        else
            run(apStudentSol);
            txtns = nospaces(apStudentSol);
            apNospaces = replace(apStudentSol,'.m','_NS.m');
        end
        writetxtfile(apNospaces,txtns);
    catch
        delete(apCleaned);
        delete(apNospaces);
        return;
    end
    
    %% Perform tests for certain variables in the Workspace
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
    
    
    %% Check for literal answers that MUST BE PRESENT
    for nLp = 1:length(literalsP)
        % Remove spaces
        lit = literalsP{nLp};
        if readAndFindTextInFile(apNospaces,lit) || readAndFindTextInFile(apNospaces,fliplr(lit))
            res = res + 1;
        end
    end
    
    %% Check for literal answers, CAN NOT BE PRESENT,  REMOVE ALL SPACES FROM LITERAL!!
    nAbs = 0;
    if ~isequal(res,0)
        for nLa = 1:length(literalsA)
            % Remove spaces
            lit = literalsA{nLa};
            if readAndFindTextInFile(apNospaces,lit) || readAndFindTextInFile(apNospaces,fliplr(lit))
                nAbs = nAbs + 1;
            end
        end
    end
    
    %% Delete the tmp file
    if exist(apCleaned,'file')
        delete(apCleaned);
    end   
    if exist(apNospaces,'file')
        delete(apNospaces);
    end
    

        
    %% Calculate the result
    res = (res-nAbs)/(length(literalsP)+length(nameVars));
    if res < 0
        res = 0;
    elseif res > 1
        res = 1;
    end
end
