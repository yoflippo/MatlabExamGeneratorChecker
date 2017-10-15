function [ sAssignedMC ] = createMCQ( AssInfo,nOfMulChoiceAssignment,nm )

rpExamDirMC = fullfile(nm.Exam,'deelopdracht_1');
mkdirIf(rpExamDirMC)
rpExamDirMCSOL = fullfile([nm.Exam 'SOL'],'deelopdracht_1');
mkdirIf(rpExamDirMCSOL)
nMCQuestions = length(AssInfo.MC);
% Preallocate struct
sAssignedMC(1:nOfMulChoiceAssignment) = struct('apSOL',[],'apQ',[]);
for n = 1:nOfMulChoiceAssignment
    % Logic to deal with the number of questions
    nRound = floor(n/nMCQuestions);
    nMC = mod(n,nMCQuestions);
    if isequal(nMC,0)
        nMC = nMCQuestions;
        nQ = nMC*nRound;
    else
        nQ = nMC+(nRound*nMCQuestions);
    end
    nRound = nRound+1;
    % Assume the AssInfo is randomized
    Q = AssInfo.MC(nMC).files(nRound);
    % Create usefull information
    apQSOL = fullfile(Q.folder,Q.name);
    apQ = replace(apQSOL,'_SOL','');
    % Copy MC-question to new file
    rpFinQ = fullfile(rpExamDirMC,['vraag_' num2str(nQ) '.m']);
    copyfile(apQ,rpFinQ);
    rpFinQSOL = fullfile(rpExamDirMCSOL,['vraag_' num2str(nQ) '.m']);
    copyfile(apQSOL,rpFinQSOL);
    % Rename all txt of new questions.
    replaceVraagOpdracht(rpFinQ,nQ);
    % Make a record of assignment in sAssignedMC
    sAssignedMC(nQ).apSOL = apQSOL;
    sAssignedMC(nQ).apQ = rpFinQ;
end

end%function

