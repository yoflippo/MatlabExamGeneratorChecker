function percentage = opdracht2_versie_2_CHECK(absPathStudentFile)
%% This file expects that the _SOL and _CHECK file are in the same folder


% get student filename
[path file c] = fileparts(absPathStudentFile);

solution = replace(mfilename,'_CHECK','_SOL');
numberOfCorrect = 0;
series = -30:2:30;
for z = series
    try
        if eval([file '(z)']) == eval([solution '(z)'])
            numberOfCorrect = numberOfCorrect + 1;
        end
    catch
    end
end

percentage = numberOfCorrect/length(series);