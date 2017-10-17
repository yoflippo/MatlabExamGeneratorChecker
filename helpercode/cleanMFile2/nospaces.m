function oTxt = nospaces(varargin)
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

%% Parse varargin

% Test for right input
minargin = 1;
maxargin = minargin+2;
if nargin < minargin
    error([ mfilename ':Needs at minimum' num2str(minargin) ' argument(s) ']);
end
if nargin > maxargin
    error([ mfilename ':Needs max ' num2str(minargin) ' arguments ']);
end

% Create variables that need to be filled
blReadFromFile = true;
for narg = 1:nargin
    sc = upper(varargin{narg});
    switch sc
        case {'OT', 'ONLYTXT', '-ONLYTXT', '-OT'}
            txt = varargin{narg+1};
        otherwise
            apFile = varargin{narg};
    end
end

%% Read the file
if blReadFromFile
    try
        txt = readTxtFile(apFile);
    catch
        error([mfilename ': Could not read the file']);
    end
end

%% Remove spaces
if ~isempty(txt) && isequal(txt{1},-1)
    oTxt = [];
else
    oTxt = strrep(txt,' ','');
end

% %% Write to file
% writetxtfile(apFile,txt);
% oTxt = txt;

end