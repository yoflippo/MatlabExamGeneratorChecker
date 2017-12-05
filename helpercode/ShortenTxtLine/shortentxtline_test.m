clear all
apThisFile = fileparts(mfilename('fullpath'));
nmTmpDir = 'tmp';
apTmpDir = fullfile(apThisFile,nmTmpDir);
mkdirIf(nmTmpDir)
copyfiles(fullfile(apThisFile,'testdata'),apTmpDir)

nmFile = fullfile(apTmpDir,'vraag_4.m');
txt = readTxtFile(nmFile)

newtxt = shortentxtline(txt,80);


removeShitFromDir(apTmpDir)
rmdir(apTmpDir)