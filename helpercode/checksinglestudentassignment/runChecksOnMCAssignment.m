function [ res ] = runChecksOnMCAssignment( apStudentSol, apFileName )
% This script has to check and test another script
% It gives a result in the variable ResStudentScript. Perfect grade = 1.
% Totally wrong result = 0.

% Generate the default Answers
[txtClean] = readCleanMFile('-ap',apStudentSol,'-MULCHOICE');
% Create the result variable for students
res = 0;
% Only use last line
txtClean = txtClean(end);
if ~isempty(char(txtClean)) && ~contains(char(txtClean),'NAN')
    clear Antwoord
    % run SOL script and save the correct answer
    [txtSolClean] = readCleanMFile('-ap',[replace(apFileName,'_CHECK','_SOL') '.m'],'-MULCHOICE');
    txtSolClean = txtSolClean(end);
    correctAnswer = extractAfter(txtSolClean,'=');
    studentAnswer = extractAfter(txtClean,'=');
    
    % multiple choice checking is easy...
    if  contains(correctAnswer,studentAnswer)
        res = 1;
    end
end

end%f

