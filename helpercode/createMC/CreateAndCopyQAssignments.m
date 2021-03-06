function CreateAndCopyQAssignments(con,x)

fclose('all'); %Close files that could be opened


apCleanSourceRoot = fullfile(con.BASEFOLDER,con.DIRCLEANSRC,con.DIRTHESES);
if nargin >1 % Ugly programming: for the creation of exam
    %% Get path of output folder for a certain week X and empty it
    cd(apCleanSourceRoot);
    apSourceTheses = fullfile(apCleanSourceRoot,'source_theses');
    apGeneratedTheses = replace(apSourceTheses,'source_theses','generated_theses');
    
    %% Iterate over each available week
    weekNames = con.WEEKFOLDERS;
    apCleanAssignmentDir = fullfile(apGeneratedTheses,'exam');
    
else % For the creation of BONUS assignments
    currentBonusAssignment = con.BONUSASSNUMBER;
    
    %% Get path of output folder for a certain week X and empty it
    cd(apCleanSourceRoot);
    apSourceTheses = fullfile(apCleanSourceRoot,'source_theses');
    apGeneratedTheses = replace(apSourceTheses,'source_theses','generated_theses');
    
    %% Test the generated MC-files
    cd(apCleanSourceRoot);
    CountNumberOfFALSE_TRUE;
    
    %% Iterate over each available week
    tmpWeeks = con.BONUSASSIGNMENTS{currentBonusAssignment};
    for nW = 1:length(tmpWeeks)
        weekNames{nW} = ['week' num2str(tmpWeeks(nW))];
    end
    
    nmBonusAssDir = [con.NMBONUSASSIGNMENTDIR num2str(currentBonusAssignment)];
    apCleanAssignmentDir = fullfile(apGeneratedTheses,nmBonusAssDir);
end

removeShitFromDir(apCleanAssignmentDir)
if ~exist(apCleanAssignmentDir,'dir')
    mkdir(apCleanAssignmentDir)
end

%% Make a empty directories (for placement of thesisses)
for nWk = 1:length(weekNames)
    apDesMC = apCleanAssignmentDir;
    apSrcThesis = fullfile(apSourceTheses,weekNames{nWk});
    copyfiles(apSrcThesis,apDesMC);
    % Remove the thesis files
    emptyDirRecursiveMFiles(apDesMC);
end


