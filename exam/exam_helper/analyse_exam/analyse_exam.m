function [ output_args ] = analyse_exam( apMatResultOverview,numMC )

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
res = res(2:end,:);
resProc = cell2mat(res);
[l w] = size(resProc);
resPoint = resProc;

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
    desstat.totPoints(nl,1) = sum(desstat.resPoint(nl,:))
end

for nl = 1:nw
    desstat.cr(nl) = min(min(abs(corrcoef(desstat.resPoint(:,nl),desstat.totPoints))));
end

tQ{1} = 1:numMC;
tQ{2} = numMC+1:w;
nmQ{1} = 'MultipleChoice';
nmQ{2} = 'Programming Assignments';
for n = 1:2
    t = tQ{n};
    figure('name',nmQ{n},'units','normalized','outerposition',[0 0 1 1]);
    relPoints = desstat.pointsPerQ(t)/max(desstat.pointsPerQ(t));
    plot(desstat.meanQ(t),'--','LineWidth',2)
    hold on;
    plot(desstat.stdQ(t),'LineWidth',2)
    plot(relPoints,'LineWidth',2)
    plot(desstat.cr(t),'LineWidth',2)
    xlabel('Questions')
    title(['Normalised ' nmQ{n}])
    legend('Mean','Standard Deviation','Weight Question','RIT')
    grid on; grid minor;
    saveas(gcf,[nmQ{n} '.png'])
    saveas(gcf,[nmQ{n} '.svg'])
    savefig([nmQ{n} '.fig']);
end
save('analysisdata.mat')


end%f

