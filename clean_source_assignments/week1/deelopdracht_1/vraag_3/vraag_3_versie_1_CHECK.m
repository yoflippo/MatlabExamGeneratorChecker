% Dit script moet een ander script nakijken en testen.
% Dit script:
%               1 - neemt aan dat het te runnen script met het 
%                   absolute path in de variabele AbsPathStudentScript staat. 
%               2 - geeft een resultaat terug in de variabele ResStudentScript. 
%                   Als alles goed is: ResStudentScript = 1. Als alles fout 
%                   is: ResStudentScript = 0. Als de helft goed is: 
%                   ResStudentScript = 0.5;

% verwijderen van variabele
A=1;B=2;C=3;D=4;
ResStudentScript = 0;
clear Antwoord

% run SOL script
run(AbsPathSOLScript)
CorrectAntwoord = Antwoord;

% run script van student
try
    run(AbsPathStudentScript);
catch
    return;
end

if CorrectAntwoord == Antwoord;
    ResStudentScript = 1;
end
