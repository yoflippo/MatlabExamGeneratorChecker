function res = literalSameLine(txtns,literal,apStudentSol)
%LITERALSAMELINE A helperfunction to find two pieces of code on the same
%line
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
%               txtns:          The txt of the cleaned file (readCleanMfile)
%                               without spaces.
%               literalsP:      The literals that must be present in the file.
%               apStudentSol:   The absolute path of the student solution.
%
% RETURN:
%               res:            The result (value between 0..1)


% $Revision: 0.0.0 $  $Date: 2017-10-17 $
% Creation of this function.

res = 0;

%% Check for literal answers when multiple answers could be correct.

for n = 1:length(literal)
    lit = literal{n};
    lLit = length(literal{n});
    if lLit < 2
        error([mfilename ': The number of literalsSL have to be larger then 1' ]);
    end
        
    blTmp = false;
    listTxt = [];

    for n = 1:length(lit)
       [~, lineNumber{n}, ~] = findInString(txtns,lit{n});
    end
    
    % Check if needed words are on the same line
    XXX
    if length([lineNumber{:}]) > 1 && any([lineNumber{:,2:end}] == lineNumber{1}) 
        blTmp = true;
    end
    
    if blTmp
        res = res + 1;
    else
        % Test for a generated file! Could also be done by testing for Hash
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% 1 van deze varianten ontbreek aan de code: ' listTxt]);
        end
    end
end


end
