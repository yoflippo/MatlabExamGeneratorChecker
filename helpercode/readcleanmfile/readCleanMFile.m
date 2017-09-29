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
    dataArray{1,1}(nLns) = removeReturnAndNewline(line);
end

outVar = dataArray{1,1};

end

% Remove ' \n ' and ' \r ' characters
function r = removeReturnAndNewline(tline)

if ~isempty(tline) && contains(tline,'%')
    tline = extractBefore(string(tline),'%');
elseif isempty(tline)
    tline = "";
elseif ~contains(tline,'clc') && ~contains(tline,'clear') && ~contains(tline,'close')
    tline = strrep(tline,newline,'');
    tline = strrep(tline,sprintf('\tline'),'');
    tline = strrep(tline,sprintf(' '),'');
    tline = strrep(tline,sprintf('\t'),'');
end

r = tline;

end