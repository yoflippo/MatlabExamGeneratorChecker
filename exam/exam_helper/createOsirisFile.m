cd(apCheckExam);
apExc = uigetfile({'*.*'},'Selecteer Osiris export bgestand');
nmGradesMat = 'grades.mat';
apGradesMat = dirmf(nmGradesMat);
WriteResultsToExcel(apExc,fullfile(apGradesMat.folder,nmGradesMat));