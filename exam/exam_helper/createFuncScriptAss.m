function sAssigned = createFuncScriptAss(AssInfo,nOfScriptsFunctions,nm)
%CREATEFUNCSCRIPTASS A function that creates a number of script/function
%assignments based on a randomized struct (AssInfo).
%
% ------------------------------------------------------------------------
%    Copyright (C) 2017  M. Schrauwen (markschrauwen@gmail.com)
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.
% ------------------------------------------------------------------------
% 
% DESCRIPTION:
%
% 
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
% 
% PARAMETERS: ,,
%               AssInfo:                A struct with randomized MC and
%                                       script assignments.
%               nOfScriptsFunctions:    variabele with the number of
%                                       assignments
%               nm:                     structs with names used in
%                                       eCreateExam.m
%
% RETURN:       
%               sAssigned:    A struct with the chosen assignments.
% 
% EXAMPLES:
%               sAssignedtmp2 = createFuncScriptAss( AssInfo, nOfScriptsFunctions,nm );
%

% $Revision: 0.0.0 $  $Date: 2017-10-13 $
% Creation of this function.

%% Some basic administration
rpExamDirFS = fullfile(nm.Exam,'deelopdracht_2');
mkdirIf(rpExamDirFS)
removeShitFromDir(rpExamDirFS);
mkdirIf(fullfile(rpExamDirFS,'data_bestanden'));
rpExamDirFSSOL = fullfile([nm.Exam 'SOL'],'deelopdracht_2');
mkdirIf(rpExamDirFSSOL)
mkdirIf(fullfile(rpExamDirFSSOL,'data_bestanden'));
numFS = length(AssInfo.FuncScrip);

if nOfScriptsFunctions > numFS
    txtwarning = [mfilename ': You are generating too many assignments. Continuing will lead to very similar assignments'];
    txtwarning = ['You are generating: ' num2str(nOfScriptsFunctions) ' of ' num2str(numFS) ' thematic variants'];
    warning(txtwarning)
end
numVariants = sum([AssInfo.FuncScrip.numVariants]);
if nOfScriptsFunctions >= sum([AssInfo.FuncScrip.numVariants])
     error([mfilename ': You want to generate more assignments than are availabe: ' num2str(nOfScriptsFunctions) ' of ' num2str(numVariants)]);   
end

%% Get the dff of assignments and their indices
for nD = 1:10
   eval(['L(' num2str(nD)  ').ind = find([AssInfo.FuncScrip.points] == ' num2str(nD) ');']);
   eval(['L(' num2str(nD)  ').num = length(L(' num2str(nD)  ').ind);']);
   L(nD).selected = 0;
end
dff.L = L;

%% Define the difficulty progress of the exam.
%       PROGRESS OF dff OF EXAM
% dff
% |             _p_ _
% |           _/     \
% |         _/        \
% |       _/q         z\
% |______/              \___
%_|_________________________ time
%        t1    t2   t3   t4   

dff.t1 = 0.15; % L0
dff.t2 = 0.70; % Lmax around 60% of exam
dff.t3 = 0.75; % Lmax
dff.t4 = 0.95; % L0
% Range
dff.min = min([AssInfo.FuncScrip.points]);
dff.max = max([AssInfo.FuncScrip.points]);
% Difficulty phases
dff.tIndex0 = 1; 
dff.tIndex1 = round(dff.t1 * nOfScriptsFunctions);
dff.tIndex2 = round(dff.t2 * nOfScriptsFunctions);
dff.tIndex3 = round(dff.t3 * nOfScriptsFunctions);
dff.tIndex4 = round(dff.t4 * nOfScriptsFunctions);
dff.tIndex5 = nOfScriptsFunctions; 
% Indices
dff.t01 = round(linspace(dff.min,dff.min,dff.tIndex1-dff.tIndex0));
dff.t12 = round(linspace(dff.min+1,dff.max-1,dff.tIndex2-dff.tIndex1));
dff.t23 = round(linspace(dff.max,dff.max,dff.tIndex3-dff.tIndex2));
dff.t34 = round(linspace(dff.max-1,dff.min+1,dff.tIndex4-dff.tIndex3));
dff.t45 = round(linspace(dff.min,dff.min,dff.tIndex5+1-dff.tIndex4));
% Get index based on dff.pX
indices = [dff.t01 dff.t12 dff.t23 dff.t34 dff.t45];
plot(indices); grid on; ylim([0 dff.max+1]); xlim([1 nOfScriptsFunctions]);
yticks(round([linspace(dff.min,dff.max,length(1:dff.max))]))%ytickformat('%1d') 
ylabel('Difficulty (1-10)' ); xlabel('Number of assignments')
title(['Difficulty of this exam: ' extractAfter(nm.CurrExamDir,'_')]); 
savefig([nm.CurrExamDir '_DifficultyProgress.fig'])
%% The actual assignment by assuming a randomized struct AssInfo.
sAssigned(1:nOfScriptsFunctions) = struct('apSOL',[],'apQ',[]);
for n = 1:nOfScriptsFunctions
    % Some hard te read logic, to select the right indices
    dff.L(indices(n)).selected = dff.L(indices(n)).selected + 1;
    nRound = ceil(dff.L(indices(n)).selected / dff.L(indices(n)).num);
    nFS = mod(dff.L(indices(n)).selected + dff.L(indices(n)).num-1,dff.L(indices(n)).num)+1;
    nFS = dff.L(indices(n)).ind(nFS);
    % Some logic in case all variants of question are used...
    nWhile = 1;
    try
    while nRound > AssInfo.FuncScrip(nFS).numVariants
        nn = nWhile + n;
        dff.L(indices(nn)).selected = dff.L(indices(nn)).selected + 1;
        nRound = ceil(dff.L(indices(nn)).selected / dff.L(indices(nn)).num);
        nFS = mod(dff.L(indices(nn)).selected + dff.L(indices(nn)).num-1,dff.L(indices(nn)).num)+1;
        nFS = dff.L(indices(nn)).ind(nFS);
        nWhile = nWhile + 1;
    end
    % Assume the AssInfo is randomized
    Q = AssInfo.FuncScrip(nFS).files(nRound);
    Qpoints = AssInfo.FuncScrip(nFS).points;
    catch err    
        error([mfilename ': Probably too litte variants of assignments.' newline err.message]);
    end
    
    apQSOL = fullfile(Q.folder,Q.name);
    apQ = replace(apQSOL,'_SOL','');
    
    % Copy function/script to new file
    rpFinQ = fullfile(rpExamDirFS,['opdracht_' num2str(n) '.m']);
    copyfile(apQ,rpFinQ);
    rpFinQSOL = fullfile(rpExamDirFSSOL,['opdracht_' num2str(n) '.m']);
    copyfile(apQSOL,rpFinQSOL);
    % Rename all txt of new questions.
    replaceVraagOpdracht(rpFinQ,n);
    % Make a record of assignment in sAssigned
    sAssigned(n).apSOL = apQSOL;
    sAssigned(n).apQ = rpFinQ;
    sAssigned(n).points = Qpoints;
end

end%function

