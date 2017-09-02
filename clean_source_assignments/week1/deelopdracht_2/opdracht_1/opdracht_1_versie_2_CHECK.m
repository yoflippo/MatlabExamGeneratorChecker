% Dit script moet een ander script nakijken en testen.
% Dit script:
%               1 - dit script neemt aan dat het te runnen script met het
%                   absolute path in de variabele AbsPathStudentScript staat.
%               2 - geeft een resultaat terug in de variabele
%               ResStudentScript. Als alles goed is: ResStudentScript = 1.
%               Als alles fout is: ResStudentScript = 0. Als de helft goed
%               is: ResStudentScript = 0.5;

% verwijderen van variabele
clear ditiseenvar
ResStudentScript = 0;
% dit script neemt aan dat het te runnen script met het absolute path in de
% variabele AbsPathStudentScript staat.

try
    run(AbsPathStudentScript);
catch
    % het is fout gegaan. Een script dat niet runt krijgt geen punten.
    return;
end

if exist('ikbeneenvariabele')
    if ikbeneenvariabele == 33
        ResStudentScript = 1.0;
    end
end