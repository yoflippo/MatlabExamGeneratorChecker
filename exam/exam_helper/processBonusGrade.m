function [bonus] = processBonusGrade(ap)
% PROCESSBONUSGRADE <short description>
%
% ------------------------------------------------------------------------
%    Copyright (C) 2019  M. Schrauwen (markschrauwen@gmail.com)
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
% BY: 2019  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               varargin:   <text>
%               varargin:   <text>
%
% RETURN:
%               outvar:     <text>
%               outvar:     <text>
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2019-01-22 $
% Creation of this function.
oldPath = pwd;
cd(ap.CurrExam)
if exist('bonus','dir')
    cd('bonus')
    delete('bonus.mat')
    matfiles = dirmf('.mat');
    sizesBonus = [];
    if ~isempty(matfiles)
        for n = 1:length(matfiles)
            load(matfiles(n).name);
            bonusgrades{n} = studentMatrix;
            sizeBonus(n) = length(studentMatrix);
        end
    else
        disp([mfilename ': no bonusfiles found' ]);
        return;
    end
    
    %% Calculate bonusgrade to add to examgrade
    % Find largest files
    idxMax = find(sizeBonus==max(sizeBonus));
    bonusgrades = preProcesBonusGrades(bonusgrades,idxMax);
    for len = 1:length(bonusgrades{idxMax})
        % Get student and check if it exist for all
        currBonusrades = bonusgrades{idxMax};
        currStud = currBonusrades(len,1);
        currGrades(idxMax) = currBonusrades(len,2);
        
        % create vector of bonus assignment without current max. length
        % assignment
        vecIdxBonusAss = 1:length(sizeBonus);
        vecIdxBonusAss(vecIdxBonusAss==idxMax)=[];
        for nBon = vecIdxBonusAss
            if any(bonusgrades{nBon}(:,1)==currStud)
                idx = find(bonusgrades{nBon}(:,1)==currStud);
                currGrades(nBon) = bonusgrades{nBon}(idx,2);
            else
                currGrades(nBon) = 1;
            end
        end
        
        currAvgGrade = sum(currGrades)/length(sizeBonus);
        % Recalculate to a number between 0..1 to add it to exam
        currExtraExamPoint = (currAvgGrade-1)/9;
        bonus(len,:) = [currStud currGrades currExtraExamPoint];
    end
    save('bonus.mat','bonus');
else
    disp([mfilename ': bonus directory does not exist' ]);
end
cd(oldPath)

%% Make sure that if a student only participated in one of the last bonus assignments
% is still processed

end %function

%% Add students that did not participate in largest list to the largest list 
% so they will be processed.
function [bonusgrades] = preProcesBonusGrades(bonusgrades,idxMax)
largestList = bonusgrades{idxMax}(:,1);
for i = 1:length(bonusgrades)
    if ~isequal(i,idxMax) %prevent looping through largest list
        for nF = 1:length(bonusgrades{i})
            %find unique student not present in largest bonus grade
            %collection
            currStudPP = bonusgrades{i}(nF,1);
            if ~any(largestList==currStudPP)
                bonusgrades{idxMax}(end+1,1) = currStudPP;
                bonusgrades{idxMax}(end,i) = 1;
            end
        end
    end
end

end
