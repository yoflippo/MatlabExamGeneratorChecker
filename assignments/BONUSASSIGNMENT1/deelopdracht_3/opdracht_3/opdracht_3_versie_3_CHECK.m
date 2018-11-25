function res = opdracht_3_versie_3_CHECK(absPathStudentSol)

res = 0;

% % % %% Opdracht 1
% % % % - Maak een variabele aan met de naam: varStukTekst.
% % % % - Geef deze variabele de tekst: "deelopdracht2"
% % % % Test je script of het werkt.
% % % 
% % % varStukTekst = 'deelopdracht2';

txt = 'deelopdracht2';

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
    if exist('varStukTekst','var')
        if varStukTekst == txt
            res = res + 1;
        elseif lower(varStukTekst) == lower(txt)
            res = 0.5;
        end
    else
        % lower
        if exist('varstuktekst','var')
            if varstuktekst == txt
                res = 0.5;
            end
        end
    end
    
end

end %function
