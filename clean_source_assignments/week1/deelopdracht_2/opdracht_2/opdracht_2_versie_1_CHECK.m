% Dit script moet een ander script nakijken en testen.
% Dit script:
%               1 - neemt aan dat het te runnen script met het 
%                   absolute path in de variabele AbsPathStudentScript staat. 
%               2 - geeft een resultaat terug in de variabele ResStudentScript. 
%                   Als alles goed is: ResStudentScript = 1. Als alles fout 
%                   is: ResStudentScript = 0. Als de helft goed is: 
%                   ResStudentScript = 0.5;

% verwijderen van variabele
clear ikbeneenvariabele

% dit script neemt aan dat het te runnen script met het absolute path in de
% variabele AbsPathStudentScript staat.

try
    run(AbsPathStudentScript);
catch
    % het is fout gegaan. Een script dat niet runt krijgt geen punten.
    ResStudentScript = 0;
    return;
end

if exist('ikbeneenvariabele')
    ResStudentScript = 0.5;
end
if ikbeneenvariabele == 22
    ResStudentScript = 1.0;
end