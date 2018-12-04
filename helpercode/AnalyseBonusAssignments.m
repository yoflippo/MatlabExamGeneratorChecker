function [strOV, strStudGrad] = AnalyseBonusAssignments(con)

%% Load necessary files for analysis
try
    nmCurrBonusAss = con.BONUSASSNAME(con.BONUSASSNUMBER);
    apStudentAndGrades = fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER,nmCurrBonusAss,'cellAllStudentsAndAssignments.mat');
    load(apStudentAndGrades);
    apDicHashes = fullfile(con.BASEFOLDER,con.Assignments,nmCurrBonusAss,'dicHashesAbsPath.mat');
    load(apDicHashes);
    apDicAssignmentAndPoints = fullfile(con.BASEFOLDER,con.Assignments,nmCurrBonusAss,'dicAssignmentsAndPoints.mat');
    load(apDicAssignmentAndPoints)
catch err
    txterror = ['*Some files not found!' newline];
    txterror = [txterror '' newline];
    error([mfilename ': ' newline err.message newline txterror]);
end

% Short versions for readability
asas = allStudentsAndAssignments;
dchap = dicWithHashes;
dcasap = dicNameAssignmentAndPoints;

%% Traverse all assignments
strOV = [];
for nAss = 2:length(asas(1,2:end))
    % Get info out of dictionaries
    currHash = asas{1,nAss};
    strOV(nAss-1).Hash = currHash;
    strOV(nAss-1).apAss = dchap(currHash);
    rpCurrAss = extractAfter(dchap(currHash),nmCurrBonusAss);
    rpCurrAss = fileparts(rpCurrAss); %remove file
    rpCurrAss = rpCurrAss(2:end); %remove first slash
    strOV(nAss-1).rpAss = rpCurrAss;
    pntCurrAss = dcasap(rpCurrAss);
    strOV(nAss-1).pntAss = pntCurrAss;
    
    % Get clean points
    currPoints = asas(2:end,nAss);
    assEmpty = cellfun(@isempty,currPoints);
    assNotEmpty = ~assEmpty;
    strOV(nAss-1).notEmptyRow = assNotEmpty;
    clnPoints = currPoints(assNotEmpty);
    strOV(nAss-1).clnPoints = clnPoints;
    strOV(nAss-1).numAttempts = length(clnPoints);
    
    % Calculate P-value current assignment
    strOV(nAss-1).meanPoints = mean(cell2mat(clnPoints));
    strOV(nAss-1).Pval = strOV(nAss-1).meanPoints/strOV(nAss-1).pntAss;
end

%% Traverse students
strStudGrad = [];
nT = 1;
for nSt = 2:length(asas(2:end,1))
    currAssStud = asas(nSt,2:end);
    currAssStudNotEmpty = sum(~cellfun(@isempty,currAssStud));
    if currAssStudNotEmpty>5
        strStudGrad(nT).idx = nSt;
        strStudGrad(nT).sumPoints = sum(cell2mat(currAssStud));
        nT = nT + 1;
    end
end

end % function