%% This files creates/checks every assignment and file and has to be combined
%with the performAll script.
warning off
rmpath(genpath(fileparts(mfilename('fullpath'))));
warning on
addpath(genpath('helpercode'));
% % % % % % % % % % % % % % % % % % InitAll

%% Specific student assignments that need to be checked
cd(con.STUDENTSUBFOLDER)
apSubmitted = pwd;
postfxZipped = '_unzipped';
cd([weekName postfxZipped]);
des = fullfile(apSubmitted,weekName);
files = dirmf('.zip');
for n = 1:length(files)
    try
        %Create path
        src = fullfile(files(n).folder,files(n).name);
        movefile(src,des);
    catch
    end
end

cd(con.BASEFOLDER)


% % % %% Specific student assignments that need to be checked
% % % studwk =       {{'weekName' 'Biostatica Matlab week 4 eindopdracht_17051339_attempt_2017-12-09-13-41-31_Biostatica_ToSubmit_17051339.zip'}};
% % % 
% % % cd(con.STUDENTSUBFOLDER)
% % % apSubmitted = pwd;
% % % postfxZipped = '_unzipped';
% % % 
% % % for n = 1:length(studwk)
% % %     try
% % %         %Create path
% % %         src = fullfile(apSubmitted,[studwk{n}{1} postfxZipped],studwk{n}{2});
% % %         des = fullfile(apSubmitted,studwk{n}{1});
% % %         movefile(src,des);
% % %     catch
% % %     end
% % % end
% % % 
% % % cd(con.BASEFOLDER)

