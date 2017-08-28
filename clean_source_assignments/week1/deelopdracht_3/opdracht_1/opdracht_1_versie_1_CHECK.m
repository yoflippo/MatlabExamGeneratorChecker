% dit script neemt aan dat het te runnen script met het absolute path in de
% variabele AbsPathStudentScript staat.
numberOfCorrect = 0;

try
    if opdracht_1_versie_1_SOL(2) == 4
        numberOfCorrect = numberOfCorrect + 1;
    end
catch
end

try
    if opdracht_1_versie_1_SOL(0) == 0
        numberOfCorrect = numberOfCorrect + 1;
    end
catch
end

try
    if opdracht_1_versie_1_SOL(-1) == 1
        numberOfCorrect = numberOfCorrect + 1;
    end
catch
end

ResStudentScript = numberOfCorrect/3;