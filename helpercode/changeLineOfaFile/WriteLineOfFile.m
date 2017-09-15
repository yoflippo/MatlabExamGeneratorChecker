function WriteLineOfFile(varargin)
%WRITELINEOFILE A function a line of a text based file
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
%               absPath:   the absolute path of file
%               lineNumber:  default 1
%               txt: string to write
%
% RETURN:
%               nothing
%
% EXAMPLES:
%               WriteLineOfFile(path,linenumber,txt);
%

% $Revision: 0.0.0 $  $Date: 2017-09-06 $
% Creation of the function

absPathFile = varargin{1};
if nargin <= 2
    error([mabsPathFile 'does not handle: ' num2str(nargin) ' arguments']);
elseif nargin == 3
    lineNumber = varargin{2};
    lineTxt = varargin{3};
elseif nargin > 3
    error([mabsPathFile 'does not handle: ' num2str(nargin) ' arguments']);
end

% read the file
delimiter = {''};
formatSpec = '%s%[^\n\r]';
fileID = fopen(absPathFile,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,...
    'TextType', 'string',  'ReturnOnError', false);

if length(dataArray{1,1}) < lineNumber
   % Fill dataArray
   for nEl = length(dataArray{1,1})+1:lineNumber-1
       dataArray{1,1}(nEl) = '';
   end
end
% write txt to line
dataArray{1,1}(lineNumber) = lineTxt;
% close the file
fclose(fileID);
% delete the current file
delete(absPathFile)
% write to file
fileID = fopen(absPathFile,'w');
for i = 1:length(dataArray{1,1})
   fprintf(fileID,'%s\r\n',dataArray{1,1}{i});
end
% close the file
fclose('all');


end %function
