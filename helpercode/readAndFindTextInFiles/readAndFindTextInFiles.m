function output = readAndFindTextInFiles(varargin)
%READANDFINDTEXTINFILES a function to find all kinds of strings in a
%textfile
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
%               'ext':  string with file extension
%               'abspath':  string with absolute path of a directory
%               'askuser': declare this string to ask the user for a path.
%               'searchstring': the searchstring
%               'ss' : the searchstring
%
% RETURN:
%               result: variabele with all files containing the string
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-09-13 $
% Creation of the function

%% Parse varargin
namefunction = 'readAndFindTextInFiles';

maxargin = 2*5;
minargin = 2;
if nargin < minargin
    error([ namefunction ':Needs at minimum' num2str(minargin) ' argument(s) ']);
end
if nargin > maxargin
    error([ namefunction ':Needs max ' num2str(minargin) ' arguments ']);
end

fExtension = [];
AbsPath = [];
AskUserForPath = [];
SearchString = [];
blAskUser = false;
for narg = 1:nargin
    sc = upper(varargin{narg});
    switch sc
        case {'EXT'}
            fExtension = varargin{narg+1};
        case {'ABSPATH'}
            AbsPath = varargin{narg+1};
        case {'ASKUSER'}
            blAskUser = true;
        case {'SEARCHSTRING', 'SS'}
            blAskUser = false;
            SearchString = varargin{narg+1};
        otherwise
    end
end

if isempty(fExtension)
    error([ namefunction ' you need to specify an extension (see help)']);
end

%% Ask the user for a searchpath
if blAskUser
    AbsPath = uigetdir();
end
if isempty(AbsPath)
    error([ namefunction ' you need to specify a search path']);
end


%% Find all files in path
oldPath = erase(mfilename('fullpath'),mfilename);
cd(AbsPath)
filesInPath = dir(['**' filesep '*' fExtension]);
cd(oldPath)

%% Read every line in a file with the searchstring
cnt = 0;
output = [];
try
    for nf = 1:length(filesInPath)
        absPathFn = fullfile(filesInPath(nf).folder,filesInPath(nf).name);
        delimiter = {''};
        formatSpec = '%s%[^\n\r]';
        fileID = fopen(absPathFn,'r');
        dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,...
            'TextType', 'string',  'ReturnOnError', false);
        fclose(fileID);
        
        for nLines = 1:length(dataArray{1,1})
            line = dataArray{1,1}(nLines);
            % Search in the string
            if ~isempty(findstr(char(line),SearchString))
                cnt = cnt + 1;
                output{cnt} = absPathFn;
                break;
            end
        end
        
    end
    
catch
    
end

%% Return all files with this particular searchstring

end
