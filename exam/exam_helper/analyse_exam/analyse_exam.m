function analyse_exam( apMatResultOverview,numMC,nmExam)
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
desstat.CBA = CronbachAlpha(transpose(resProc));

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
    plot(desstat.meanQ(t),'g+','LineWidth',lineWidth,'MarkerSize',markerSize)
    hold on;
    plot(desstat.stdQ(t),'*','LineWidth',lineWidth,'MarkerSize',markerSize)
    plot(relPoints,'s','LineWidth',lineWidth,'MarkerSize',markerSize)
    plot(desstat.RIT(t),'d','LineWidth',lineWidth,'MarkerSize',markerSize)
    plot(desstat.percentageCorrect(t),'LineWidth',lineWidth)
    %% Illustrate meaningfull RIT values
    ritBor = 0.2;
    for nr = 1:length(tQ{n})
        if ( (desstat.meanQ(tQ{n}(nr)) > ritBor)  && (desstat.meanQ(tQ{n}(nr)) < (1-ritBor)) ) && ...
                ( (desstat.RIT(tQ{n}(nr)) < ritBor)  ) || ( (desstat.RIT(tQ{n}(nr)) < ritBor)     )
            plot(nr,desstat.RIT(tQ{n}(nr)),'kd','LineWidth',lineWidth,'MarkerSize',markerSize+1)
        end
        if desstat.meanQ(tQ{n}(nr)) < 0.5
            plot(nr,desstat.meanQ(tQ{n}(nr)),'k+','LineWidth',lineWidth,'MarkerSize',markerSize+1)
        end
        plot([nr nr],[0 1],'Color',[0.8 0.8 0.8]','LineStyle','--')        
    end
    ylim([-0.05 1.05])
    xlabel('Assignment');
    title(['Normalised ' nmQ{n} ' (n=' num2str(l) '), Cronbach Alpha = ' num2str(desstat.CBA) ]);
    %     if isequal(n,1) %Theses
    legend('P+ value','STDT','Weight','RIT','Percentage correct','RIT low','P-val low','Location','best');
    %     else % programming
    %         legend('P+ value','Standard Deviation','Weight Question','RIT','Percentage correct answers','RIT too low','Location','best');
    %     end
    grid on; grid minor;
    saveas(gcf,[nmQ{n} '.png']);
    close all;
    %     saveas(gcf,[nmQ{n} '.svg']);
    savefig([nmQ{n} '.fig']);
    
    %% Boxplots
    if ~isequal(n,1)
        % Absolute
        figure('name',nmQ{n},'units','normalized','outerposition',[0 0 1 1]);
        if isequal(n,1)
            boxplot(desstat.resPoint(:,1:numMC))
        else
            boxplot(desstat.resPoint(:,numMC+1:end))
        end
        xlabel('Assignment');
        
        title([nmQ{n} ' (n=' num2str(l) ') Cronbach Alpha = ' num2str(desstat.CBA) ]);
        grid on; grid minor;
        saveas(gcf,[nmQ{n} '_BOXPLOT_ABS.png']);
        close all;
        
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
        saveas(gcf,[nmQ{n} '_BOXPLOT_NORM.png']);
        close all;
    end
end
save('analysisdata.mat');


end%f

