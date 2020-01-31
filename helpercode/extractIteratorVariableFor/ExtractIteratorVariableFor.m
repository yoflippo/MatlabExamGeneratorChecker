function [itvar] = ExtractIteratorVariableFor(TXT)
% EXTRACTITERATORVARIABLEFOR
%
% ------------------------------------------------------------------------
%    Copyright (C) 2020  M. Schrauwen (markschrauwen@gmail.com)
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
% BY: 2020  M. Schrauwen (markschrauwen@gmail.com)
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

% $Revision: 0.0.0 $  $Date: 2020-01-20 $
% Creation of this function.

itvar = [];
if isfile(TXT) %NOT ALLOWED!
    TXT = readCleanMFile(TXT);
end
TXT1 = string(TXT);
linesWithFor = TXT1(contains(TXT1,'for') | contains(TXT1,'FOR'));
for i = 1:length(linesWithFor)
    tmp = char(linesWithFor(i));
    if isequal(tmp(1:3),'for') || isequal(tmp(1:3),'FOR')
        itvar = extractBefore(extractAfter(tmp,'for'),'= ');
        if ~isempty(itvar)
            return
        end
    end
end

end %function
