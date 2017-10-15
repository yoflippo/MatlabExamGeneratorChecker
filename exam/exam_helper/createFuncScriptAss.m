function sAssignedMC = createFuncScriptAss( AssInfo, nOfScriptsFunctions,nm )

rpExamDirFS = fullfile(nm.Exam,'deelopdracht_2');
mkdirIf(rpExamDirFS)
mkdirIf(fullfile(rpExamDirFS,'data_bestanden'));
rpExamDirFSSOL = fullfile([nm.Exam 'SOL'],'deelopdracht_2');
mkdirIf(rpExamDirFSSOL)
mkdirIf(fullfile(rpExamDirFSSOL,'data_bestanden'));
numFS = length(AssInfo.FuncScrip);

if nOfScriptsFunctions > numFS
    warning([mfilename ': You are generating too many assignments. Continuing will lead to very similar assignments']);
end

sAssignedMC(1:nOfScriptsFunctions) = struct('apSOL',[],'apQ',[]);
for n = 1:nOfScriptsFunctions
    % Logic to deal with the number of questions
    nRound = floor(n/numFS);
    nFS = mod(n,numFS);
    if isequal(nFS,0)
        nFS = numFS;
        nQ = nFS*nRound;
    else
        nQ = nFS+(nRound*numFS);
    end
    nRound = nRound+1;
    % Assume the AssInfo is randomized
    Q = AssInfo.FuncScrip(nFS).files(nRound);
    apQSOL = fullfile(Q.folder,Q.name);
    apQ = replace(apQSOL,'_SOL','');
    % Copy function/script to new file
    rpFinQ = fullfile(rpExamDirFS,['opdracht_' num2str(nQ) '.m']);
    copyfile(apQ,rpFinQ);
    rpFinQSOL = fullfile(rpExamDirFSSOL,['opdracht_' num2str(nQ) '.m']);
    copyfile(apQSOL,rpFinQSOL);
    % Rename all txt of new questions.
    replaceVraagOpdracht(rpFinQ,nQ);
    % Make a record of assignment in sAssignedMC
    sAssignedMC(nQ).apSOL = apQSOL;
    sAssignedMC(nQ).apQ = rpFinQ;
end

end%function

