function CountNumberOfFALSE_TRUE()

% Get path of output folder and empty it
pathOfThisFile = erase(mfilename('fullpath'),mfilename);

totFalse = 0;
totTrue = 0;
for nWk = 1:8
    currWeek = ['week' num2str(nWk)];
    try
        cd(fullfile(pathOfThisFile,'source_theses',currWeek));
        nFalse = length(dirmf('FALSE'));
        nTrue = length(dirmf('TRUE'));
        disp([currWeek ': TRUE = ' num2str(nTrue) ' | FALSE = ' num2str(nFalse)])
        cd(pathOfThisFile);
    catch
    end
    totFalse = totFalse + nFalse;
    totTrue = totTrue + nTrue;
end
disp(['TOTAAL: TRUE = ' num2str(totTrue) ' | FALSE = ' num2str(totFalse)])
end