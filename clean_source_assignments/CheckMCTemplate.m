% This script has to check and test another script
% It 
%               -   Give a result in the variable ResStudentScript. Perfect
%                   grade = 1. Totally wrong result = 0.

% Load the project constants
Constants 
% Generate the default Answers
A=1;B=2;C=3;D=4;
% Create the result variable for students
ResStudentScript = 0;
clear Antwoord
% run SOL script and save the correct answer
run(replace(mfilename,CHECKPOSTFIX,SOLPOSTFIX))
CorrectAntwoord = Antwoord;
clear Antwoord
% run student script
try
    run(AbsPathStudentScript);
catch
    return;
end
% multiple choice checking is easy...
if CorrectAntwoord == Antwoord;
    ResStudentScript = 1;
end
