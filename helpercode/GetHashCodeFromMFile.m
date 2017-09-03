function [HashCode] = GetHashCodeFromMFile(fileLocationAbsPath)
%GETHASHCODEFROMMFILE This script extracts the HashCode from a certain
%file.
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
% Warning: this functionality of this file heavily depends on agreements
% regarding file structure. For instance: the hashcode of every exercise is
% on the second line. Changing these structures will lead to errors.
%
%
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               fileLocationAbsPath:  Is it not clear?
%
% RETURN:
%               HashCode:     The hashcode of the m-file
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-07-26 $
% Creation of ilfe

%% Read the data of file
delimiter = {''};
formatSpec = '%s%[^\n\r]';
fileID = fopen(fileLocationAbsPath,'r');

dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,...
    'TextType', 'string',  'ReturnOnError', false);
fclose(fileID);
HashString = dataArray{1,1}(2,:);
HashString = char(HashString(1));
underscorePos = strfind(HashString,'|');
lu = length(underscorePos);
if lu ~= 2
    error('the number of symbols that separate the Hashcode is incorrect');
end
HashCode = HashString(underscorePos(1)+1:underscorePos(2)-1);



