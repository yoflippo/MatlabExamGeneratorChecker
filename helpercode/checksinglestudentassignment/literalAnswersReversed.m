function res = literalAnswersReversed(txtns,literalsR,apStudentSol)
%LITERALANSWERSPRESENT A helperfunction for the testing the answers of
%students.
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

%% Check for literal answers that could be present reversed
for nLr = 1:length(literalsR)
    lits = literalsR{nLr};
    litRs = reverseSpaceSeparatedString(lits);
    lit = lits(lits ~= ' ');      % Remove spaces
    litR = litRs(litRs ~= ' ');   % Remove spaces
    if findInString(txtns,lit) > 0 || findInString(txtns,litR) > 0
        res = res + 1;
    else
        % Test for a generated file! Could also be done by testing for Hash
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% Moet in de code zitten: "' lits '" or "' litRs '".']);
        end
    end
end


end
