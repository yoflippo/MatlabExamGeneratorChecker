function [grade] = gradeExamFiles(examInfo)
resT = 0;
points = sum([examInfo.points]);

for nS = 1:length(examInfo)
    apSOL = examInfo(nS).apSOL;
    
    apCHECK = replace(apSOL,'_SOL','_CHECK');
    [~,nameCheckFunction] = fileparts(apCHECK)
    res = feval(nameCheckFunction,apSOL);
    if res>0
        open(apSOL)
        keyboard
        HIER GAAT NOG IETS FOUT
    end
    resT = res + resT;
end

grade = 1 + ((res*9)/points);

end

