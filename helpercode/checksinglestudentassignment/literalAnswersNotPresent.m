function nAbs = literalAnswersNotPresent(txtns,literalsA,apStudentSol)
%LITERALANSWERSNOTPRESENT A helperfunction for the testing the answers of
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

%% Check for literal answers, CAN NOT BE PRESENT
nAbs = 0;
for nLa = 1:length(literalsA)
    numTimes = 1;
    lit = literalsA{nLa};
    if isstring(lit)  || ischar(lit)
        lit = lit(lit ~= ' ');% Remove spaces
        try
            nPlusOne = literalsA{nLa+1};
            if isnumeric(nPlusOne)
                numTimes = nPlusOne;
            end
        catch
        end
    else
        break;
    end
    if findInString(txtns,lit) > 0
        nAbs = nAbs + numTimes;
    else
        % Test for a generated file! Could also be done by testing for Hash
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% Mag niet in de code zitten: ' literalsA{nLa}]);
        end
    end
end



end
