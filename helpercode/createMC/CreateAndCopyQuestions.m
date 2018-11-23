function CreateAndCopyQuestions(con)

fclose('all'); %Close files that could be open
currentBonusAssignment = con.BONUSASSNUMBER;
%% Get path of output folder for a certain week X and empty it
apCleanSourceRoot = fullfile(con.BASEFOLDER,con.DIRCLEANSRC,'gen_mc');
cd(apCleanSourceRoot);
apSourceTheses = fullfile(apCleanSourceRoot,'source_theses');
apGeneratedTheses = replace(apSourceTheses,'source_theses','generated_theses');

%% Test the generated MC-files
cd(apCleanSourceRoot);
CountNumberOfFALSE_TRUE;

%% Iterate over each available week
for nW = con.BONUSASSIGNMENTS{currentBonusAssignment}
    weekNames{nW} = ['week' num2str(nW)];
end
nmBonusAssDir = [con.NMBONUSASSIGNMENTDIR num2str(currentBonusAssignment)];
outputDir = fullfile(apGeneratedTheses,nmBonusAssDir);
removeShitFromDir(outputDir)
if ~exist(outputDir,'dir')
    mkdir(outputDir)
end

%% Make a skeleton directories
for nWk = 1:length(weekNames)
    apDesMC = outputDir;
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
        absPathDestination = GetPathOneLevelUp(currentFilePath);
        absPathDestination = replace(absPathDestination,'source_theses','generated_theses');
        absPathDestination = replace(absPathDestination,weekNames{nWk},nmBonusAssDir);
        % copy the points.m file (containing the number of points of mc-q) and
        % copy the TypeOfAssignment... file, so the CopyTheMultipleChoice..m
        % file works)
        fn = 'points.m';
        copyfile(fullfile(apCleanSourceRoot,fn),fullfile(absPathDestination,fn));
        fn = 'TypeOfAssignment_Multiplechoice.m';
        copyfile(fullfile(apCleanSourceRoot,fn),fullfile(absPathDestination,fn));
        
        % Generate thesisses in random order
        randomFileIndexes = randperm(numberOfThesesFiles);
        
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
            cd(absPathDestination);
            [~, nameQuestion] = GetPathOneLevelUp(absPathDestination);
            % make question string
            nVersionMC = nVersionMC + 1;
            nameQuestion = [nameQuestion '_versie_' num2str(nVersionMC)];
            nameQuestionSOL = [nameQuestion '_SOL'];
            nameQuestionCHECK = [nameQuestion '_CHECK'];
            
            % write SOLUTION file, sometimes creating/copying does not work
            % reliable
            apNameQuestionSOL = fullfile(absPathDestination,[nameQuestionSOL '.m']);
            cd(absPathDestination)
            makeMFileFromCells(nameQuestionSOL,finalTxt);
            while ~exist(apNameQuestionSOL,'file')
                makeMFileFromCells(nameQuestionSOL,finalTxt);
                warning([mfilename ': ' nameQuestion 'it not created!']);
            end
            
            % write empty file, sometimes creating/copying does not work
            % reliable
            finalTxt{cnt,1} = emptyAnswerLine;
            apNameQuestion = fullfile(absPathDestination,[nameQuestion '.m']);
            makeMFileFromCells(nameQuestion,finalTxt);
            while ~exist(apNameQuestion,'file')
                makeMFileFromCells(nameQuestion,finalTxt);
                warning([mfilename ': ' nameQuestion 'it not created!']);
            end
            
            % copy the template CHECK file, sometimes creating/copying does not work
            % reliable
            apCheckFile = fullfile(absPathDestination,[nameQuestionCHECK '.m']);
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
cd(outputDir)
solFiles = dirmf('_COPY');
for nC = 1:length(solFiles)
    delete(fullfile(solFiles(nC).folder,solFiles(nC).name));
end

%% Copy the generated files to clean_source assignment
disp('Copy the generated files to clean_source assignment');
cd(apGeneratedTheses)
for nw = 1:length(weekNames)
    apCurrDir = fullfile(pwd,weekNames{nw});
    cleanMcFolders = getFolders(apCurrDir);
    for nMCF = 1:length(cleanMcFolders)
        apAss = fullfile(GetPathOneLevelUp(apCleanSourceRoot),'assignments',weekNames{nw},cleanMcFolders{nMCF});
        removeShitFromDir(apAss);
        copyfiles(fullfile(apCurrDir,cleanMcFolders{nMCF}),apAss);
        disp([mfilename ': ' weekNames{nw} ',copied ' num2str(round(nMCF/length(cleanMcFolders),1)*100) '% of the files'])
    end
end
cd ..;


%% Copy the files to the right place
disp('Copy the files to the "assignment" place');
copyMCToCleanSourceAssignment(con,apGeneratedTheses,weekNames);
end