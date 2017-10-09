function percentage = opdracht2_versie_1_CHECK(absPathStudentFile)
%% This file expects that the _SOL and _CHECK file are in the same folder

% get student filename
[path file c] = fileparts(absPathStudentFile);
% Get complete name of the SOLUTION file
solution = replace(mfilename,'_CHECK','_SOL');
percentage = 0;

%% Test 1: test als input nul is
% Voer de solution van Bart uit en stop het resultaat in de variabele
% SOLUTION
eval(['SOLUTION = ' solution '(0)']);

% Voer de solution van de student uit
eval(['SOLUTIONSTUDENT = ' file '(0)']);

if SOLUTION == SOLUTIONSTUDENT
    percentage = percentage + 0.25;
end

%% test 2 
