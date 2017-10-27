
numOld = 5;
nameO = ['opdracht_' num2str(numOld)];
mfiles = dirmf(nameO);

numNew = str2double(mfiles(1).folder(end));
nameN = ['opdracht_' num2str(numNew)];
%% rename
for nF = 1:length(mfiles)
    
    currFile = fullfile(mfiles(nF).folder,mfiles(nF).name);
    newFile = fullfile(mfiles(nF).folder,replace(mfiles(nF).name,nameO,nameN));
    movefile(currFile,newFile); 
    
    %% rename information in file
    replaceVraagOpdracht(newFile,numNew);
end