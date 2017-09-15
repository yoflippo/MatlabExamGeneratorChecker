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
%               'ext':          string with file extension
%               'abspath':      string with absolute path of a directory
%               'askuser':      declare this string to ask the user for a path.
%               'searchstring': the searchstring
%               'ss' :          the searchstring
%               'editiffound' : open file in Matlab editor if found
%               'eif' :         open file in Matlab editor if found
%               'setbreakpoint':set a breakpoint in m-file if string is
%                               found
%               'sbp' :         set a breakpoint in m-file if string is
%                               found
%
% RETURN:
%               result: variabele with all files containing the string
%
% EXAMPLES:
%
%               readAndFindTextInFiles('EXT','.m','sS','empty','abspath',pathOfTestData);
%               readAndFindTextInFiles('sS','stringToFind','abspath',pathOfTestData,'Ext','.m');

% $Revision: 0.0.0 $  $Date: 2017-09-13 $
% Creation of the function

%% Parse varargin
namefunction = 'readAndFindTextInFiles';

maxargin = 2*5+2;
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
blEdit = false;
blBreakpoint = false;
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
            SearchString = varargin{narg+1};
        case {'EDITIFFOUND', 'EIF'}
            blEdit = true;
        case {'SETBREAKPOINT', 'SBP'}
            blBreakpoint = true;
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
thisPath = fileparts(mfilename('fullpath'));
cd(AbsPath)
filesInPath = dir(['**' filesep '*' fExtension]);
cd(thisPath)

%% Read every line in a file with the searchstring
cnt = 0;
output = [];

% only set breakpoint if an m-file is searched.
if ~isequal(fExtension,'.m')
    blBreakpoint = false;
end

currPath = pwd;
for nf = 1:length(filesInPath)
    absPathFn = fullfile(filesInPath(nf).folder,filesInPath(nf).name);
    % Go to folder
    cd(filesInPath(nf).folder);
    delimiter = {''};
    formatSpec = '%s%[^\n]';
    fileID = fopen(absPathFn,'r');
    dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,...
        'TextType', 'string',  'ReturnOnError', false);
    fclose(fileID);
    try
        for nLines = 1:length(dataArray{1,1})
            line = dataArray{1,1}(nLines);
            % Search in the string
            if ~isempty(findstr(char(line),SearchString))
                % Return all files with this particular searchstring
                cnt = cnt + 1;
                output{cnt} = absPathFn;
                % Open file
                if blEdit
                    edit(absPathFn);
                end
                % Set breakpoint
                try
                    if blBreakpoint
                        eval(['dbstop at ' num2str(nLines) ' in ' filesInPath(nf).name]);
                    end
                catch
                    warning('file must contain an expression');
                end
                break;
            end
        end
    catch
        cd(currPath)
    end
    cd(currPath)
end


end
