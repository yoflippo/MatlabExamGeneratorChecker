clear variables; close all;
load('Workspace.mat');

try
    rmdir(ap.Submitted,'s')
catch
end
mkdir(ap.Submitted);

copyfiles(ap.SUBMITTEDUNZIPPED,ap.Submitted);

% find exam script
t = dir('checkExam_*');
run(t.name)