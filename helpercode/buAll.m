%% Zip all files in case a deletion goes wrong
% % d = datetimetxt();
% % warning off;
% % apBU = fullfile(GetPathOneLevelUp(pwd),'Biostatica_Auto_Matlab_BU');
% % mkdirIf(apBU);
% % addpath(genpath(apBU));
% % zip(fullfile(apBU,['zip_all_' d '.zip']),con.BASEFOLDER);
% % rmpath(genpath(apBU));
% % warning on;
function buAll(apBasefolder,extraString)

dos(['start WinRaR a -r -m5 -mt16 ' [apBasefolder '_BU'] ...
    filesep datetimetxt() extraString ' ' apBasefolder filesep '*.*']);
