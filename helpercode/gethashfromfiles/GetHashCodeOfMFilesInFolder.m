function [HashCodes AbsPathHashCodes]= CheckHashCodeOfMFilesInFolder(absPathFolder)
%CHECHHASCODEOFMFILESINFOLDER This function checks if all the m-files in
%the given directory contain hashcodes as created by us. The goal is to
%check if students altered the forbidden parts of the given code.
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

% $Revision: 0.0.0 $  $Date: 2017-07-26 $
% Creation of function

% Get an overview of files
currPath = pwd;
cd(absPathFolder)
mfiles = dir('**\*.m');
HashCodes = [];
AbsPathHashCodes = [];
cnt = 1;
for i = 1:length(mfiles)
    try
        absPath = fullfile(mfiles(i).folder,mfiles(i).name);
        hash = GetHashCodeFromMFile(absPath);
        HashCodes{cnt} = hash;
        AbsPathHashCodes{cnt} = absPath;
        cnt = cnt + 1;
    catch
    end
end
% only return unique values
HashCodes = unique(HashCodes);
AbsPathHashCodes = unique(AbsPathHashCodes);
cd(currPath);