%COPYTHEMULTIPLECHOICECHECKFILES this script copies the template M-file to
%check the multiplile choice questions to every file with the '_CHECK'
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
% 
% EXAMPLES:
%
%

% $Revisi0n: 0.0.0 $  $Date: 20xx-xx-xx $
%<Description>

Constants
%% Get abspath of template file
absPathTemplate = fullfile(GetPathOneLevelUp(mfilename('fullpath')),'CheckMCTemplate.m');

%% Get all directories with Multiple Choice questions
mcdirs = dir('**\*_Multiplechoice*.m');
currPath = pwd;
%% Find all files ending with _CHECK
for i = 1:length(mcdirs)
   cd(mcdirs(i).folder)
   checkFiles = dir('**\*_CHECK*.m')
   % Copy the template
   for j = 1:length(checkFiles)
       copyfile(absPathTemplate,fullfile(checkFiles(j).folder,checkFiles(j).name));
   end
end
cd(BASEFOLDER)