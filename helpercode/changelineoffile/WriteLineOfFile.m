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

%% read the file
txtFile = readTxtFile(absPathFile);

if length(txtFile) < lineNumber
    % Fill txtFile
    for nEl = length(txtFile)+1:lineNumber-1
        txtFile(nEl) = '';
    end
end
% write txt to line
txtFile(lineNumber) = lineTxt;
% delete the current file
delete(absPathFile)

%% write to file
try
    fileID = fopen(absPathFile,'w');
    for i = 1:length(txtFile)
        fprintf(fileID,'%s\r\n',txtFile(i));
    end
    % close the file
    fclose('all');
catch
    fclose('all');
end


end %function
