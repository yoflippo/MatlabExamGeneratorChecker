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

%% Copy folder of weekx and empty the folder
copyfiles(fullfile(pathOfThisFile,weekDir),fullfile(outputDir,weekDir))
emptyDirRecursiveMFiles(fullfile(outputDir,weekDir))

%% Browse the subfolder of weekx
for nDirs = 1:length(folders)
    numberOfThesesFiles = thesesPathAnswer{nDirs,1}{3};
    currentFilePath =  thesesPathAnswer{nDirs,1}{1};
    randomFileIndexes = randperm(numberOfThesesFiles);
    % test for an even / odd number of files
    blOdd = mod(numberOfThesesFiles,2);
    if blOdd
        nFilesEven = numberOfThesesFiles+1;
    end
    %% combine to make one question
    % read header file line and give it the right question number
    headerTxt = ReadLineOfFile(fullfile(pathOfThisFile,'mc_header.m'));
    questionNumber = GetPathOneLevelUp(currentFilePath);
    questionNumber = questionNumber(end);
    headerTxt = replace(headerTxt,'xxx',questionNumber);
    cnt = 1;
    finalTxt{cnt,1} = headerTxt; cnt = cnt + 1;
    finalTxt{cnt,1} = '%'; cnt = cnt + 1; %add empty line
    
    %% Combine theses
    % theses1
    currentIndex = randomFileIndexes(1)
    ansTheses1 = thesesPathAnswer{nDirs,currentIndex}{2};
    randomFileIndexes = randomFileIndexes(2:end)
    theses1 = char(getTextOfFile(thesesPathAnswer{nDirs,currentIndex}{1}));
    preambleTheses1 = '% Stelling 1:   ';
    txtTheses1{1} = [preambleTheses1 theses1(1,:)]
    finalTxt{cnt,1} = txtTheses1{1}; cnt = cnt + 1;

    % add the right number of tabs to rest of text
    nLinesOfTheses1 = size(theses1); nLinesOfTheses1 = nLinesOfTheses1(1);
    if nLinesOfTheses1 > 1
        for otherLines = 2:nLinesOfTheses1
            txtTheses1{otherLines} = ['%               ' theses1(otherLines,:)]
            finalTxt{cnt,1} = txtTheses1{otherLines}; cnt = cnt + 1;
        end
    end
    txtTheses1{nLinesOfTheses1+1} = '%'; %line between theses
    finalTxt{cnt,1} = txtTheses1{nLinesOfTheses1+1}; cnt = cnt + 1;
    
    % theses2
    currentIndex = randomFileIndexes(1)
    ansTheses2 = thesesPathAnswer{nDirs,currentIndex}{2};
    randomFileIndexes = randomFileIndexes(2:end)
    theses2 = char(getTextOfFile(thesesPathAnswer{nDirs,currentIndex}{1}));
    preambleTheses2 = '% Stelling 2:   ';
    txtTheses2{1} = [preambleTheses2 theses2(1,:)]
    finalTxt{cnt,1} =  txtTheses2{1}; cnt = cnt + 1;
    % add the right number of tabs to rest of text
    nLinesOfTheses2 = size(theses2); nLinesOfTheses2 = nLinesOfTheses2(1);
    if nLinesOfTheses2 > 1
        for otherLines = 2:nLinesOfTheses2
            txtTheses2{otherLines} = ['%               ' theses2(otherLines,:)]
            finalTxt{cnt,1} =  txtTheses2{otherLines}; cnt = cnt + 1;
        end
    end
    txtTheses2{nLinesOfTheses2+1} = '%'; %line between theses
    finalTxt{cnt,1} =  txtTheses2{nLinesOfTheses2+1}; cnt = cnt + 1;
    
    %% Generate answers (could be made randomnly)
    answerA = ReadLineOfFile(fullfile(pathOfThisFile,'mc_answer_0.m'));
    answerA = ['% A : ' char(answerA)];
    finalTxt{cnt,1} = answerA; cnt = cnt + 1;
    answerB = ReadLineOfFile(fullfile(pathOfThisFile,'mc_answer_1.m'));
    answerB = ['% B : ' char(answerB)];
    finalTxt{cnt,1} = answerB; cnt = cnt + 1;
    answerC = ReadLineOfFile(fullfile(pathOfThisFile,'mc_answer_2.m'));
    answerC = ['% C : ' char(answerC)];
    finalTxt{cnt,1} = answerC; cnt = cnt + 1;
    answerD = ReadLineOfFile(fullfile(pathOfThisFile,'mc_answer_3.m'));
    answerD = ['% D : ' char(answerD)];
    finalTxt{cnt,1} = answerD; cnt = cnt + 1;
    
    %% Calculate the right answers
    defaultAnswersTxt = ['A'; 'B'; 'C'; 'D';];
    currentAnswer = defaultAnswersTxt((ansTheses2*2) + ansTheses1 +1)
    solAnswerLine = ['Antwoord = ' currentAnswer ';']
    % get answer line
    emptyAnswerLine = ReadLineOfFile(fullfile(pathOfThisFile,'mc_answer_line.m'));
    
    % combine all the lines in a cell
    finalTxt{cnt,1} =  solAnswerLine;
    
    
end