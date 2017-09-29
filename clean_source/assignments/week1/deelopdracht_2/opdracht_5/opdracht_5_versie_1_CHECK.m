function res = opdracht_5_versie_1_CHECK(absPathStudentSol)

res = 0;
numtests = 4;

% % % %% Opdracht 5
% % % % Maak een vector genaamd 'tijdas' aan.
% % % % Zorg dat de vector wordt gevuld met de tijd van 0 tot en met 100 seconden.
% % % % Zorg dat de vector met tijdstappen van 0.25 seconde wordt gevuld.
% % % % VB: 0, 0.25, 0.5, 0.75, 1.0, 1.25...
% % % % Test je script of het werkt.
% % %
% % % tijdas = [0:0.25:100];

var1 = 'tijdas';
ta = 0:0.25:100;
var2 = length(ta);

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
    if exist(var1,'var')
        l = eval(['length(' var1 ');']);
        if l == var2
            res = res + (1/numtests);
        end
        if eval([var1 '(end) == ta(end)'])
            res = res + (1/numtests);
        end
        if eval([var1 '(1) == ta(1)'])
            res = res + (1/numtests);
        end
        if eval([var1 '(66) == ta(66)'])
            res = res + (1/numtests);
        end
    end
    
    delete(absPathTmp);
end

end %function
