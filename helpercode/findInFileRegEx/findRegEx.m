function [numFound, lines, txtIndex] = findRegEx(txt,searchString)
%FINDREGEX Search in a txt variable for a string (casesensitive).
% This function could come in handy when it is possible that the
% searchString exists multiple times.
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
%               varargin:   <text>
%               varargin:   <text>
%
% RETURN:
%               outvar:     <text>
%               outvar:     <text>
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 20xx-xx-xx $
% Creation of this function.

%% Default output
lines = [];
txtIndex = [];
numFound = 0;

%% Use regex to find a certain string
output_args = regexp(txt,searchString);

%% Get the lines found
lines = find(~cellfun(@isempty,output_args));
if ~isempty(lines)
    txtIndex = [output_args{lines}];
end

%% Count the number of occurences
numFound = length(lines);
end

