function copyMCToCleanSourceAssignment(con,apMCFiles,WeekNames)
%% Copy the theses and programming assignments to clean_source 'bonus_assignment'
% directory.

cd(apMCFiles)
currBonusAss = con.BONUSASSNAME(con.BONUSASSNUMBER);
apCleanTheses = fullfile(apMCFiles,currBonusAss);
apCleanBonusAss = fullfile(con.BASEFOLDER,con.DIRCLEANSRC,con.DIRCLEANSRC_BONUSASS,currBonusAss);

removeShitFromDir(apCleanBonusAss)
if ~exist(apCleanBonusAss,'dir')
    mkdir(apCleanBonusAss)
end
copyfiles(apCleanTheses,apCleanBonusAss);

apCleanProgrammingAss = fullfile(con.BASEFOLDER,con.DIRCLEANSRC,con.DIRCLEANSRC_PROGASS);
currBonusAssWeeks = WeekNames;

for nW = 1:length(WeekNames)
    apCurrProgrammAss = fullfile(apCleanProgrammingAss,WeekNames{nW});
    cd(apCleanBonusAss);
    copyfiles(apCurrProgrammAss,apCleanBonusAss)
end
cd(apMCFiles)

%% Now copy the clean bonus assignment to the assignment place
apFinalAssDir = fullfile(con.BASEFOLDER, con.NAMEASSIGNMENTFOLDER,currBonusAss);
removeShitFromDir(apFinalAssDir)
if ~exist(apFinalAssDir,'dir')
    mkdir(apFinalAssDir)
end
copyfiles(apCleanBonusAss,apFinalAssDir)
