close all; clear all; clc;

%% EXPECT ERRORS
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