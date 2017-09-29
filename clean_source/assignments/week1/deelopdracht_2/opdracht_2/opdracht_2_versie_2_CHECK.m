function res = opdracht_2_versie_2_CHECK(absPathStudentSol)

res = 0;
numtests = 6;

% pompidom = 11+22;

%% Get cleaned temporary file
[path name ext] =fileparts(absPathStudentSol);
tmp = readCleanMFile(absPathStudentSol);

%% Use the cleaned code to check for certain lines
if ~isempty(char(tmp))
    % Make temp file
    absPathTmp = fullfile(path,'tmp');
    makeMFileFromCells(absPathTmp,tmp);
    absPathTmp = fullfile(path,'tmp.m');
    
    %% Run the original student scripts, if not working no points!
    try
        run(absPathStudentSol);
    catch
        return;
    end
    
    %% Perform specific string test on the code, which lines should exists? Which NOT!?
    
    % Test for script specific variables and values
    if exist('pompidom')
        if pompidom == (11+22)
            res = res + (1/numtests);
        end
    end
    
    if readAndFindTextInFile(absPathTmp,'+')
        res = res + (1/numtests);
    end
    if readAndFindTextInFile(absPathTmp,'22')
        res = res + (1/numtests);
    end
    if readAndFindTextInFile(absPathTmp,'11')
        res = res + (1/numtests);
    end
    if ~readAndFindTextInFile(absPathTmp,(11+22))
        res = res + (1/numtests);
    end
    
    ts = '11+22';
    if readAndFindTextInFile(absPathTmp,ts) || readAndFindTextInFile(absPathTmp,fliplr(ts))
        res = res + (1/numtests);
    end
    

    %% Delete temp file
    delete(absPathTmp);
end
