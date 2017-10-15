close all; clear all; clc;
ap.ThisFile = fileparts(mfilename('fullpath'));
cd(ap.ThisFile);
nm.ThisFile = mfilename;
nm.Zip = replace(nm.ThisFile,'_test','_data.zip');
nm.TestData = 'templateData';
unzip(nm.Zip,'templateData');

try
    %% EXPECT CORRECT BEHAVIOR
    source = fullfile(ap.ThisFile,'templateData');
    des = fullfile(ap.ThisFile,'vraag_1');
    removeShitFromDir(des);
    copyfiles(source,des)
    des = fullfile(ap.ThisFile,'vraag_1','vraag_1_46ff614bffcfdd07653f632390cfd664_.m');
    % test a file in the testdata folder
    [bool linenumber txt] = readAndFindTextInFile(des,'Voorbeeld antwoord:');
    assert(bool,'1 should give a result')
    assert(linenumber==23,'1 should give a result')
    assert(~readAndFindTextInFile(des,'Voorbeeld antwoord :'),'1 should give a result')
catch
    removeShitFromDir(nm.TestData);
    rmdir(nm.TestData) ;
    removeShitFromDir(fullfile(ap.ThisFile,'vraag_1'));
    rmdir(fullfile(ap.ThisFile,'vraag_1')) ;
end