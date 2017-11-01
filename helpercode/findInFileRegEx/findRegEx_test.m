clear all; clc;

%% Create some helper variables
nmData = replace(mfilename,'_test','_data.m');
nmDataEmpty = replace(mfilename,'_test','_data_empty.m');
apThisFile = fileparts(mfilename('fullpath'));
nmCopy = 'copy.m';
apCopy = fullfile(apThisFile,nmCopy);
apCopyEmpty = fullfile(apThisFile,nmCopy);

%% Copy the data
copyfile(nmData,apCopy)

%% Words and the number of times they are present in file
testwords0times = {'aappel' 'tering' 'Tering'};
testwords1times = {'clc;' 'fiets' 'blauw' 'sleutel' };
testwords2times = {'try' 'lala'};
testwords3times = {'bullshit'};

%% TEST: txt multiple times
txt = readTxtFile(apCopy);

for nT = 0:3
    for nW = 1:length(eval(['testwords' num2str(nT) 'times']))
        [num, ind] = findRegEx(txt,eval(['testwords' num2str(nT) 'times{nW}']));
        assert(num==eval(num2str(nT)));
    end
end

clear txt;


%% TEST: spaces removed
txt = nospaces(apCopy);

for nT = 0:2
    for nW = 1:length(eval(['testwords' num2str(nT) 'times']))
        [num, ind] = findRegEx(txt,eval(['testwords' num2str(nT) 'times{nW}']));
        try
            assert(num==eval(num2str(nT)));
        catch
            disp([ 'PROBLEM WITH:' eval(['testwords' num2str(nT) 'times{nW}'])])
        end
    end
end

clear txt;


%% TEST: read cleaned files
txt = readCleanMFile(apCopy);

for nT = 0:2
    for nW = 1:length(eval(['testwords' num2str(nT) 'times']))
        [num, ind] = findRegEx(txt,eval(['testwords' num2str(nT) 'times{nW}']));
        try
            assert(num==eval(num2str(nT)));
        catch
            disp([ 'PROBLEM WITH:' eval(['testwords' num2str(nT) 'times{nW}'])])
        end
    end
end

clear txt;



delete(apCopy);

%% TEST: empty file
copyfile(nmDataEmpty,apCopy)
txt = readTxtFile(apCopy);
for nT = 0:2
    for nW = 1:length(eval(['testwords' num2str(nT) 'times']))
        [num, ind] = findRegEx(txt,eval(['testwords' num2str(nT) 'times{nW}']));
        assert(num==0);
    end
end
delete(apCopy);

%%
disp([mfilename ': is working']);

%% Error