for nWk = 1:length(weekNames)
    %% Get absolute paths of theses files with there respective answers
    folders = GetDeepestFolders(fullfile(apSourceTheses,weekNames{nWk}));
    theses = {zeros(1,length(folders))};
    TPA = theses;
    for nDirs = 1:length(folders)
        cd(folders{nDirs});
        % get the theses files
        theses{nDirs} = dir(['**' filesep '*th_*.m']);
        % make a cell array of theses path with their solution
        % loop through theses
        for nT = 1:length(theses{nDirs})
            tmpName = theses{1,nDirs}(nT).name;
            tmpPath = theses{1,nDirs}(nT).folder;
            if contains(tmpName,'TRUE')
                tmpAnswer = true;
            else
                tmpAnswer = false;
            end
            TPA{nDirs,nT} = {fullfile(tmpPath,tmpName),tmpAnswer,length(theses{nDirs})};
        end
        cd(apCleanSourceRoot);
    end
    apTemplateCheck = fullfile(apCleanSourceRoot,'TemplateCheckMC.m');
    
    %% Browse the subfolder of weekXXX
    for nDirs = 1:length(folders)
        clc;
        disp([mfilename ': ' num2str(nDirs) ' of ' num2str(length(folders)) ' folders processed of ' weekNames{nWk}]);
        numberOfThesesFiles = TPA{nDirs,1}{3};
        currentFilePath =  TPA{nDirs,1}{1};
        
        % generate final destination path of current question, by inserting the
        % output folder
        apDestination = GetPathOneLevelUp(currentFilePath);
        apDestination = replace(apDestination,'source_theses','generated_theses');
        try %in case of generating an exam this does not exist
            % BAD programming: due to generation of bonus assignment and
            % the exam
            apDestination = replace(apDestination,weekNames{nWk},nmBonusAssDir);
        catch
            apDestination = replace(apDestination,weekNames{nWk},'exam');
        end
        % copy the points.m file (containing the number of points of mc-q) and
        % copy the TypeOfAssignment... file, so the CopyTheMultipleChoice..m
        % file works)
        fn = 'points.m';
        copyfile(fullfile(apCleanSourceRoot,fn),fullfile(apDestination,fn));
        fn = 'TypeOfAssignment_Multiplechoice.m';
        copyfile(fullfile(apCleanSourceRoot,fn),fullfile(apDestination,fn));
        
        %% Generate thesisses in random order
        % % % %         randomFileIndexes = randperm(numberOfThesesFiles);
        randomFileIndexes = 1:numberOfThesesFiles;
        
        %% Combine to make one question
        % read header file line and give it the right question number
        headerTxt = ReadLineOfFile(fullfile(apCleanSourceRoot,'th_header.m'));
        questionNumber = GetPathOneLevelUp(currentFilePath);
        questionNumber = extractAfter(questionNumber(end-3:end),'_');
        headerTxt = replace(headerTxt,'xxx',questionNumber);
        
        %% Generate Questions
        nVersionMC = 0;
        
        for nMostIndices = 1:numberOfThesesFiles
            cnt = 1;
            finalTxt = cell(13,1);
            finalTxt{cnt,1} = headerTxt; cnt = cnt + 1;
            finalTxt{cnt,1} = '%';       cnt = cnt + 1; %add empty line
            
            % theses1
            currentIndex = randomFileIndexes(1);
            randomFileIndexes = randomFileIndexes(2:end);
            ansTheses1 = TPA{nDirs,currentIndex}{2};
            theses1 = char(readTxtFile(TPA{nDirs,currentIndex}{1}));
            if isempty(theses1)
                open(TPA{nDirs,currentIndex}{1})
                error([mfilename ': something wrong with file and opened it']);
            end
            preambleTheses1 = '% ';
            txtTheses1{1} = [preambleTheses1 theses1(1,:)];
            finalTxt{cnt,1} = txtTheses1{1}; cnt = cnt + 1;
            
            % add the right number of tabs to rest of text
            nLinesOfTheses1 = size(theses1); nLinesOfTheses1 = nLinesOfTheses1(1);
            if nLinesOfTheses1 > 1
                for otherLines = 2:nLinesOfTheses1
                    txtTheses1{otherLines} = ['% ' theses1(otherLines,:)];
                    finalTxt{cnt,1} = txtTheses1{otherLines}; cnt = cnt + 1;
                end
            end
            txtTheses1{nLinesOfTheses1+1} = '%'; %line between theses
            finalTxt{cnt,1} = txtTheses1{nLinesOfTheses1+1}; cnt = cnt + 1;
            
            %% Handle the answers parts
            % get empty answer line, use it later on
            emptyAnswerLine = ReadLineOfFile(fullfile(apCleanSourceRoot,'th_answer_line.m'));
            % combine all the lines in a cell
            finalTxt{cnt,1} = [char(extractBefore(emptyAnswerLine,'NaN')) num2str(ansTheses1) ';'];
            
            %% Write final files
            cd(apDestination);
            [~, nameQuestion] = GetPathOneLevelUp(apDestination);
            % make question string
            nVersionMC = nVersionMC + 1;
            nameQuestion = [nameQuestion '_versie_' num2str(nVersionMC)];
            nameQuestionSOL = [nameQuestion '_SOL'];
            nameQuestionCHECK = [nameQuestion '_CHECK'];
            
            % write SOLUTION file, sometimes creating/copying does not work
            % reliable
            apNameQuestionSOL = fullfile(apDestination,[nameQuestionSOL '.m']);
            cd(apDestination)
            makeMFileFromCells(nameQuestionSOL,finalTxt);
            while ~exist(apNameQuestionSOL,'file')
                makeMFileFromCells(nameQuestionSOL,finalTxt);
                warning([mfilename ': ' nameQuestion 'it not created!']);
            end
            
            % write empty file, sometimes creating/copying does not work
            % reliable
            finalTxt{cnt,1} = emptyAnswerLine;
            apNameQuestion = fullfile(apDestination,[nameQuestion '.m']);
            makeMFileFromCells(nameQuestion,finalTxt);
            while ~exist(apNameQuestion,'file')
                makeMFileFromCells(nameQuestion,finalTxt);
                warning([mfilename ': ' nameQuestion 'it not created!']);
            end
            
            % copy the template CHECK file, sometimes creating/copying does not work
            % reliable
            apCheckFile = fullfile(apDestination,[nameQuestionCHECK '.m']);
            copyfile(apTemplateCheck,apCheckFile);
            while ~exist(apCheckFile,'file')
                copyfile(apTemplateCheck,apCheckFile);
                warning([mfilename ': ' nameQuestionCHECK 'it not created!']);
            end
            
            % rename the template function name ('xxx') with the current name
            fnCopiedTemplate = ReadLineOfFile(apCheckFile);
            fnCopiedTemplate = replace(fnCopiedTemplate,'xxx',nameQuestionCHECK);
            WriteLineOfFile(apCheckFile,1,fnCopiedTemplate);
            % clear variable to prevent polution of files
            clear finalTxt
        end
    end
    clear TPA
