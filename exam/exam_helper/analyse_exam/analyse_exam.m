function analyse_exam( apMatResultOverview,numMC,nmExam)
close all;
mkdir('ExamAnalysis');
cd('ExamAnalysis');
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
    desstat.stdQ(nw) = std(vec);
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

tQ{1} = 1:numMC;
tQ{2} = numMC+1:w;
nmQ{1} = ['MultipleChoice ' replace(nmExam,'_',' ') ];
nmQ{2} = ['Programming Assignments ' replace(nmExam,'_',' ')];
for n = 1:2
    t = tQ{n};
    figure('name',nmQ{n},'units','normalized','outerposition',[0 0 1 1]);
    relPoints = desstat.pointsPerQ(t)/max(desstat.pointsPerQ(t));
    plot(desstat.meanQ(t),'--','LineWidth',2)
    hold on;
    plot(desstat.stdQ(t),'LineWidth',2)
    plot(relPoints,'LineWidth',2)
    plot(desstat.RIT(t),'LineWidth',2)
    plot(desstat.percentageCorrect(t),'LineWidth',2)
    %% Illustrate meaningfull RIT values
    ritBor = 0.2;
    for nr = 1:length(tQ{n})
        if ( (desstat.meanQ(tQ{n}(nr)) > ritBor)  && (desstat.meanQ(tQ{n}(nr)) < (1-ritBor)) ) && ...
           ( (desstat.RIT(tQ{n}(nr)) < ritBor)  ) || ( (desstat.RIT(tQ{n}(nr)) < ritBor)     )
            plot(nr,desstat.RIT(tQ{n}(nr)),'ro','LineWidth',2);
        end
    end
    
    xlabel('Question');
    title(['Normalised ' nmQ{n} ' (n=' num2str(l) ')']);
    legend('Mean result','Standard Deviation','Weight Question','RIT','Percentage correct answers','Need to Check Question','Location','best');
    grid on; grid minor;
    saveas(gcf,[nmQ{n} '.png']);
    saveas(gcf,[nmQ{n} '.svg']);
    savefig([nmQ{n} '.fig']);
end
save('analysisdata.mat');


end%f

