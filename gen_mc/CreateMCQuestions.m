clear all; close all; clc;

%% Get path of output folder and empty it
pathOfThisFile = erase(mfilename('fullpath'),mfilename);
outputDir = fullfile(pathOfThisFile,'generated_questions');
removeShitFromDir(outputDir)
mkdir(outputDir)

%% Get deepest folders with theses
weekDir = 'week1';
folders = GetDeepestFolders(fullfile(pathOfThisFile,weekDir));

%% Get absolute paths of theses files with there respective answers
for nDirs = 1:length(folders)
    cd(folders{nDirs});
    % get the theses files
    theses{nDirs} = dir('**\*th_*.m');
    % make a cell array of theses path with solution
    % loop through theses
    for nThss = 1:length(theses{nDirs})
        tmpName = theses{1,nDirs}(nThss).name;
        tmpPath = theses{1,nDirs}(nThss).folder;
        if contains(tmpName,'TRUE')
            tmpAnswer = true;
        else
            tmpAnswer = false;
        end
        thesesPathAnswer{nDirs,nThss} = {fullfile(tmpPath,tmpName),tmpAnswer,length(theses{nDirs})};
    end
    cd(pathOfThisFile);
end
absPathTemplateCheck = fullfile(pathOfThisFile,'TemplateCheckMC.m');

%% Copy folder of weekx and empty the folder
copyfiles(fullfile(pathOfThisFile,weekDir),fullfile(outputDir,weekDir))
emptyDirRecursiveMFiles(fullfile(outputDir,weekDir))

%% Generate answers (could be made randomnly)
answerA = ReadLineOfFile(fullfile(pathOfThisFile,'mc_answer_0.m'));
answerA = ['% A : ' char(answerA)];
answerB = ReadLineOfFile(fullfile(pathOfThisFile,'mc_answer_1.m'));
answerB = ['% B : ' char(answerB)];
answerC = ReadLineOfFile(fullfile(pathOfThisFile,'mc_answer_2.m'));
answerC = ['% C : ' char(answerC)];
answerD = ReadLineOfFile(fullfile(pathOfThisFile,'mc_answer_3.m'));
answerD = ['% D : ' char(answerD)];

%% Browse the subfolder of weekx
for nDirs = 1:length(folders)
    numberOfThesesFiles = thesesPathAnswer{nDirs,1}{3};
    currentFilePath =  thesesPathAnswer{nDirs,1}{1};
    % generate final destination path of current question, by inserting the
    % output folder
    absPathDestination = GetPathOneLevelUp(currentFilePath);
    absPathDestination = replace(absPathDestination,weekDir,fullfile('generated_questions',weekDir));
    
    % copy the points.m file (containing the number of points of mc-q) and
    % copy the TypeOfAssignment... file, so the CopyTheMultipleChoice..m
    % file works)
    fn = 'points.m';
    copyfile(fullfile(pathOfThisFile,fn),fullfile(absPathDestination,fn));
    fn = 'TypeOfAssignment_MultipleChoice.m';
    copyfile(fullfile(pathOfThisFile,fn),fullfile(absPathDestination,fn));
    
    % Generate non-adjacent indices
    cnt = 1;
    for ind = 1:numberOfThesesFiles-2
        for ind2 = ind+2:numberOfThesesFiles
            randomFileIndexes(cnt) = ind; cnt = cnt + 1;
            randomFileIndexes(cnt) = ind2; cnt = cnt + 1;
        end
    end
    %     % another way to generate indices BUT OLD
    %     randomFileIndexes = randperm(numberOfThesesFiles);
    %     % test for no sequentially (e.g. no '3 4 5 6' but '4 6 8 3'), the
    %     % sequential questions could be associated (TRUE / FALSE versions).
    %     while contains(num2str(diff(randomFileIndexes)),'1')
    %         randomFileIndexes = randperm(numberOfThesesFiles);
    %     end
    
    %% Combine to make one question
    % read header file line and give it the right question number
    headerTxt = ReadLineOfFile(fullfile(pathOfThisFile,'mc_header.m'));
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
        ansTheses1 = thesesPathAnswer{nDirs,currentIndex}{2};
        theses1 = char(getTextOfFile(thesesPathAnswer{nDirs,currentIndex}{1}));
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
        ansTheses2 = thesesPathAnswer{nDirs,currentIndex}{2};
        theses2 = char(getTextOfFile(thesesPathAnswer{nDirs,currentIndex}{1}));
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
        emptyAnswerLine = ReadLineOfFile(fullfile(pathOfThisFile,'mc_answer_line.m'));
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
        cd(pathOfThisFile)
        % copy the template CHECK file
        desAbsCheckFile = fullfile(absPathDestination,[nameQuestionCHECK '.m']);
        copyfile(absPathTemplateCheck,desAbsCheckFile);
        % rename the template function name ('xxx') with the current name
        fnCopiedTemplate = ReadLineOfFile(desAbsCheckFile);
        fnCopiedTemplate = replace(fnCopiedTemplate,'xxx',nameQuestionCHECK);
        WriteLineOfFile(desAbsCheckFile,1,fnCopiedTemplate);
        % clear variable to prevent polution of files
        clear finalTxt
    end
end