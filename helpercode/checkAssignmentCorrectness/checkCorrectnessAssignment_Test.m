%% Get files with their absolute paths
mfiles = dir('**/*.m');
% Get files with hashcode
mfilesWithHash = [];
HashOfmfiles = [];
mfiles_check = [];
mfiles_sol = [];
cntFile = 1;
for i = 1:length(mfiles)
    try
        absPath = fullfile(mfiles(i).folder,mfiles(i).name);
        Hash = GetHashCodeFromMFile(absPath);
        HashOfmfiles{cntFile} = Hash;
        mfilesWithHash{cntFile} = absPath;
        mfiles_check{cntFile} = replace(absPath,'_.m','_CHECK.m');
        mfiles_sol{cntFile} = replace(absPath,'_.m','_SOL.m');
        cntFile = cntFile + 1;
    catch
    end
end

%% Check the files
for i = 1:length(mfiles_check)
    checkCorrectnessAssignment(mfiles_sol{i},mfiles_check{i});
end

