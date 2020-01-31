function ChangeMCCheck(  )
%% Expect to be in directory with the dirs
dirs = dirmf('MultipleChoice');


newtxt(2,1) = "res = runChecksOnMCAssignment(absPathStudentSol,mfilename('fullpath'));"
newtxt(3,1) = "end"

for nMC = 1:length(dirs)
    cd(dirs(nMC).folder);
    cfiles = dirmf('Check');
    for ncf = 1:length(cfiles)
        apfile = fullfile(cfiles(ncf).folder,cfiles(ncf).name);
        txt = readTxtFile(apfile);
        newtxt(1,1) = txt(1,1);
        delete(apfile);
        writetxtfile(apfile,newtxt);
    end
end

end

