function res = opdracht_1_versie_1_CHECK(absPathStudentSol)
res = 0;

try
    run(absPathStudentSol);
catch
    return;
end

% Test for script specific variables and values
if exist('ikbeneenvariabele')
    if ikbeneenvariabele == 22
        res = 1.0;
    end
end
