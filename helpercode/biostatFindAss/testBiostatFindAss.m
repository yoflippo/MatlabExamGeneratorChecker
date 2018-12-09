close all; clear all; clc;
[ap.thisFile, nm.CurrFile] = fileparts(mfilename('fullpath'));
cd(ap.thisFile)

%% Copy data to testfolder
con = ConstantsClass;
con.BONUSASSNUMBER = 1;

%% find assignment theses
nmAss1 = [con.NMBONUSASSIGNMENTDIR num2str(1)];
apAss1 = fullfile(con.AP_ASSIGNMENTS,nmAss1);

bonusAss.raw = dir([apAss1 filesep '**'] );
bonusAss.idx.Theses = contains({bonusAss.raw.name}',con.TYPEASSIGNMENTSDUTCH{1});
bonusAss.idx.Prog = contains({bonusAss.raw.name}',con.TYPEASSIGNMENTSDUTCH{2});
bonusAss.theses = bonusAss.raw(bonusAss.idx.Theses);
bonusAss.prog = bonusAss.raw(bonusAss.idx.Prog);

%% find clean_source stuff
apAssTheses = fullfile(con.BASEFOLDER,con.DIRCLEANSRC,con.DIRTHESES,con.DIRTHESES_CLEANSRC);
cleanAss.raw = dir([apAssTheses filesep '**'] );
cleanAss.idx.Theses = contains({cleanAss.raw.name}',con.PREFIX_THESES);
cleanAss.theses = cleanAss.raw(cleanAss.idx.Theses);

apAssProg = fullfile(con.BASEFOLDER,con.DIRCLEANSRC,con.DIRCLEANSRC_PROGASS);
cleanAss.rawprog = dir([apAssProg filesep '**'] );
cleanAss.idx.prog = contains({cleanAss.rawprog.name}',con.TYPEASSIGNMENTSDUTCH{2});
cleanAss.prog = cleanAss.rawprog(cleanAss.idx.prog);


%% make ap from one of the theses
if ~isempty(bonusAss.idx.Theses) && ~isempty(bonusAss.idx.Prog) && ...
        ~isempty(cleanAss.idx.Theses) && ~isempty(cleanAss.idx.prog)
    
    
    
    
    
    
    
    
end

cd ..
rmpath(genpath(pwd));