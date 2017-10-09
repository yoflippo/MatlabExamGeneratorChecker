%% Get the number of points for all week assignments


apAssWk = fullfile(BASEFOLDER,NAMEASSIGNMENTFOLDER,WEEKNAME);
cd(apAssWk);
mfiles = dir(['**' filesep '*points*.m']);
if isempty(mfiles)
    error('Apparently there are NO points.m files found');
end

pointsPerAssignment = zeros(1,length(mfiles));
clear nameOfAssignment
nameOfAssignment = [];
for i = 1:length(mfiles)
    try
        dr = mfiles(i).folder;
        run(fullfile(dr,mfiles(i).name));
        % Get assignment name + name of folder directly above it
        tmp = extractAfter(dr,'week');
        tmp= extractAfter(tmp,filesep);
        nameOfAssignment{i} = tmp;     
        pointsPerAssignment(i) = deelpunten;
    catch err
        disp(err);
        error(mfilename);
    end
end