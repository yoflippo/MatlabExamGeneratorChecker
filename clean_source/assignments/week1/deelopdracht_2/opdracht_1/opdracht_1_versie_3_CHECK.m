function res = opdracht_1_versie_2_CHECK(absPathStudentSol)
res = 0;

try
    run(absPathStudentSol);
catch
    return;
end

% Test for script specific variables and values
if exist('variable')
    if variable == 'tekstineenstring'
        res = 1.0;
    elseif variable == "tekstineenstring"
        res = 1.0;
    end
end
