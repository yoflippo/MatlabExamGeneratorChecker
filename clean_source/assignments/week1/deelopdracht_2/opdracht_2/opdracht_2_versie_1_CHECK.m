function res = opdracht_2_versie_1_CHECK(absPathStudentSol)

res = 0;
numtests = 6;

%% Get cleaned temporary file
[path name ext] =fileparts(absPathStudentSol);
tmp = readCleanMFile(absPathStudentSol);

if ~isempty(char(tmp))
    % Make temp file
    absPathTmp = fullfile(path,'tmp');
    makeMFileFromCells(absPathTmp,tmp);
    absPathTmp = fullfile(path,'tmp.m');
    try
        run(absPathStudentSol);
    catch
        return;
    end
    
    % Test for script specific variables and values
    if exist('som')
        if som == 11
            res = res + (1/numtests);
        end
    end
    
    if readAndFindTextInFile(absPathTmp,'+')
        res = res + (1/numtests);
    end
    if readAndFindTextInFile(absPathTmp,'5')
        res = res + (1/numtests);
    end
    if readAndFindTextInFile(absPathTmp,'6')
        res = res + (1/numtests);
    end
    if ~readAndFindTextInFile(absPathTmp,'11')
        res = res + (1/numtests);
    end
    
    ts = '5+6';
    if readAndFindTextInFile(absPathTmp,ts) || readAndFindTextInFile(absPathTmp,fliplr(ts))
        res = res + (1/numtests);
    end
    
    % Delete temp file
    delete(absPathTmp);
end
