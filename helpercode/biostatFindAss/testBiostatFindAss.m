close all; clear all; clc;
[ap.thisFile, nm.CurrFile] = fileparts(mfilename('fullpath'));
cd(ap.thisFile)

%% Copy data to testfolder
con = ConstantsClass;

nmAss1 = [con.NMBONUSASSIGNMENTDIR num2str(1)];
apAss1 = fullfile(con.DIRASSIGNMENTS,nmAss1);

%% find bonus assignment theses
files = dir([apAss1 filesep '**'] )
thesesAss = contains({files.name}',con.TYPEASSIGNMENTSDUTCH{1});
progAss = contains({files.name}',con.TYPEASSIGNMENTSDUTCH{2});

%% make ap from one of the theses
apThesis1 = find(thesesAss