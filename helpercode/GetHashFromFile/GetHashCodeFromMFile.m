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
% Creation of file
% $Revision: 0.0.0 $  $Date: 2017-09-21 $
% Made function much more efficient by assuming that the hashcode is on the
% second line of the file

%% Check if File exists
dbstop if error
if exist(fileLocationAbsPath) == 0
    error('The file does not exist');
end

%% Read the second line of a File containing a Hash Code
fileID = fopen(fileLocationAbsPath,'r');
try
    lineWithHash = fgetl(fileID);
    lineWithHash = fgetl(fileID);
    fclose(fileID);
catch extra
    fclose(fileID);
    disp(extra);
    error('GetHashCodeFromMFile: error in fgetl()');
end

%% Extra Hash Code
underscorePos = strfind(lineWithHash,'|');
lu = length(underscorePos);
if lu ~= 2
%    warning('No hashcode at expected location');
    return;
end
HashCode = lineWithHash(underscorePos(1)+1:underscorePos(2)-1);

end

