function addSemiColons(apScript)
%ADDSEMICOLONS A script that automatically adds semicolons to a file.
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
%               apScript:   The absolute path of a script/function
%
% RETURN:
%               nothings
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-05-10 $
% Creation of script

faults = checkcode(apScript,'-id','-fullpath');

%% Search struct faults for certain keywords which say a semicolon is
% missing.
keywords = {'NOPRT' 'PRTCAL'};
index = [];
for nK = 1:length(keywords)
    index = [index find(strcmp({faults.id}, keywords{nK})==1)];
end
index = sort(index);

%% Read the file
try
    delimiter = {'\n'};
    formatSpec = '%s';
    fileID = fopen(apScript,'r');
    txt = textscan(fileID, formatSpec,'Whitespace','', 'Delimiter', delimiter,...
        'TextType', 'string',  'ReturnOnError', false);
    fclose(fileID);
    txt = txt{1,1};
catch
    error([mfilename ': Could not read the file']);
end
%% Add semicolons

% Remove trailling space
txt = deblank(txt);

% Browse through faults
for n = 1:length(index)
    idx = faults(index(n)).line;
    txt{idx} = [txt{idx} ';'];
end

% Add a semicolon for every file that ends with )
bck = ')';
% Walk through txt
for nL = (faults(1).line+1):length(txt)
    tmp = txt{nL}; % Remove cell bothersomeness and trailing spaces
    if ~isempty(tmp) && contains(tmp(end-1:end),bck) && ~contains(tmp(end-1:end),';')
        tmp = [tmp ';'];
    end
    txt{nL} = tmp;
end

%% Write to file
try
    fileID = fopen(apScript,'w');
    for i = 1:length(txt)
        fprintf(fileID,'%s\r\n',txt{i});
    end
    % close the file
    fclose('all');
catch
    fclose('all');
    error([mfilename ': Could not write to the file']);
end


end