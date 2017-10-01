function CreatMCQuestions(BASEFOLDER)

fclose('all');
%% Get path of output folder and empty it
apOfThisFile = fullfile(BASEFOLDER,'clean_source','gen_mc');
cd(apOfThisFile);

outputDir = fullfile(apOfThisFile,'generated_questions');
removeShitFromDir(outputDir)
if ~exist(outputDir)
    mkdir(outputDir)
end

%% Iterate over each available week
weekDir = {'week1' 'week2'};

for nWk = 1:length(weekDir)
    folders = GetDeepestFolders(fullfile(apOfThisFile,weekDir{nWk}));
    
    %% Get absolute paths of theses files with there respective answers
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
        cd(apOfThisFile);
    end
    apTemplateCheck = fullfile(apOfThisFile,'TemplateCheckMC.m');
    
    %% Copy folder of weekXXX and empty the folders to make a skeleton directory
    apDesMC = fullfile(outputDir,weekDir{nWk});
    apSrcThesis = fullfile(apOfThisFile,weekDir{nWk});
    copyfiles(apSrcThesis,apDesMC);
    % Remove the thesis files
    emptyDirRecursiveMFiles(apDesMC);
    
    %% Generate answers (could be made randomnly)
    answerA = ReadLineOfFile(fullfile(apOfThisFile,'mc_answer_0.m'));
    answerA = ['% A : ' char(answerA)];
    answerB = ReadLineOfFile(fullfile(apOfThisFile,'mc_answer_1.m'));
    answerB = ['% B : ' char(answerB)];
    answerC = ReadLineOfFile(fullfile(apOfThisFile,'mc_answer_2.m'));
    answerC = ['% C : ' char(answerC)];
    answerD = ReadLineOfFile(fullfile(apOfThisFile,'mc_answer_3.m'));
    answerD = ['% D : ' char(answerD)];
    
    %% Browse the subfolder of weekXXX
    for nDirs = 1:length(folders)
        numberOfThesesFiles = TPA{nDirs,1}{3};
        currentFilePath =  TPA{nDirs,1}{1};
        % generate final destination path of current question, by inserting the
        % output folder
        
        absPathDestination = GetPathOneLevelUp(currentFilePath);
        absPathDestination = replace(absPathDestination,weekDir{nWk},fullfile('generated_questions',weekDir{nWk}));
        
        % copy the points.m file (containing the number of points of mc-q) and
        % copy the TypeOfAssignment... file, so the CopyTheMultipleChoice..m
        % file works)
        fn = 'points.m';
        copyfile(fullfile(apOfThisFile,fn),fullfile(absPathDestination,fn));
        fn = 'TypeOfAssignment_Multiplechoice.m';
        copyfile(fullfile(apOfThisFile,fn),fullfile(absPathDestination,fn));
        
        % Generate non-adjacent indices, adjacent indices have a high
        % probability of containing questions with the same theme. Creating
        % MC questions out of theses with the same theme is not what we
        % want.
        cnt = 1;
        for ind = 1:numberOfThesesFiles-2
            for ind2 = ind+2:numberOfThesesFiles
                randomFileIndexes(cnt) = ind; cnt = cnt + 1;
                randomFileIndexes(cnt) = ind2; cnt = cnt + 1;
            end
        end
        
        %% Combine to make one question
        % read header file line and give it the right question number
        headerTxt = ReadLineOfFile(fullfile(apOfThisFile,'mc_header.m'));
        questionNumber = GetPathOneLevelUp(currentFilePath);
        questionNumber = questionNumber(end);
        headerTxt = replace(headerTxt,'xxx',questionNumber);
        
        %% Generate Questions
        nVersionMC = 0;
        for nMostIndices = 1:(length(randomFileIndexes)/2)
            cnt = 1;
            finalTxt{cnt,1} = headerTxt; cnt = cnt + 1;
            finalTxt{cnt,1} = '%';       cnt = cnt + 1; %add empty line
            
            %% Combine theses
            % theses1
            currentIndex = randomFileIndexes(1);
            randomFileIndexes = randomFileIndexes(2:end);
            ansTheses1 = TPA{nDirs,currentIndex}{2};
            theses1 = char(readTxtFile(TPA{nDirs,currentIndex}{1}));
            preambleTheses1 = '% Stelling 1:   ';
            txtTheses1{1} = [preambleTheses1 theses1(1,:)];
            finalTxt{cnt,1} = txtTheses1{1}; cnt = cnt + 1;
            
            % add the right number of tabs to rest of text
            nLinesOfTheses1 = size(theses1); nLinesOfTheses1 = nLinesOfTheses1(1);
            if nLinesOfTheses1 > 1
                for otherLines = 2:nLinesOfTheses1
                    txtTheses1{otherLines} = ['%' sprintf('\t\t\t\t') theses1(otherLines,:)];
                    finalTxt{cnt,1} = txtTheses1{otherLines}; cnt = cnt + 1;
                end
            end
            txtTheses1{nLinesOfTheses1+1} = '%'; %line between theses
            finalTxt{cnt,1} = txtTheses1{nLinesOfTheses1+1}; cnt = cnt + 1;
            
            % theses2
            currentIndex = randomFileIndexes(1);
            randomFileIndexes = randomFileIndexes(2:end);
            ansTheses2 = TPA{nDirs,currentIndex}{2};
            theses2 = char(readTxtFile(TPA{nDirs,currentIndex}{1}));
            preambleTheses2 = '% Stelling 2:   ';
            txtTheses2{1} = [preambleTheses2 theses2(1,:)];
            finalTxt{cnt,1} =  txtTheses2{1}; cnt = cnt + 1;
            % add the right number of tabs to rest of text
            nLinesOfTheses2 = size(theses2); nLinesOfTheses2 = nLinesOfTheses2(1);
            if nLinesOfTheses2 > 1
                for otherLines = 2:nLinesOfTheses2
                    txtTheses2{otherLines} = ['%' sprintf('\t\t\t\t') theses2(otherLines,:)];
                    finalTxt{cnt,1} =  txtTheses2{otherLines}; cnt = cnt + 1;
                end
            end
            txtTheses2{nLinesOfTheses2+1} = '%'; %line between theses
            finalTxt{cnt,1} =  txtTheses2{nLinesOfTheses2+1}; cnt = cnt + 1;
            
            %% Add answers
            finalTxt{cnt,1} = answerA; cnt = cnt + 1;
            finalTxt{cnt,1} = answerB; cnt = cnt + 1;
            finalTxt{cnt,1} = answerC; cnt = cnt + 1;
            finalTxt{cnt,1} = answerD; cnt = cnt + 1;
            
            %% Handle the answers parts
            defaultAnswersTxt = ['A'; 'B'; 'C'; 'D';];
            currentAnswer = defaultAnswersTxt((ansTheses1 * 2) + ansTheses2 + 1);
            solAnswerLine = ['Antwoord = ' currentAnswer ';'];
            % get answer line
            emptyAnswerLine = ReadLineOfFile(fullfile(apOfThisFile,'mc_answer_line.m'));
            % combine all the lines in a cell
            finalTxt{cnt,1} =  solAnswerLine;
            
            %% Write final files
            cd(absPathDestination);
            [a nameQuestion] = GetPathOneLevelUp(absPathDestination);
            % make question string
            nVersionMC = nVersionMC + 1;
            nameQuestion = [nameQuestion '_versie_' num2str(nVersionMC)];
            nameQuestionSOL = [nameQuestion '_SOL'];
            nameQuestionCHECK = [nameQuestion '_CHECK'];
            % write solution file
            makeMFileFromCells(nameQuestionSOL,finalTxt);
            % write empty file
            finalTxt{cnt,1} = emptyAnswerLine;
            makeMFileFromCells(nameQuestion,finalTxt);
            cd(apOfThisFile)
            % copy the template CHECK file
            desAbsCheckFile = fullfile(absPathDestination,[nameQuestionCHECK '.m']);
            copyfile(apTemplateCheck,desAbsCheckFile);
            % rename the template function name ('xxx') with the current name
            fnCopiedTemplate = ReadLineOfFile(desAbsCheckFile);
            fnCopiedTemplate = replace(fnCopiedTemplate,'xxx',nameQuestionCHECK);
            WriteLineOfFile(desAbsCheckFile,1,fnCopiedTemplate);
            % clear variable to prevent polution of files
            clear finalTxt
        end
    end
    clear TPA
end

%% Test number of SOLUTION and CHECK files
cd('generated_questions')
checkFiles = dir('**/*_SOL*.m');
checkFilestmp = dir('**/*_CHECK*.m');
lcf = length(checkFiles);
lcft = length(checkFilestmp);
if ~isequal(lcf,lcft)
    disp(['number of SOLUTION files: ' num2str(length(checkFiles))]);
    disp(['number of CHECK files: ' num2str(length(checkFilestmp))]);
    if lcft > lcf
       longest =  lcft;
    else
        longest = lcf;
    end
    for nF = 1:longest
        if ~isequal(checkFiles(nF).Folder,checkFilestmp(nF).Folder)
           checkFiles(nF).Folder
           checkFilestmp(nF).Folder
        end
    end
    error('CheckSolCheckDirFunc: number of _SOL and _CHECK files do not match!!');
else
    disp('number of SOLUTION and CHECK files match!');
end
cd ..
%% Test the generated MC-files
CountNumberOfFALSE_TRUE;
datetime
cd(BASEFOLDER);
end