function [txt] = removeLineFromTxt(txt,forbiddenword)
% REMOVELINEFROMTXT removes line from txt if the line has a
% 'forbiddenword'.
%
% ------------------------------------------------------------------------
%    Copyright (C) 2019  M. Schrauwen (markschrauwen@gmail.com)
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
% BY: 2019  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               txt:   text file
%               forbiddenword:   a word that has to be removed with line
%               and all.
%
% RETURN:
%               txt:  cleaned txt
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2019-01-23 $
% Creation of this function.

blWasChar = false;
if isa(txt,'char')
    txt = string(txt);
    blWasChar = true;
elseif ~isa(txt,'string')
    error([newline mfilename ': ' newline 'Input is not char or string' newline]);
end

if ~isempty(txt)
    lines = contains(txt,forbiddenword);
    idx = find(lines);
    if ~isempty(idx)
        for n = idx
            txt(n)=strcat("% ",txt(n));
        end
    end
end
txt = string(txt);
end %function
