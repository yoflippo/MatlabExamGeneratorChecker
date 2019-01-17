close all; clear all; clc;
cd(fileparts(mfilename('fullpath')))
unzip('vraag_1.zip','vraag_1');
%% EXPECT ERRORS
try
    try
        readAndFindTextInFiles('EXT','.m');
        assert(false,'should give an error');
    catch
        assert(true,'should give an error');
    end
    
    try
        readAndFindTextInFiles('asdfasd','.m');
        assert(false,'should give an error');
    catch
        assert(true,'should give an error');
    end
    
    try
        readAndFindTextInFiles(123);
        assert(false,'should give an error');
    catch
        assert(true,'should give an error');
    end
    
    
    %% EXPECT CORRECT BEHAVIOR
    try
        r = readAndFindTextInFiles('EXT','.m','ASKUSER');
        assert(~isempty(r),'1 should give a result')
    catch
    end
    
    pathOfThisFile = erase(mfilename('fullpath'),mfilename);
    pathOfTestData = fullfile(pathOfThisFile,'vraag_1');
    
    % test a file in the testdata folder
    r = readAndFindTextInFiles('EXT','.m','sS','empty','abspath',pathOfTestData);
    assert(~isempty(r),'1 should give a result')
    
    % test a file in the testdata folder
    r = readAndFindTextInFiles('EXT','.m','sS','61c94c63f5bd64da7455bcffaf075b23','abspath',pathOfTestData);
    assert(~isempty(r),'1 should give a result')
    
    % test a file in the testdata folder
    try
        r = readAndFindTextInFiles('sS','61c94c63f5bd64da7455bcffaf075b23','abspath',pathOfTestData);
        assert(false,'should give an error');
    catch
        assert(true);
    end
    
    % test a file in the testdata folder
    r = readAndFindTextInFiles('sS','61c94c63f5bd64da7455bcffaf075b23','abspath',pathOfTestData,'Ext','.m');
    assert(~isempty(r),'1 should give a result')
    
    %% Test if user needs to select path
    r = readAndFindTextInFiles('ASKUSER','EXT','.m','SS',['mfilename(''fullpath'')'],'EIF','SBP');
    assert(~isempty(r),'1 should give a result')
    
    
    %% Edit of m-files
    disp('check if file is opened')
    % edit file that is found
    r = readAndFindTextInFiles('sS','empty','abspath',pathOfTestData,'Ext','.m','EIF');
    assert(~isempty(r),'1 should give a result')
    
    %% Check if breakpoint is set
    disp('Check if breakpoint is set')
    % edit file that is found
    r = readAndFindTextInFiles('sS','Antwoord_Vraag1 = NaN;','abspath',pathOfTestData,'Ext','.m','EIF','sbp');
    assert(~isempty(r),'1 should give a result')
catch
    removeShitFromDir('vraag_1');
    rmdir('vraag_1');
end
disp([mfilename ': FINISHED!!']);