function [strOV, strStudGrad] = AnalyseBonusAssignments(con)

%% Load necessary files for analysis
try
    nmCurrBonusAss = con.BONUSASSNAME(con.BONUSASSNUMBER);
    apStudentAndGrades = fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER,nmCurrBonusAss,'cellAllStudentsAndAssignments.mat');
    load(apStudentAndGrades);
    apDicHashes = fullfile(con.AP_ASSIGNMENTS,nmCurrBonusAss,'dicHashesAbsPath.mat');
    load(apDicHashes);
    apDicAssignmentAndPoints = fullfile(con.AP_ASSIGNMENTS,nmCurrBonusAss,'dicAssignmentsAndPoints.mat');
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

%% Traverse students
strStudGrad = [];
for nSt = 1:length(asas(2:end,1))
    currAssStud = asas(nSt+1,2:end);
    currAssStudNotEmpty = sum(~cellfun(@isempty,currAssStud));
    if currAssStudNotEmpty>0
        strStudGrad(nSt).idx = nSt;
        strStudGrad(nSt).sumPoints = sum(cell2mat(currAssStud));
    else
        strStudGrad(nSt).idx = nSt;
        strStudGrad(nSt).sumPoints = [];
    end
end

%% Traverse all assignments
strOV = [];
for nAss = 2:length(asas(1,2:end))
    % Get info out of dictionaries
    currHash = asas{1,nAss};
    strOV(nAss-1).Hash = currHash;
    strOV(nAss-1).apAssSol = dchap(currHash);
    strOV(nAss-1).apAss = replace(dchap(currHash),'_SOL','');
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
    strOV(nAss-1).meanPoints = mean(cell2mat(clnPoints)*strOV(nAss-1).pntAss);
    strOV(nAss-1).Pval = strOV(nAss-1).meanPoints/strOV(nAss-1).pntAss;
    % Calculate RIT-value
    strOV(nAss-1).RIT = min(min(corrcoef(cell2mat(clnPoints), ...
        cell2mat({strStudGrad(assNotEmpty).sumPoints}'))));
end

%% Give back the problem cases
minValP = 0.2;
minValRit = 0.2;

problem.PValues = [strOV.Pval]<minValP;
problem.RITValues = [strOV.RIT]<minValRit;
problem.Big = problem.PValues & problem.RITValues;
problem.All = problem.PValues | problem.RITValues;

problem.AssLowP.SOL = {strOV(problem.PValues).apAssSol};
problem.AssLowP.Ass = {strOV(problem.PValues).apAss};

problem.AssLowRIT.SOL = {strOV(problem.RITValues).apAssSol};
problem.AssLowRIT.Ass = {strOV(problem.RITValues).apAss};

problem.AssBigProb.SOL = {strOV(problem.Big).apAssSol};
problem.AssBigProb.Ass = {strOV(problem.Big).apAss};

problem.AssAll.SOL = {strOV(problem.All).apAssSol};
problem.AssAll.Ass = {strOV(problem.All).apAss};

%% Ask user to go through all problem files
if isequal(input('Do you want to go through all problem files? Yes = 1, No = else '),1)
    for nF = 1:sum(problem.All)
        clc;
        disp(['There are ' num2str(sum(problem.All)) ' problems found'])
        disp(['Current problem: ' num2str(nF)])
        currSOLFile = problem.AssAll.SOL{nF};
        currAssFile = problem.AssAll.Ass{nF};
        if any(contains(problem.AssLowP.SOL,currSOLFile))
            disp('This file has a problem with the P-value');
        end
        if any(contains(problem.AssLowRIT.SOL,currSOLFile))
            disp('This file has a problem with the RIT-value');
        end
        disp('Remember that these files are copies and you should also make changes in cleansource');
        edit(currSOLFile);
        edit(currAssFile);
        % Get some editor information for setting the carret and closing
        % files
        edtSvc  = com.mathworks.mlservices.MLEditorServices ;
        edtList = edtSvc.getEditorApplication.getOpenEditors.toArray ;
        edtList(end).bringToFront;
        endPosition = edtList(end).getDocument.getLength;
        edtList(end).setCaretPosition(endPosition);
        % Also set caret for second to last files
        endPosition = edtList(end-1).getDocument.getLength;
        edtList(end-1).setCaretPosition(endPosition);
        commandwindow
        if isequal(input('Do you want to close The opened scripts? Yes = 1, No = else '),1)
            % Close opened scripts
            edtSvc  = com.mathworks.mlservices.MLEditorServices ;
            edtList = edtSvc.getEditorApplication.getOpenEditors.toArray ;
            edtList(end).close;
            edtList(end-1).close;
        end
    end
end

end % function