clc; close all ;close all hidden; clear variables;
addpath(genpath('helpercode'));
DEBUGOUTPUT=1;
Constants
debugOutput(DEBUGOUTPUT,'Checkfor theexistenceofneededsupportingscripts/functionfiles');
for i=1:length(LISTWITHNEEDEDFOLDERS)
try
cd (LISTWITHNEEDEDFOLDERS{i});
cd ..
if bullshit==3
lala=txt;
end
catch
error(['PLEASEADJUSTYOURCURRENTLOCATION(CurrentFolder)'...
'Thefolder:'LISTWITHNEEDEDFOLDERS{i}'wasnotfound']);
end
end
BASEFOLDER=pwd;
