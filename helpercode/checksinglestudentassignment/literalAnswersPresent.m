function res = literalAnswersPresent(txtns,literalsP,apStudentSol)
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
%
% EXAMPLE:      
%               %% Check for literal answers that MUST BE PRESENT
%               literalsP = {'XXX' 2 'XXX' 1};
%               res = res + literalAnswersPresent(txtns,literalsP,apStudentSol);
%
%


% $Revision: 0.0.0 $  $Date: 2017-10-17 $
% Creation of this function.

res = 0;

%% Check for literal answers that MUST BE PRESENT
for nLp = 1:2:length(literalsP)
    lit = literalsP{nLp};
    lit = lit(lit ~= ' ');% Remove spaces
    if findInString(txtns,lit) >= literalsP{nLp+1}
        res = res + 1;
    else
        % Test for a generated file! Could also be done by testing for Hash
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% Ontbreekt aan de code: ' literalsP{nLp} 'en moet er: ' num2str(literalsP{nLp+1}) ' inzitten.']);
        end
    end
end



end

