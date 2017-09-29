function res = opdracht_6_versie_1_CHECK(absPathStudentSol)

res = 0;
numtests = 7;

% % %% Opdracht 6
% % % Zie de onderstaande vectoren.
% % % 1 -   Tel bij de eerste vector de waarde 10 op en sla dit op in de
% % %       variabele vec1.
% % % 2 -   Trek van de tweede vector de waarde 10 af en sla dit op in de
% % %       variabele vec2.
% % % 3 -   Vermenigvuldig de derde vector met de waarde 10 en sla dit op
% % %       in de variabele vec3.
% %
% % vector1 = 11:18;
% % vector2 = 22:29;
% % vector3 = 33:40;
% %
% % vec1 = vector1 + 10;
% % vec2 = vector2 - 10;
% % vec3 = vector3 * 10;

try
    run(replace(mfilename,'_CHECK','_SOL'));
catch
    return;
end

vec1ANT = vec1;
vec2ANT = vec2;
vec3ANT = vec3;
clear vec1 vec2 vec3 vector1 vector2 vector3;

%% Get cleaned temporary file
[path name ext] =fileparts(absPathStudentSol);
tmp = readCleanMFile(absPathStudentSol);

%% Use the cleaned code to check for certain lines
if ~isempty(char(tmp))
    % Make temp file
    absPathTmp = fullfile(path,'tmp');
    makeMFileFromCells(absPathTmp,tmp);
    absPathTmp = fullfile(path,'tmp.m');
    
    % Run the original student scripts, if not working no points!
    try
        run(absPathStudentSol);
    catch
        return;
    end
    
    %% Perform test
    if isequal(vec1ANT,vec1)
        res = res + (1/numtests);
    end
    if isequal(vec2ANT,vec2)
        res = res + (1/numtests);
    end
    if isequal(vec3ANT,vec3)
        res = res + (1/numtests);
    end
    if readAndFindTextInFile(absPathTmp,'*10')
        res = res + (1/numtests);
    end
    if readAndFindTextInFile(absPathTmp,'+10')
        res = res + (1/numtests);
    end
    if readAndFindTextInFile(absPathTmp,'-10')
        res = res + (1/numtests);
    end
    if ~readAndFindTextInFile(absPathTmp,'NaN')
        res = res + (1/numtests);
    end
    
    delete(absPathTmp);
end

end %function
