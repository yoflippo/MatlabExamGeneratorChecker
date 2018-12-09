function biostatFindAss()
% BIOSTATFINDASS helper file for biostatica Matlab that tries to open a
% clean source file (1) from a bonus assignment (2) absolute path or the
% other way around.
%
% It does this by expecting the last file in the Editor to be either (1) or
% (2).
%
% This will help the developer to easily adjust mistakes in either
% one of the type of files.
%
% ------------------------------------------------------------------------
%    Copyright (C) 2018  M. Schrauwen (markschrauwen@gmail.com)
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
%
% BY: 2018  M. Schrauwen (markschrauwen@gmail.com)
%
%
% EXAMPLES:
%           In CW: biostatFindAss
%

% $Revision: 0.0.0 $  $Date: 2018-12-08 $
% Creation of this function.

con = ConstantsClass;
edtSvc  = com.mathworks.mlservices.MLEditorServices ;
edtList = edtSvc.getEditorApplication.getOpenEditors.toArray ;
currFile = char(edtList(end).getLongName);

%% Determine if the Constantsclass is loaded in Workspace
if ~exist('con','var')
    txterror = ['' newline];
    txterror = [txterror '' newline];
    error([newline mfilename ': ' newline 'ConstantsClass is not loaded' newline txterror]);
end

%% Determine if currently opened file is theses / programming Assignment
blTheses = false;
if contains(currFile,con.TYPEASSIGNMENTS{1}) || contains(currFile,con.TYPEASSIGNMENTSDUTCH{1})
    blTheses = true;
elseif contains(currFile,con.TYPEASSIGNMENTS{2}) || contains(currFile,con.TYPEASSIGNMENTSDUTCH{2})
    blTheses = false;
else
    txterror = ['' newline];
    txterror = [txterror '' newline];
    error([newline mfilename ': ' newline 'Could not determine type of assignment' newline txterror]);
end

%% Analyse current file, determine if it is clean (1) or bonus (2)
if contains(currFile,con.DIRCLEANSRC)
    % Determine week
    clnWeek = currFile(strfind(currFile,'week')+length('week'));
    clnWeekNum = str2double(clnWeek);
    % Determine which Bonusassignment
    idxBonusAss = [];
    for nBA = 1:length(con.BONUSASSIGNMENTS)
        if any(ismember(con.BONUSASSIGNMENTS{nBA},clnWeekNum))
            idxBonusAss = nBA;
            break;
        end
    end
    if isempty(idxBonusAss)
        txterror = ['' newline];
        txterror = [txterror '' newline];
        error([newline mfilename ': ' newline 'Not present in Bonus Assignmnets ' newline txterror]);
    end
    apTwinFile = fullfile(con.AP_ASSIGNMENTS,[con.NMBONUSASSIGNMENTDIR num2str(idxBonusAss)]);
    numBonusAss = length(con.BONUSASSIGNMENTS{idxBonusAss});
    if blTheses
        if ~isequal(clnWeekNum,numBonusAss)
            numThesesInBonusAss = find(con.BONUSASSIGNMENTS{idxBonusAss}==clnWeekNum);
        else
            numThesesInBonusAss = clnWeekNum;
        end
        apTwinFile = fullfile(apTwinFile,[con.NAMESUB_ASSIGNMENT num2str(numThesesInBonusAss)]);
        prefix = [con.TYPEASSIGNMENTSDUTCH{1} '_'];
        assNum = currFile(strfind(currFile,prefix)+length(prefix))
        apTwinFile = fullfile(apTwinFile,[prefix assNum])
        winopen(apTwinFile)
    else % find programming subassignmnet
        numProgInBonusAss = find(con.BONUSASSIGNMENTS{idxBonusAss}==clnWeekNum)+numBonusAss;
        apTwinFile = fullfile(apTwinFile,[con.NAMESUB_ASSIGNMENT num2str(numProgInBonusAss)]);
        [apCurrFile,nmAss1,~] = fileparts(currFile);
        [~,nmAss2,~] = fileparts(apCurrFile);
        apTwinFile = fullfile(apTwinFile,nmAss2,nmAss1);
        edit(apTwinFile)
    end
elseif strfind(currFile,con.NMBONUSASSIGNMENTDIR) %% A bonusassignment path is given, determine the clean path
    if blTheses
        [rpTmp,nameTheses,ext] = fileparts(currFile);
        [rpTmp,nameTheseNum] = fileparts(rpTmp);
        [rpTmp,nameSubAss] = fileparts(rpTmp);
        [rpTmp,nameBonusAss] = fileparts(rpTmp);
        strBonusAss = extractAfter(nameBonusAss,con.NMBONUSASSIGNMENTDIR);
        numBonusAss = str2double(strBonusAss);
        apTwinFile = fullfile(con.BASEFOLDER,con.DIRCLEANSRC,con.DIRTHESES,con.DIRTHESES_CLEANSRC);
        idx = regexp(nameSubAss,'([0-9])');
        
        weekNum = con.BONUSASSIGNMENTS{numBonusAss};
        weekNum = weekNum(str2double(nameSubAss(idx)));
        apTwinFile = fullfile(apTwinFile,['week' num2str(weekNum)]);
        dirs = dir(apTwinFile);
        apTwinFile = fullfile(apTwinFile,dirs(3).name,nameTheseNum);
        %            dirs = dir([apTwinFile filesep '**']);
        winopen(apTwinFile)
    else %programming
        [rpTmp,nameProgAss,ext] = fileparts(currFile);
        [rpTmp,nameProgVersion] = fileparts(rpTmp);
        [rpTmp,nameProgSubAss] = fileparts(rpTmp);
        [rpTmp,nameBonusAss] = fileparts(rpTmp);
        strBonusAss = extractAfter(nameBonusAss,con.NMBONUSASSIGNMENTDIR);
        numBonusAss = str2double(strBonusAss);
        apTwinFile = fullfile(con.BASEFOLDER,con.DIRCLEANSRC,con.DIRCLEANSRC_PROGASS);
        
        idx = regexp(nameProgSubAss,'([0-9])');
        weekNumbers = con.BONUSASSIGNMENTS{numBonusAss};
        weekNum = weekNumbers(str2double(nameProgSubAss(idx))-length(weekNumbers));
        apTwinFile = fullfile(apTwinFile,['week' num2str(weekNum)]);
        dirs = dir(apTwinFile);
        apTwinFile = fullfile(apTwinFile,dirs(3).name,nameProgVersion,[nameProgAss ext]);
        edit(apTwinFile);
    end
else
    txterror = ['' newline];
    txterror = [txterror '' newline];
    error([newline mfilename ': ' newline 'Last file opened in editor could not be determined' newline 'to be a biostatica Matlab file' txterror]);
end

end %function


