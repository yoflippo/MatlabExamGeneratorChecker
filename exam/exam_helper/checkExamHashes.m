function checkExamHashes()


%% Get the hashes of current files
mfiles = dirmf();
cnt = 1;
for i = 1:length(mfiles)
    try
        absPath = fullfile(mfiles(i).folder,mfiles(i).name);
        hash = GetHashCodeFromMFile(absPath);
        if ~isempty(hash)
            HashCodes{cnt} = hash;
            AbsPathHashCodes{cnt} = absPath;
            cnt = cnt + 1;
        end
    catch
    end
end

%% Find non-unique files and remove them
[~,ia,ic] = unique(HashCodes,'first');
nonunique = setdiff(ic,ia);
for nu = 1:length(nonunique)
    nonun_file = AbsPathHashCodes(nonunique(nu));
    nonun_file = nonun_file{1};
    mkdirIf('KOPIE');
    renamed = replace(nonun_file,'.m','_m');
    movefile(nonun_file,renamed);
    movefile(renamed,'KOPIE');
end

end

