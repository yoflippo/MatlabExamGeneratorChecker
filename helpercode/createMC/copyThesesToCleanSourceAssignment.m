function apFinalAssDir = copyThesesToCleanSourceAssignment(con,apMCFiles,WeekNames)
%% Copy the theses and programming assignments to clean_source 'bonus_assignment'
% directory and the final 'assignment' folder in the rootfolder.

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
disp([mfilename ': Copy files to ' apCleanBonusAss]);
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
    apFinalAssDir = con.AP_ASSIGNMENTS;
end
removeShitFromDir(apFinalAssDir)
if ~exist(apFinalAssDir,'dir')
    mkdir(apFinalAssDir)
end
disp([mfilename ': Copy files to ' apFinalAssDir]);
copyfiles(apCleanBonusAss,apFinalAssDir)

%% In case of the exam, copy files to exam director
if contains(apCleanTheses,'exam')
    disp([mfilename ': Copy files to ' con.Assignments]);
    copyfiles(apCleanBonusAss,con.Assignments)
end