function [numFound, lines, txtIndex] = findRegEx(txt,searchString)
%FINDREGEX Search in a txt variable for a string (caseSensitive).
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
%               txt:   A cell with txt.
%               searchString:   String to be searched.
%
% RETURN:
%               numFound:   The number of times the searchString is found.
%               lines:      The linenumbers
%               txtIndex:   The index of the linenumber
%

% $Revision: 0.0.0 $  $Date: 2017-10-10 $
% Creation of this function.
% $Revision: 0.0.0 $  $Date: 2017-10-10 $
% Replaced regex with strfind() because of operator symbols. The function
% strfind() is faster.

%% Default output
lines = [];
txtIndex = [];
numFound = 0;

try
    %% Use regex to find a certain string
    fndStrings = strfind(txt,searchString); %regexp(txt,searchString);
    
    %% Get the lines found
    if isequal(length(fndStrings),1)
        numFound = 1;
        return;
    end
    
    lines = find(~cellfun(@isempty,fndStrings));
    if ~isempty(lines)
        txtIndex = [fndStrings{lines}];
    end
    
    %% Count the number of occurences
    numFound = length(lines);
    
catch err
    %     txterror = ['' newline];
    %     txterror = [txterror '' newline];
    error([mfilename ', ' newline err.message newline]);
end

end

