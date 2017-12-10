%% This files creates/checks every assignment and file
warning off
rmpath(genpath(fileparts(mfilename('fullpath'))));
warning on
addpath(genpath('helpercode'));
InitAll

%% Specific student assignments that need to be checked
studwk =       {{'week3' 'Biostatica Matlab week 3 eindopdracht_17086620_attempt_2017-12-04-23-57-21_Biostatica_ToSubmit_17086620.zip'}};

cd(con.STUDENTSUBFOLDER)
apSubmitted = pwd;
postfxZipped = '_unzipped';

for n = 1:length(studwk)
    try
        %Create path
        src = fullfile(apSubmitted,[studwk{n}{1} postfxZipped],studwk{n}{2});
        des = fullfile(apSubmitted,studwk{n}{1});
        movefile(src,des);
    catch
    end
end

cd(con.BASEFOLDER)

