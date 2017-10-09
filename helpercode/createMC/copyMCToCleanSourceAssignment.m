function copyMCToCleanSourceAssignment(baseFolder,apFin,WeekNames)

%% Get deelopdracht_x folderS
apMCFiles = fullfile(baseFolder,'clean_source','gen_mc','generated_questions');
cd(apMCFiles);
ass =[];
for wk = 1:length(WeekNames)
    cd(WeekNames{wk})
    ass{wk} = getFolders(pwd);
    cd ..
end

%% Copy files clean_source -> assignments
for nWk = 1:length(WeekNames)
    currWkName = WeekNames{nWk};
    try
        apClnSrc = fullfile(baseFolder,'clean_source','assignments',currWkName);
        apFin2 = fullfile(apFin,currWkName);
        removeShitFromDir(fullfile(apFin2))
        mkdirIf(apFin2);
        copyfiles(apClnSrc,apFin2);
        % Check the files in each folder
        cd(apClnSrc)
        nFilesClnSrc = dirmf();
        cd(apFin2)
        nFilesFin = dirmf();
        if ~isequal(length(nFilesFin), length(nFilesClnSrc))
            error('Files not copied correctly');
        end
    catch errMess
        disp(errMess);
    end
end
fclose('all');
cd(baseFolder);
end