function [grades] = checkSubmittedExams(examInfo,ap)
cd(ap.Submitted);
if exist('checkSubmittedExam.mat','file')
    load('checkSubmittedExam.mat');
else
    
    %% Unzip Exams
    zfiles = dir('*.zip');
    if isequal(length(zfiles),0)
        error([newline mfilename ': ' newline 'No Zip-files found in submitted' newline]);
    end
    for nz = 1:length(zfiles)
        oDirs{nz} = replace(zfiles(nz).name,'.zip','');
        apCurrZip = fullfile(zfiles(nz).folder,zfiles(nz).name);
        unzip(apCurrZip,oDirs{nz});
        movefile(apCurrZip,ap.SUBMITTEDUNZIPPED);
    end
    
    %% Check for bonus
    cd(ap.CurrExam)
    if exist('bonus','dir')
        cd('bonus')
        delete('bonus.mat')
        matfiles = dirmf('.mat');
        if ~isempty(matfiles)
            for n = 1:length(matfiles)
                load(matfiles(n).name);
                bonusgrades{n} = studentMatrix;
            end
            % Calculate bonusgrade to add to examgrade
            for len = 1:length(bonusgrades{1,1})
                bonus{len,1} = bonusgrades{1,1}(len,1);
                bonusExam{len,1} = bonus{len,1};
                for wk = 1:length(bonusgrades)
                    bonus{len,wk+1} = bonusgrades{1,wk}(len,2);
                    bonusExam{len,wk+1} = (bonus{len,wk+1}-1)/(length(bonusgrades)*9);
                end
                bonusExam{len,length(bonusgrades)+2} = sum([bonusExam{len,2:5}]);
            end
            save('bonus.mat','bonus');
            clear studentMatrix bonusgrades n len matfiles
        end
    end
    cd(ap.Submitted)
    
    %% Walk through unzipped folders
    nex = length(oDirs);
    tmp = {examInfo.apQ};
    try
    % Remove empty cells
    tmp{1,cellfun(@isempty,tmp)}='';
    catch
    end
    resultOverview = [cell(1,1) tmp];
    resultOverview = [resultOverview; ['Point for each assignment' {examInfo.points}]];
    clear tmp;
    save('checkSubmittedExam.mat');
end

for nd = 1:nex
    currPath = pwd;
    if exist(oDirs{nd},'dir')
        cd(oDirs{nd});
        currStudentNumber = getStudentNumber()
        cd(currPath)
        nmChecked = ['Checked_' oDirs{nd} '.zip'];
        if ~exist(nmChecked,'file')
            cd(oDirs{nd});
            cd(fullfile('Tentamen'))
            %% Check Hashes and remove files that do not belong
            checkExamHashes();
            
            %% Grade files
            [grade,tmpResultOverview] = gradeExamFiles(examInfo);
            % Fill resultOverview
            tmpResultOverview = [currStudentNumber tmpResultOverview];
            resultOverview = [resultOverview; tmpResultOverview];
            
%             keyboard %% Aanpassen voor andere bonusopdrachten
            
            %% Create file with grade information
            t{1} = ['% Jouw tentamen cijfer: ' num2str(round(grade,1))];
            studBonusGrade = 0;
            if exist('bonus','var')
                idx = find([bonus{:,1}]==currStudentNumber);
                for wk = 1:4
                    if bonus{idx,wk+1} > 1
                        t{length(t)+1} = ['% Bonus cijfer week ' num2str(wk) ': ' num2str(bonus{idx,wk+1}) ' (' num2str(round(bonusExam{idx,wk+1},2)) ')'];
                    end
                end
                [l w] = size(bonusExam);
                studBonusGrade = bonusExam{idx,w};
            end
            studFinGrade = max(min(round(grade+studBonusGrade,1),10),1);
            t{length(t)+1} = ['%% Jouw eindcijfer: ' num2str(studFinGrade)];
            t{length(t)+1} = '% Kijk eventueel in het UITWERKING bestand om te zien wat er fout is gegaan.';
            t{length(t)+1} = '% Alleen bij het Tentamen (niet het HERtentamen) wordt';
            t{length(t)+1} = '% het bonuspunt opgeteld.';
            makeMFileFromCells(fullfile(pwd,'JouwCijfer'),t);
            
            %% Zip checked exam
            cd(currPath)
            deleteTemporaryFiles();
            zip(nmChecked,oDirs{nd})
            % Clear folder of student
            removeShitFromDir(oDirs{nd});
            rmpath(genpath(oDirs{nd}));
            rmdir(oDirs{nd},'s')
            % Copy checked file
            movefile(nmChecked,ap.SUBMITTEDCHECKED);
            
            %% Save grade
            grades(nd,1:2) = [currStudentNumber studFinGrade];
            clear idx studBonusGrade studFinGrade t
            clc; close all;
            disp(['Progress checking EXAMS: ' num2str(100*(nd/nex)) ' %']);
            pause(0.1);
            save('checkSubmittedExam.mat'); %To register the grades in case of a restart
        end
    end
end
save('resultOverview.mat','resultOverview')
save('grades.mat','grades');
end

