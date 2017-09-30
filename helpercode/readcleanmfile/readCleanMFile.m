function [outVar] = readTxtFile(varargin)
%READTXTFILE A simple function that reads every line of a text-based file.
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
%               A function that literally reads a txt-file. Also taking in
%               to account the empty lines. Other functions as: txtscan(),
%               fgetl(), fgets() appear not to have this option. The
%               function fileread() makes one long string of a file, so
%               that is no option eather.
%
%
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               fullpath:   the absolute path of a txt-file with filename.
%
% RETURN:
%               outvar:     a cell based variable.
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-09-29 $
% Creation of the function

%% Parse varargin
namefunction = 'readCleanMFile';
maxargin = 1;
minargin = 1;
if nargin < minargin
    error([ namefunction ':Needs at minimum' num2str(minargin) ' argument(s) ']);
end
if nargin > maxargin
    error([ namefunction ':Needs max ' num2str(minargin) ' arguments ']);
end


fileID = fopen(varargin{1},'r');
c = 1;
delimiter = {''};
formatSpec = '%s%[^\n]';
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,...
    'TextType', 'string',  'ReturnOnError', false);
fclose(fileID);

for nLns = 1:length(dataArray{1,1})
    line = dataArray{1,1}(nLns);
    dataArray{1,1}(nLns) = cleanCode(line);
end

outVar = removeEmpty(dataArray{1,1});
end

%% Remove empty lines
function oLines = removeEmpty(tline)
cntLn = 1;
txt = "";
for nL = 1:length(tline)
    if ~isempty(char(tline(nL)))
        txt(cntLn,1) = string(tline(nL));
        cntLn = cntLn + 1;
    end
end
oLines = txt;

end

%% Clean code
function oCleanCode = cleanCode(tline)

% Remove comments
if ~isempty(tline) && contains(tline,'%')
    tline = extractBefore(string(tline),'%');
elseif isempty(tline)
    tline = "";
end

% remove all spaces, returns, newlines
tline = erase(tline,newline);
tline = erase(tline,sprintf('clear all;'));
tline = erase(tline,sprintf('\r'));
tline = erase(tline,sprintf(' '));
tline = erase(tline,sprintf('\t'));


% Put some spaces back
keywords = {'clc;' 'close' 'cd' '[' '='};
keywords = [keywords'
    iskeyword()];
for nkw = 1:length(keywords)
    if contains(tline,keywords(nkw))
        tline = insertAfter(tline,keywords(nkw),' ');
    end
end

oCleanCode = tline;

end %function