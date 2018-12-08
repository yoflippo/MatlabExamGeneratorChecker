function apFinalAssDir = copyThesesToCleanSourceAssignment(con,apMCFiles,WeekNames)
%% Copy the theses and programming assignments to clean_source 'bonus_assignment'
% directory.

cd(apMCFiles)
try %BAD PROGRAMMING: not a clean function due to exams vs. bonus assignments
    currBonusAss = con.BONUSASSNAME(con.BONUSASSNUMBER);
    apCleanTheses = fullfile(apMCFiles,currBonusAss);
    %  'C:\Users\yoflippo\Dropbox\BT\03_LESSEN\20_MATLAB\MATLAB_TOETS\clean_source\gen_mc\generated_theses\BonusOpdracht2'
    apCleanBonusAss = fullfile(con.BASEFOLDER,con.DIRCLEANSRC,con.DIRCLEANSRC_FINALASS,currBonusAss);
    %'C:\Users\yoflippo\Dropbox\BT\03_LESSEN\20_MATLAB\MATLAB_TOETS\clean_source\bonus_assignments\BonusOpdracht2'
catch
    apCleanTheses = fullfile(apMCFiles,'exam');
    apCleanBonusAss = fullfile(con.BASEFOLDER,con.DIRCLEANSRC,con.DIRCLEANSRC_FINALASS);
end


removeShitFromDir(apCleanBonusAss)
if ~exist(apCleanBonusAss,'dir')
    mkdir(apCleanBonusAss)
end
copyfiles(apCleanTheses,apCleanBonusAss);

apCleanProgrammingAss = fullfile(con.BASEFOLDER,con.DIRCLEANSRC,con.DIRCLEANSRC_PROGASS);

for nW = 1:length(WeekNames)
    apCurrProgrammAss = fullfile(apCleanProgrammingAss,WeekNames{nW});
    cd(apCleanBonusAss);
    copyfiles(apCurrProgrammAss,apCleanBonusAss)
end
cd(apMCFiles)

%% Now copy the clean bonus assignment to the assignment place
try
    apFinalAssDir = fullfile(con.BASEFOLDER, con.NAMEASSIGNMENTFOLDER,currBonusAss);
catch
    apFinalAssDir = con.DIRASSIGNMENTS;
end
removeShitFromDir(apFinalAssDir)
if ~exist(apFinalAssDir,'dir')
    mkdir(apFinalAssDir)
end
copyfiles(apCleanBonusAss,apFinalAssDir)
