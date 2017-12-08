%% This files creates/checks every assignment and file
clear all;
warning off
rmpath(genpath(fileparts(mfilename('fullpath'))));
warning on
addpath(genpath('helpercode'));
InitAll

%% Specific student assignments that need to be checked
studwk =       {{'week2' 'Biostatica Matlab week 2 eindopdracht_16073312_attempt_2017-11-26-19-08-09_Biostatica_ToSubmit_16073312.zip'}
    {'week2' 'Biostatica Matlab week 2 eindopdracht_17041813_attempt_2017-11-24-15-26-19_Biostatica_ToSubmit_17041813.zip'}
    {'week3' 'Biostatica Matlab week 3 eindopdracht_16073312_attempt_2017-12-04-18-43-02_Biostatica_ToSubmit_16073312.zip'}
    {'week3' 'Biostatica Matlab week 3 eindopdracht_17041813_attempt_2017-12-04-18-55-09_Biostatica_ToSubmit_17041813.zip'}
    {'week3' 'Biostatica Matlab week 3 eindopdracht_17079160_attempt_2017-12-04-16-54-22_Biostatica_ToSubmit_17079160.zip'}};

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

