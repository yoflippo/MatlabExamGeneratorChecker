function res = opdracht_7_versie_1_CHECK(absPathStudentSol)

res = 0;
numtests = 4;

% % % %% Opdracht 7
% % % % Gegeven onderstaande script met een bijzondere vector.
% % % % Vraag m.b.v. een standaard Matlab functie de afmetingen op van de
% % % % vector 'matx'.
% % % % Deze functie geeft het aantal rijen en kolommen terug van de variabele.
% % % % Stop vervolgens de het aantal rijen in de variabele: 'rijn' en
% % % % stop daarna het aantal kolommen in de variabele 'koln'.
% % %
% % % matx = [3 5 6 7 8 5 4 5;
% % %         5 4 5 8 7 6 5 3;
% % %         3 2 3 6 5 4 3 1;];
% % % rijn = NaN;
% % % koln = NaN;


try
    run(replace(mfilename,'_CHECK','_SOL'));
catch
    return;
end

matxANT = matx;
rijnANT = rijn;
kolnANT = koln;
clear matx rijn koln;

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
    if ~readAndFindTextInFile(absPathTmp,'NaN')
        res = res + (1/numtests);
    end
    
    if isequal(rijnANT,rijn)
        if ~readAndFindTextInFile(absPathTmp,'rijn=8')
            res = res + (1/numtests);
        end
    end
    if isequal(kolnANT,koln)
        if ~readAndFindTextInFile(absPathTmp,'koln=8')
            res = res + (1/numtests);
        end
    end
    
    if readAndFindTextInFile(absPathTmp,'size(')
        res = res + (1/numtests);
    end

    delete(absPathTmp)
end

end %function
