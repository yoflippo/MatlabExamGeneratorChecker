function output = readAndFindAndReplaceTextInFiles(varargin)
%READANDFINDANDREPLACETEXTINFILES a function that finds a string in a file
% and replaces this file. BE CAREFULL USING IT!!!!
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
%               readAndFindTextInFiles('EXT','.m','sS','empty','abspath',pathOfTestData);
%               readAndFindTextInFiles('sS','stringToFind','abspath',pathOfTestData,'Ext','.m');

% $Revision: 0.0.0 $  $Date: 2017-09-13 $
% Creation of the function

%% Parse varargin

disp('TODO: Make copies of files with replaced txt')
namefunction = 'readAndFindAndReplaceTextInFiles';

maxargin = 2*6-1;
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
        case {'REPLACE'}
            StringToReplace = varargin{narg+1};
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
oldPath =  fileparts(mfilename('fullpath'));
cd(AbsPath)
filesInPath = dir(['**' filesep '*' fExtension]);
cd(oldPath)


%% Warn user
maxFiles = 20;
if length(filesInPath) > 5 && length(filesInPath) < maxFiles
    warning('Five or more files could be changed.. are you sure?')
    warning('For YES enter: 476')
    disp(' ');
    if input('Enter: ')== 476
    else
        disp('Wise choice young grasshopper');
        return;
    end
elseif length(filesInPath) >= maxFiles
    error(['Too many files could be changed. The max is: ' num2str(maxFiles)])
end

%% Read every line in a file with the searchstring
cnt = 0;
output = [];

for nf = 1:length(filesInPath)
    absPathFn = fullfile(filesInPath(nf).folder,filesInPath(nf).name);
    delimiter = {''};
    formatSpec = '%s%[^\n\r]';
    fileID = fopen(absPathFn,'r');
    dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,...
        'TextType', 'string',  'ReturnOnError', false);
    fclose(fileID);
    try
        for nLines = 1:length(dataArray{1,1})
            line = dataArray{1,1}(nLines);
            blFoundFile = false;
            % Search in the string
            if ~isempty(findstr(char(line),SearchString))
                % Return all files with this particular searchstring
                cnt = cnt + 1;
                output{cnt} = absPathFn;
                % REPLACE STRING
                dataArray{1,1}(nLines) = replace(char(line),SearchString,StringToReplace);
                blFoundFile = true;
                break;
            end
        end
        % Remove the file before writing 
        delete(absPathFn)
        % Write file with adjusted string
        fileID = fopen(absPathFn,'w');
        for i = 1:length(dataArray{1,1})
            fprintf(fileID,'%s\r\n',dataArray{1,1}{i});
        end
        % close the file
        fclose('all');
    catch
    end
end


end
