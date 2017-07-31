function Dic = GetDictionaryWithHashAndLocation(LocationOfBaseFiles)
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

% Get an overview of files
mfiles = readFilesInSubFolder(nameAssignmentFolder,'.m');

% Filter the relevant files, only files with 'vraag' are relevant
mfilesOI = strfind(mfiles,'vraag_'); %files of interest
mfilesOI2 = strfind(mfiles,'opdracht_');
% combine the two types of assignments
tmp = mfilesOI;
for i = length(mfilesOI)+1:length(mfilesOI)+length(mfilesOI2)
    tmp{i} = mfilesOI2{i-length(mfilesOI)};
end
mfilesOI = tmp;
% Test for a certain length
mfiles = mfiles(cellfun('length',mfilesOI)==2);

HIER GEBLEVEN IK WIL GRAAG ALLE MFILES DIE BEGINNEN MET OPDRACHT_ en VRAAG_ 
worden gefilterd en in een dictionary worden gestopt zodat ik met CheckStudent-
Submissions.m opdracht kan vergelijken met elkaar.

Hierna moet ik opdrachten runnen en punten tellen (administratie bijhouden) 
dat is een leuk en klein klusje. Ik dit jaar de hier gemaakte scripts nog wel
verder moeten aanpassen om het helemaal netjes werkend te krijgen.

% Further filter the files down to files without the postfix '_ans'
mfilesOI = strfind(mfiles,SOLPOSTFIX); %files of interest
mfilesOI = mfiles(cellfun('isempty',mfilesOI));

% Get HashCode of each file
underscorePos = strfind(mfilesOI,'_');
numUnderScores = length(underscorePos{2});
hashPos = underscorePos{1,2}(numUnderScores-1:numUnderScores);

for h = 1:length(mfilesOI)
    HashCodes{h} = mfilesOI{1,h}(hashPos(1)+1:hashPos(2)-1) ;
end
% Combine the relevant files in a Container (dictionary) so the
% hashcode is combined with a location for fast lookup
Dic = containers.Map(HashCodes,mfilesOI);

end
