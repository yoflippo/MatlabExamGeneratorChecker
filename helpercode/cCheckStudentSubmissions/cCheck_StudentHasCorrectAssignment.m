%% Check for each student if they have their correct assignments
% Iterate over studentfolder to check if they present mfiles contains the
% ASSIGNED files. A student could exchange assigned files with another
% student


% Load the information assigned for this week
load(fullfile(NAMEASSIGNMENTFOLDER,weekName,['assignedHashes_' weekName]));

for i = 1:length(trackStudentAssignment)
    try %!!!
        % Get hash codes of current student
        HCodeCurrStud = {trackStudentAssignment{i,2:end}};
        % Go inside student folder
        relPath = fullfile(STUDENTSUBFOLDER,weekName,trackStudentAssignment{i,1});
        cd(relPath);
        % Get hashcodes in student folder
        [HashCodeCurrStud AbsPathCodeCurrStud] = GetHashCodeOfMFilesInFolder(weekName);
        %% Check if all files are unique, to prevent copies to get more points
        if length(HashCodeCurrStud) ~= length(unique(HashCodeCurrStud))
            keyboard %pause program
            disp('Student has a copy of a file in his/hers directory');
            HashCodeCurrStud = unique(HashCodeCurrStud);
        end
        
        %% Check if the assigned hashcodes are present
        for j = 1:length(HashCodeCurrStud)
            if isempty(find(ismember(HCodeCurrStud,HashCodeCurrStud{j})))
                nameOfFile = GetFileNameFromPath(AbsPathCodeCurrStud{j});
                newNameOfCheatFile = strrep(nameOfFile,'.m','_m');
                %Get corresponding subfolder of assignment
                [a subdir] = GetPathOneLevelUp(AbsPathCodeCurrStud{j},2);
                mkdir(fullfile(weekName,FOLDERCHEAT,subdir));
                movefile(AbsPathCodeCurrStud{j},fullfile(weekName,FOLDERCHEAT, ...
                    subdir,newNameOfCheatFile));
            end
        end
        cd(BASEFOLDER)
    catch
    end
end
clear HashCodeCurrStud AbsPathCodeCurrStud