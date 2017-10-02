%% Get the number of points for all week assignments


relPathWeekFolderUnique = fullfile(NAMEASSIGNMENTFOLDER,WEEKNAME);
mfiles = readFilesInFolder(relPathWeekFolderUnique,'.m');

relevantMFiles = strfind(mfiles,'points.m');
if isempty(relevantMFiles)
    error('Apparently there are NO points.m files found');
end
mfiles = mfiles(~cellfun('isempty',relevantMFiles));
pointsPerAssignment = zeros(1,length(mfiles));
nameOfAssignment = [];
for i = 1:length(mfiles)
    tmp = mfiles(i);
    tmp = tmp{1};
    run(tmp(1:end-2));
    % Get name of assignment and save it
    foundSlashes = strfind(tmp,filesep);
    nameOfAssignment{i} = tmp(foundSlashes(end-2)+1:foundSlashes(end)-1);
    pointsPerAssignment(i) = deelpunten;
end