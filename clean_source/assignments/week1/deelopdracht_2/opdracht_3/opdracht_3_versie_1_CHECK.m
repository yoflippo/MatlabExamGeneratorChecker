function res = opdracht_3_versie_1_CHECK(absPathStudentSol)

res = 0;

% % % %% Opdracht 3
% % % % - Maak een variabele aan met de naam: varTekst.
% % % % - Geef deze variabele de tekst: "biostatica_matlab"
% % % % Test je script of het werkt.
% % %
% % % varTekst = 'biostatica_matlab';

txt = 'biostatica_matlab';

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
    if exist('varTekst','var')
        if varTekst == txt
            res = res + 1;
        elseif lower(varTekst) == lower(txt)
            res = 0.5;
        end
    else
        % lower
        if exist('vartekst','var')
            if vartekst == txt
                res = 0.5;
            end
        end
    end 
end

end %function
