function [grades] = checkSubmittedExams(examInfo,ap)
cd(ap.Submitted);
if exist('checkSubmittedExam.mat','file')
    load('checkSubmittedExam.mat');
else

    %% Unzip Exams
    zfiles = dir('*.zip');
    if isequal(length(zfiles),0)
        warning([newline mfilename ': ' newline 'No Zip-files found in submitted' newline]);
        error("Fill folder with student exam zipfiles");
    else
        % correctly unzip zip files
        for nz = 1:length(zfiles)
            oDirs{nz} = findStudentNumberInTxt(zfiles(nz).name);
            apCurrZip = fullfile(zfiles(nz).folder,zfiles(nz).name);
            unzip(apCurrZip,oDirs{nz});
            movefile(apCurrZip,ap.SUBMITTEDUNZIPPED);
        end
    end


    %% Check for bonus
    bonus = processBonusGrade(ap);
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
        currStudentNumber = oDirs{nd}
        cd(currPath)
        nmChecked = ['Checked_' oDirs{nd} '.zip'];
        if ~exist(nmChecked,'file')
            cd(oDirs{nd});
            %
            try
                tmpdirs = dir(['**' filesep 'deelopdracht_0']);
                tmpdirs(~contains({tmpdirs.folder},oDirs{nd})) = [];
                cd(tmpdirs(1).folder);
                cd ..
                %OLD VERSION worked most of the times: cd('Tentamen')
            catch
                subdirs = dir(['*' filesep]);
                subdirs = subdirs([subdirs.isdir]);
                idxTentamenDir = find(contains({subdirs.name},'Tentamen'));
                if ~isempty(idxTentamenDir)
                    cd(fullfile(subdirs(idxTentamenDir).folder,subdirs(idxTentamenDir).name))
                end
            end
            deleteTemporaryFiles({'_UITWERKING'})
            %% Check Hashes and remove files that do not belong
            checkExamHashes();

            %% Grade files
            [grade,tmpResultOverview] = gradeExamFiles(examInfo);
            % Fill resultOverview
            tmpResultOverview = [currStudentNumber tmpResultOverview];
            resultOverview = [resultOverview; tmpResultOverview];
            grade

            %             keyboard %% Aanpassen voor andere bonusopdrachten

            %% Create file with grade information
            t{1} = ['% Jouw tentamen cijfer: ' num2str(round(grade,1))];
            studBonusGrade = 0;
            stringbonus = string(bonus(:,1));
            if not(isempty('bonus'))
                idx = find(contains(stringbonus,string(currStudentNumber)));
                if ~isempty(idx)
                    for wk = 1:2
                        if bonus(idx,wk+1)
                            t{length(t)+1} = ['% Bonus cijfer ' num2str(wk) ': ' num2str(bonus(idx,wk+1))];
                        end
                    end
                    studBonusGrade = bonus(idx,end);
                else
                    studBonusGrade = 0;
                    t{length(t)+1} = ['% Jij hebt geen bonus cijfers... jammer...'];
                end
            end
            studFinGrade = max(min(round(grade+studBonusGrade,1),10),1);
            t{length(t)+1} = '%';
            t{length(t)+1} = ['%% Jouw eindcijfer: ' num2str(studFinGrade)];
            t{length(t)+1} = '%';
            if studFinGrade > 5.4 && studFinGrade < 5.6 && studBonusGrade == 0
                t{length(t)+1} = '% Kijk! In jouw geval heeft het bonuscijfer geholpen :)';
                t{length(t)+1} = '%';
            elseif studFinGrade > 4.8 && studFinGrade < 5.5 && studBonusGrade == 0
                t{length(t)+1} = '% Kijk! In jouw geval had een bonuscijfer kunnen helpen, gemiste kans :(';
                t{length(t)+1} = '%';
            end

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

            % TO DO track the number of people who had a bonus assignment.
            grades(nd,1:2) = [str2double(currStudentNumber) studFinGrade];
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

