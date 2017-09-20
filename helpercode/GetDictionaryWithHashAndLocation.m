function Dic = GetDictionaryWithHashAndLocation(LocationOfBaseFiles,SOLPOSTFIX)
%GETDICTIONARYWITHHASHANDLOCATION This function will get a dictionary with
%all the HashCodes from the base files generated. This dictionary can be
%used to quickly compare files.
%
% THIS FILE DEPENDS ON InitAll.m
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

% $Revision: 0.0.0 $  $Date: 20xx-xx-xx $
%<Description>

nameAssignmentFolder = LocationOfBaseFiles;

mfiles = dir([nameAssignmentFolder filesep '*.m']); 

  XXX
  
  Zoeken naar postfix en daar alle hashcodes uitlezen en opslaan in dictionary
% % % % % % % % % % % % Get an overview of files
% % % % % % % % % % % mfiles = readFilesInSubFolder(nameAssignmentFolder,'.m');
% % % % % % % % % % % 
% % % % % % % % % % % % Filter the relevant files, only files with 'vraag' are relevant
% % % % % % % % % % % mfilesOI = strfind(mfiles,'vraag_'); %files of interest
% % % % % % % % % % % mfilesOI2 = strfind(mfiles,'opdracht_');
% % % % % % % % % % % % combine the two types of assignments
% % % % % % % % % % % for i = 1:length(mfilesOI)
% % % % % % % % % % %     % add the items of second file to the first
% % % % % % % % % % %     if length(mfilesOI2{i}) > 1
% % % % % % % % % % %         mfilesOI{i} = mfilesOI2{i};
% % % % % % % % % % %     end
% % % % % % % % % % % end
% % % % % % % % % % % 
% % % % % % % % % % % % Further filter the files down to files without the postfix
% % % % % % % % % % % mfilesOI = strfind(mfiles,SOLPOSTFIX); %files of interest
% % % % % % % % % % % mfilesOI = mfiles(cellfun('isempty',mfilesOI));
% % % % % % % % % % % 
% % % % % % % % % % % % Get HashCode of each file
% % % % % % % % % % % hashsize = 32;
% % % % % % % % % % % underscorePos = strfind(mfilesOI,'_');
% % % % % % % % % % % 
% % % % % % % % % % % % find hashcodes with more than 5 underscores, this number is based on the
% % % % % % % % % % % % actual paths with the filenames and the number of underscores, this could
% % % % % % % % % % % % change in another environment
% % % % % % % % % % % numberOfUnderScores = cellfun(@length,underscorePos);
% % % % % % % % % % % 
% % % % % % % % % % % % extra filtering so only the right files remain
% % % % % % % % % % % NUMOFUNDERSCORES = max(numberOfUnderScores);
% % % % % % % % % % % mfilesOI = mfilesOI(numberOfUnderScores==NUMOFUNDERSCORES);
% % % % % % % % % % % underscorePos = strfind(mfilesOI,'_');
% % % % % % % % % % % 
% % % % % % % % % % % % Get the hascodes
% % % % % % % % % % % for h = 1:length(mfilesOI)
% % % % % % % % % % %     hashPos = underscorePos{1,h}(NUMOFUNDERSCORES-1:NUMOFUNDERSCORES);
% % % % % % % % % % %     HashCodes{h} = mfilesOI{1,h}(hashPos(1)+1:hashPos(2)-1) ;
% % % % % % % % % % % end
% % % % % % % % % % % 
% % % % % % % % % % % % make an absolute path
% % % % % % % % % % % mfilesOI = fullfile(pwd,mfilesOI);
% % % % % % % % % % % 
% % % % % % % % % % % % Combine the relevant files in a Container (dictionary) so the
% % % % % % % % % % % % hashcode is combined with a location for fast lookup
% % % % % % % % % % % Dic = containers.Map(HashCodes,mfilesOI);

end
