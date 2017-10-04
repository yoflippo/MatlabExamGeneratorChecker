%% Zip all files in case a deletion goes wrong
d = char(datetime('now'));
d = strrep(d,':','_'); d = strrep(d,' ','_'); d = strrep(d,'-','_');
warning off;
apBU = fullfile(GetPathOneLevelUp(pwd),'Biostatica_Auto_Matlab_BU');
mkdirIf(apBU);
addpath(genpath(apBU));
zip(fullfile(apBU,['zip_all_' d '.zip']),BASEFOLDER)
rmpath(genpath(apBU));
warning on;

