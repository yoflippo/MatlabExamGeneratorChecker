function otxt = nospaces(apFile)
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
%               apFile:   The absolute path of a script/function
%
% RETURN:
%               nothings
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-05-10 $
% Creation of script



%% Read the file
try
    txt = readTxtFile(apFile);
catch
    error([mfilename ': Could not read the file']);
end

%% Remove spaces
if ~isempty(txt) && isequal(txt{1},-1)
    otxt = [];
else
    otxt = strrep(txt,' ','');
end

% %% Write to file
% writetxtfile(apFile,txt);
% otxt = txt;

end