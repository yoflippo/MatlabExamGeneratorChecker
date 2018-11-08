function CountNumberOfFALSE_TRUE()

%% Get path of output folder and empty it
pathOfThisFile = erase(mfilename('fullpath'),mfilename);

weeks = {'week1' 'week2' 'week3' 'week4'};
totFalse = 0;
totTrue = 0;
for nWk = 1:length(weeks)
    try
        cd(fullfile(pathOfThisFile,'source_theses',weeks{nWk}));
        nFalse = length(dirmf('FALSE'));
        nTrue = length(dirmf('TRUE'));
        disp([weeks{nWk} ': TRUE = ' num2str(nTrue) ' | FALSE = ' num2str(nFalse)])
        cd(pathOfThisFile);
    catch
    end
    totFalse = totFalse + nFalse;
    totTrue = totTrue + nTrue;
end
disp(['TOTAAL: TRUE = ' num2str(totTrue) ' | FALSE = ' num2str(totFalse)])
end