end

%% Test number of SOLUTION and CHECK files, sometimes the copying of files does not go right...
cd(apGeneratedTheses)
solFiles = dirmf('_SOL');
checkFilestmp = dirmf('_CHECK');
lcf = length(solFiles);
lcft = length(checkFilestmp);
try
    if ~isequal(lcf,lcft)
        disp(['number of SOLUTION files: ' num2str(length(solFiles))]);
        disp(['number of CHECK files: ' num2str(length(checkFilestmp))]);
        if lcft > lcf
            longest =  lcft;
        else
            longest = lcf;
        end
        for nF = 1:longest
            % Extract names of files
            tApSol = fullfile(solFiles(nF).folder,solFiles(nF).name);
            tApChe = fullfile(checkFilestmp(nF).folder,checkFilestmp(nF).name);
            tSolFileName = erase(solFiles(nF).name,'_SOL');
            tCheFilename = erase(checkFilestmp(nF).name,'_CHECK');
            
            if ~isequal(tSolFileName,tCheFilename)
                % Check for error in SOL file
                if ~exist(tApSol,'file')
                    warning(['Does not exist: ' tApSol]);
                elseif ~exist(tApChe,'file')
                    warning(['Does not exist: ' tApChe]);
                elseif ~exist(replace(tApSol,'_SOL','_CHECK'),'file')
                    warning(['Does not exist: ' replace(tApSol,'_SOL','_CHECK')]);
                elseif ~exist(replace(tApChe,'_SOL','_CHECK'),'file')
                    warning(['Does not exist: ' replace(tApChe,'_SOL','_CHECK')]);
                end
            end
        end
    end
catch err
    disp([mfilename ':' err]);
    error('CheckSolCheckDirFunc: number of _SOL and _CHECK files do not match!!');
end

disp('number of SOLUTION and CHECK files match!');

%% Remove accidental files with _COPY postfix
disp('Remove accidental files with _COPY postfix');
cd(apCleanAssignmentDir)
solFiles = dirmf('_COPY');
for nC = 1:length(solFiles)
    delete(fullfile(solFiles(nC).folder,solFiles(nC).name));
end

% % % % % %% Copy the generated files to clean_source assignment
% % % % % disp('Copy the generated files to clean_source assignment');
% % % % % cd(apGeneratedTheses)
% % % % % for nw = 1:length(weekNames)
% % % % %     apCurrDir = fullfile(pwd,weekNames{nw});
% % % % %     cleanMcFolders = getFolders(apCurrDir);
% % % % %     for nMCF = 1:length(cleanMcFolders)
% % % % %         apAss = fullfile(GetPathOneLevelUp(apCleanSourceRoot),'assignments',weekNames{nw},cleanMcFolders{nMCF});
% % % % %         removeShitFromDir(apAss);
% % % % %         copyfiles(fullfile(apCurrDir,cleanMcFolders{nMCF}),apAss);
% % % % %         disp([mfilename ': ' weekNames{nw} ',copied ' num2str(round(nMCF/length(cleanMcFolders),1)*100) '% of the files'])
% % % % %     end
% % % % % end
% % % % % cd ..;

%% Copy the files to the right place
disp('Copy the files to the "assignment" place');
apFinalAssDir = copyThesesToCleanSourceAssignment(con,apGeneratedTheses,weekNames);

%% Rename the folders in the final assignment place for more uniformity
% Assuming two types of folders: stellingen / programmeren the right folder
% number can be calculated.
if ~(nargin > 1)
    cd(apFinalAssDir);
    folders = dir;
    %%
    dirs = dir;
    dirs = dirs([dirs.isdir]);
    dirs = dirs(3:end);
    
    numAssignments = length(dirs); %length(folders)-2;
    numProgramming = sum(contains({dirs.name},'programmeren'));%(numAssignments/2)+1;
    numTheses = numAssignments-numProgramming;
    lstProg = contains({dirs.name},'programmeren');
    cntTheses = 1;
    cntProg = numTheses;
    for nFol = 1:length(lstProg)
        nmCurrFol = dirs(nFol).name;
        if ~lstProg(nFol)
            apNewFolder = fullfile(apFinalAssDir,['deelopdracht_' num2str(cntTheses)]);
            cntTheses = cntTheses + 1;
        else %programmeren
            cntProg = cntProg + 1;
            apNewFolder = fullfile(apFinalAssDir,strcat(extractBefore(nmCurrFol,"programmeren"),num2str(cntProg)));
        end
        apOldFolder = fullfile(apFinalAssDir,nmCurrFol);
        mkdir(apNewFolder)
        movefiles(apOldFolder,apNewFolder);
        rmdir(apOldFolder);
    end
end

end