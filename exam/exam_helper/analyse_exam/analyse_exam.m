function analyse_exam( apMatResultOverview,numMC,nmExam,grades)
close all;
nmAnalysisDir = 'ExamAnalysis';
if contains(pwd,nmAnalysisDir )
    apAnalysis = fullfile(extractBefore(pwd,nmAnalysisDir),nmAnalysisDir);
    cd(apAnalysis);
else
    mkdir('ExamAnalysis');
    cd('ExamAnalysis');
end
numPosAnsTheses = 2;
try
    load(apMatResultOverview);
catch err
    error([newline mfilename ': ' newline err.message newline 'Cannot load .mat resultOverview file']);
end

% remove empty columns and questions
res = resultOverview(2:end,~all(cellfun(@isempty,resultOverview)));
% remove student numbers
res = res(:,2:end);
desstat.pointsPerQ = cell2mat(res(1,:));
desstat.totalPoints = sum(desstat.pointsPerQ);

res = res(2:end,:);
res(cellfun(@isempty,res))={0};
resProc = cell2mat(res);
[l, w] = size(resProc);

%% Get descriptive information about the question
for nw = 1:w
    vec = resProc(:,nw);
    desstat.meanQ(nw) = mean(vec);
    p = desstat.meanQ(nw);
    %     if nw <= numMC %Theses
    %         desstat.Pcor(nw) = p-((1-p)/(numPosAnsTheses)); %p-((1-p)/(numPosAnsTheses-1));
    %     end
    desstat.stdQ(nw) = std(vec);
    desstat.varQ(nw) = var(vec);
    desstat.sumQ(nw) = sum(vec);
    desstat.meanPointsQ(nw) = desstat.meanQ(nw)*desstat.pointsPerQ(nw);
    desstat.resPoint(:,nw) = resProc(:,nw)*desstat.pointsPerQ(nw);
end

%% Get descriptive information about the student results
for nl = 1:l
    desstat.totPoints(nl,1) = sum(desstat.resPoint(nl,:));
end

for nl = 1:nw
    desstat.RIT(nl) = min(min(corrcoef(desstat.resPoint(:,nl),desstat.totPoints)));
end

desstat.percentageCorrect =  repmat(mean(desstat.totPoints)/desstat.totalPoints,1,w);

%% Calculate Cronbach's alpha betrouwbaarheid
desstat.CBA = CronbachAlpha(resProc);

%% Create figures
tQ{1} = 1:numMC;
tQ{2} = numMC+1:w;
nmQ{1} = ['MultipleChoice ' replace(nmExam,'_',' ') ];
nmQ{2} = ['Programming Assignments ' replace(nmExam,'_',' ')];
markerSize = 13;
lineWidth = 2;
for n = 1:2
    t = tQ{n};
    figure('name',nmQ{n},'units','normalized','outerposition',[0 0 1 1],'visible','off');
    relPoints = desstat.pointsPerQ(t)/max(desstat.pointsPerQ(t));
    hCnt = 1;
    h(1) = plot(desstat.meanQ(t),'g+','LineWidth',lineWidth,'MarkerSize',markerSize,'DisplayName','P+ value');
    hold on;
    h(2) = plot(desstat.stdQ(t),'*','LineWidth',lineWidth,'MarkerSize',markerSize,'DisplayName','STD');
    h(3) = stairs(relPoints,'-','LineWidth',lineWidth,'MarkerSize',markerSize,'DisplayName','Weight');
    h(4) = plot(desstat.RIT(t),'d','LineWidth',lineWidth,'MarkerSize',markerSize,'DisplayName','RIT');
    h(5) = plot(desstat.percentageCorrect(t),'LineWidth',lineWidth,'DisplayName','Percentage correct');
    %% Illustrate meaningfull RIT values
    ritBor = 0.2;
    for nr = 1:length(tQ{n})
        blBoth = false;
        plot([nr nr],[0 1],'Color',[0.7 0.7 0.7]','LineStyle','--','HandleVisibility','off')
        if ( (desstat.meanQ(tQ{n}(nr)) > ritBor)  && (desstat.meanQ(tQ{n}(nr)) < (1-ritBor)) ) && ...
                ( (desstat.RIT(tQ{n}(nr)) < ritBor)  ) || ( (desstat.RIT(tQ{n}(nr)) < ritBor)     )
            h(6) = plot(nr,desstat.RIT(tQ{n}(nr)),'rd','LineWidth',lineWidth,'MarkerSize',markerSize+1,'DisplayName','RIT low');
            blBoth = true;
        end
        if desstat.meanQ(tQ{n}(nr)) < 0.5
            h(7) = plot(nr,desstat.meanQ(tQ{n}(nr)),'r+','LineWidth',lineWidth,'MarkerSize',markerSize+1,'DisplayName','P-val low');
            if blBoth
                plot([nr nr],[0 1],'Color',[1 0.3 0.3]','LineStyle','--','HandleVisibility','off')
            end
        end
    end
    xlim([0 length(tQ{n})+1]);
    ylim([-0.05 1.05])
    xlabel('Assignment');
    title(['Normalised ' nmQ{n} ' (n=' num2str(l) '), Cronbach Alpha = ' num2str(desstat.CBA) ]);
    superHandle = [];
    for nH = 1:length(h)
        if ~isa(h(nH),'matlab.graphics.GraphicsPlaceholder')
            superHandle = [superHandle h(nH)];
        end
    end
    legend(superHandle);
    clear h superHandle
    %     legend('P+ value','STD','Weight','RIT','Percentage correct','RIT low','P-val low','Location','best');
    grid on; grid minor;
    saveTightFigure(gcf,[nmQ{n} '.png']);
    savefig([nmQ{n} '.fig']);
    close all;
    %% Boxplots
    if ~isequal(n,1)
        % Normalised
        figure('name',nmQ{n},'units','normalized','outerposition',[0 0 1 1],'visible','off');
        if isequal(n,1)
            boxplot(resProc(:,1:numMC))
        else
            boxplot(resProc(:,numMC+1:end))
        end
        xlabel('Assignment');
        
        title(['Normalised ' nmQ{n} ' (n=' num2str(l) ') Cronbach Alpha = ' num2str(desstat.CBA) ]);
        grid on; grid minor;
        saveTightFigure(gcf,[nmQ{n} '_BOXPLOT_NORM.png']);
        close all;
        
        % Absolute
        figure('name',nmQ{n},'units','normalized','outerposition',[0 0 1 1],'visible','off');
        if isequal(n,1)
            boxplot(desstat.resPoint(:,1:numMC))
        else
            boxplot(desstat.resPoint(:,numMC+1:end))
        end
        xlabel('Assignment');
        title([nmQ{n} ' (n=' num2str(l) ') Cronbach Alpha = ' num2str(desstat.CBA) ]);
        grid on; grid minor;
        saveTightFigure(gcf,[nmQ{n} '_BOXPLOT_ABS.png']);
        close all;
    end
end

try
    figure('name',nmQ{n},'units','normalized','outerposition',[0 0 1 1],'visible','off');
    histogram(grades(:,2),[1:10]);
    title(['Biostatica Cijfers ' nmExam ', Percentage of students passed: ' num2str(round(sum(grades(:,2)>=5.5)/length(grades(:,2))*100,1)) '%']);
    xlabel('Grade')
    ylabel('Number')
    grid on; grid minor;
    saveTightFigure(gcf,[nmExam '_GRADES.png']);
catch
end

save('analysisdata.mat');
if ispc
    winopen(pwd)
end

end%f

