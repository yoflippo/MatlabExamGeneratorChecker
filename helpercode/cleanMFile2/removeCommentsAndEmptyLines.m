function removeCommentsAndEmptyLines(apFile)
%REMOVECOMMENTSANDEMPTYLINES 
% A function that removes Matlab comments from a txt-file and removes empty
% lines.
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
%               apFile:   the absolute path of mfile
%
% RETURN:
%               nothing.
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-10-05 $
% Creation of this file.

%% Read the file
try
    delimiter = {'\n'};
    formatSpec = '%s';
    fileID = fopen(apFile,'r');
    txt = textscan(fileID, formatSpec,'Whitespace','', 'Delimiter', delimiter,...
        'TextType', 'string',  'ReturnOnError', false);
    fclose('all');
    txt = txt{1,1};
catch
    error([mfilename ': Could not read the file']);
end

% Remove comments
for nL = 1:length(txt)
    if contains(txt(nL),'%')
        txt(nL) = extractBefore(txt(nL),'%');
    end
end


% Remove trailling space
txt = deblank(txt);
% Remove empty lines
txt(all(txt=="",2),:)=[];


%% Write to file
writetxtfile(apFile,txt);


end