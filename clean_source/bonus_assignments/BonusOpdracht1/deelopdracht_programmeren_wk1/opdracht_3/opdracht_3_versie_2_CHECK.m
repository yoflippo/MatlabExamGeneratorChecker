function res = opdracht_3_versie_2_CHECK(absPathStudentSol)

res = 0;

% % % %% Opdracht 1
% % % % - Maak een variabele aan met de naam: varString.
% % % % - Geef deze variabele de tekst: 'MatlabIsLeuk'
% % % % Test je script of het werkt.
% % %
% % % varString = 'MatlabIsLeuk';

txt = 'MatlabIsLeuk';

%% Get cleaned temporary file
[path name ext] =fileparts(absPathStudentSol);
tmp = readCleanMFile(absPathStudentSol);

%% Use the cleaned code to check for certain lines
if ~isempty(char(tmp))
    
    % Run the original student scripts, if not working no points!
    try
        run(absPathStudentSol);
    catch
        return;
    end
    
    %% Perform test
    if exist('varString','var')
        if varString == txt
            res = res + 1;
        elseif lower(varString) == lower(txt)
            res = 0.5;
        end
    else
        % lower
        if exist('varstring','var')
            if varstring == txt
                res = 0.5;
            end
        end
    end
    
end

end %function
