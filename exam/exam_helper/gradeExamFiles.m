function [grade] = gradeExamFiles(examInfo)
resT = 0;
points = sum([examInfo.points]);

for nS = 1:length(examInfo)
    apSOL = examInfo(nS).apSOL;
    
    apCHECK = replace(apSOL,'_SOL','_CHECK');
    [path,nameCheckFunction] = fileparts(apCHECK);
    addpath(genpath(path));
    res = feval(nameCheckFunction,apSOL);
    if res==0
        open(apSOL)
        keyboard
    end
    resT = res + resT; MAAL AANTAL PUNTEN
    rmpath(genpath(path));
end

grade = 1 + ((res*9)/points);

end

