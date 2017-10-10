%% Check if the HASH-codes in every m-file of the students is intact


% Get Hash of original assignment folder AND save it in MAT-file
assCurrWk = fullfile(BASEFOLDER,NAMEASSIGNMENTFOLDER,weekName);
dicWithHashes = GetDictionaryWithHashAndLocation(assCurrWk,SOLPOSTFIX);
save(fullfile(assCurrWk,'dicHashesAbsPath.mat'),'dicWithHashes')
hashCodes = keys(dicWithHashes);

% Iterate through student directories and read the hash strings from their
% files.
oldPath = pwd;
cd(subWkFolder);
mfiles = dir(['**' filesep '*.m']);
cd(oldPath)
% If a certain file is manipulated put it in a folder GEEN_PUNTEN
for nSAss = 1:length(mfiles)
    % Test for files that we use but should not be checked
    blTestIfCorrectFile = true;
    for j = 1:length(OTHERFILESINSTUDENTFOLDER)
        if isequal(OTHERFILESINSTUDENTFOLDER{j},mfiles(nSAss).name)
            blTestIfCorrectFile = false;
            break;
        end
    end
    % Test for student made files
    if ~contains(mfiles(nSAss).name,'vraag') && ~contains(mfiles(nSAss).name,'opdracht')
        blTestIfCorrectFile = false;
    end
    % Get hashcode from current mfiles
    if blTestIfCorrectFile
        currFileAbsPath = fullfile(mfiles(nSAss).folder,mfiles(nSAss).name);
        [p subdir] = GetPathOneLevelUp(currFileAbsPath,2);
        try
            currHash = GetHashCodeFromMFile(currFileAbsPath);
            % Check if hash if present in dictionary
            dicWithHashes(currHash);
        catch
            % Move file in a folder in the variable ADJUSTEDHASH
            mkdir(fullfile(p,ADJUSTEDHASH,subdir));
            % replace point of filename with underscore, so it won't be
            % recognised in other scripts as an m-file.
            nameOfFile = strrep(mfiles(nSAss).name,'.','_');
            movefile(currFileAbsPath,fullfile(p,ADJUSTEDHASH,subdir,nameOfFile));
            cd(oldPath);
        end
    end
end