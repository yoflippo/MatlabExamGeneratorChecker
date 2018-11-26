warning off
rmpath(genpath(fileparts(mfilename('fullpath'))));
warning on
addpath(genpath('helpercode'));
% % % % % % % % % % % % InitAll

%% Specific student assignments that need to be checked
for nw = 1:4
    weekName = ['week' num2str(nw)];
    cd(con.STUDENTSUBFOLDER)
    apSubmitted = pwd;
    postfxZipped = '_unzipped';
    cd([weekName postfxZipped]);
    des = fullfile(apSubmitted,weekName);
    files = dirmf('.zip');
    for n = 1:length(files)
        try
            %Create path
            src = fullfile(files(n).folder,files(n).name);
            movefile(src,des);
        catch
        end
    end
    cd ..
    cd(weekName)
    
    %% Unzip all files and replace them in folder unzipped
    addpath(genpath(des))
    files = dir(subWkFolder);
    % Get studentnumbers of students that submitted AND unzip the folder
    apWrongSub = fullfile(con.BASEFOLDER, con.STUDENTSUBFOLDER,[weekName '_wrongsubmissions']);
    apUnzipped = fullfile(con.BASEFOLDER, con.STUDENTSUBFOLDER,[weekName '_unzipped']);
    mkdirIf(apWrongSub);
    mkdirIf(apUnzipped);
    try
        cd(subWkFolder);
        tmpBase = pwd;
        studentsThatSubmitted = cell(1,length(files)-2);
        % Get the right week folders
        for i = 3:length(files)
            apCurrZip = fullfile(des,files(i).name);
            if contains(files(i).name,'.zip')
                if ~contains(files(i).name,'Checked') %% && contains(files(i).name,'ToSubmit')
                    studentsThatSubmitted{i-2} = findStudentNumberInTxt(files(i).name);
                    mkdir(studentsThatSubmitted{i-2})
                    cd(studentsThatSubmitted{i-2})
                    currPath = pwd;
                    mkdir('temp');
                    cd('temp');
                    unzip(apCurrZip);
                    %Remove dirs without correct weekX assignment
                    neededDir = dirmf(weekName);
                    blSubmittedWrongFiles = true;
                    for nD = 1:length(neededDir)
                        if ~isempty(neededDir) && neededDir(nD).isdir && isequal(neededDir(nD).name,weekName)
                            dirToCheck = fullfile(neededDir(nD).folder,neededDir(nD).name);
                            movefile(dirToCheck,currPath);
                            blSubmittedWrongFiles = false;
                            break;
                        end
                    end
                    if blSubmittedWrongFiles
                        movefile(apCurrZip,apWrongSub);
                    end
                    %Delete everything but current week folder
                    cd ..
                    removeShitFromDir('temp')
                    rmdir('temp')
                    try
                        movefile(apCurrZip,apUnzipped);
                    catch
                        currPath = pwd;
                        cd ..
                        rmdir(currPath)
                    end
                else
                    movefile(apCurrZip,apWrongSub);
                end
            else % not a zip-file but something else
                %             keyboard
                warning off
                delete(apCurrZip)
                removeShitFromDir(apCurrZip)
                rmdirIf(apCurrZip)
                warning on
            end
            cd(tmpBase);
        end
        % Remove .asv files
        asvFiles = dirmf('.asv');
        for nA = 1:length(asvFiles)
            delete(fullfile(asvFiles(nA).folder,asvFiles(nA).name));
        end
        cd(con.BASEFOLDER);
    catch err
        keyboard
        error([mfilename ': Something went wrong with unzipping!' newline err.message newline]);
    end
    
    %% Get student feedback
    %GeefJouwMening.txt
end