function percentage = opdracht1_versie_1_CHECK(absPathStudentFile)
%% This file expects that the _SOL and _CHECK file are in the same folder


% % % % %% Opdracht 1
% % % % % Gegeven is onderstaande code. Bereken het gemiddelde van de
% % % % % vector 'getallen' zonder gebruik te maken van de standaard
% % % % % Matlab functie mean().
% % % % %
% % % % % Deze functie moet jezelf aanroepen m.b.v. een extra script.
% % % % % Dat script mag je in dezelfde folder zetten als dit bestand.
% % % % % Dat script wordt niet nagekeken of gebruikt door ons.
% % % %
% % % % function result = gemiddelde(getallen)
% % % % result = sum(getallen)/length(getallen);
% % % % end


% Get student filename
[path file c] = fileparts(absPathStudentFile);
% Get a cleaned up version of the student code
tmp = readCleanMFile(absPathStudentFile);
% Get the check file
solution = replace(mfilename,'_CHECK','_SOL');
% Counter of correct tests
numberOfCorrect = 0;

%% Check for certain strings
% Make temp file
absPathTmp = fullfile(path,'tmp');
makeMFileFromCells(absPathTmp,tmp);
absPathTmp = fullfile(path,'tmp.m');

%% Perform Tests
series = 1:10;
if ~readAndFindTextInFile(absPathTmp,'mean')
    for z = series
        randNum = randn(1,z);
        try
            if eval([file '(randNum)']) == eval([solution '(randNum)'])
                numberOfCorrect = numberOfCorrect + 1;
            end
        catch
        end
    end
end
% Delete the tmp file
delete(absPathTmp);

%% Calculate result of student
percentage = numberOfCorrect/(length(series));