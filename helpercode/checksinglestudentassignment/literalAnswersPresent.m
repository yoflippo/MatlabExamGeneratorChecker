function [res, sumWeights] = literalAnswersPresent(txtns,literalsP,apStudentSol)
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
lenLiteralsP = length(literalsP);
sumWeights = 0;
for nLp = 1:lenLiteralsP
    currWeight = 0;
    try
        lit = literalsP{nLp};
        lit = replace(lit,' ',''); % Gives error when not numeric
        % Test if number of times present is stated
        currWeight = 1;
        if isnumeric(literalsP{nLp+1})
            if findInString(txtns,lit) >= literalsP{nLp+1}
                try
                    if isnumeric(literalsP{nLp+2}) % Possible weight of present string
                        res = res + literalsP{nLp+2};
                        currWeight = literalsP{nLp+2};
                    else
                        res = res + 1;
                    end
                catch
                    res = res + 1; % Weight of presence is 1
                end
            end
        elseif findInString(txtns,lit) >= 1 % nNmber of times present not stated, default=1
            keyboard
            res = res + 1;
        else
            % Test for a generated file! Could also be done by testing for Hash
            if ~contains(apStudentSol,'versie')
                WriteToLastLineOfFile(apStudentSol,['% Ontbreekt aan de code: ' literalsP{nLp} ' en moet er: ' num2str(literalsP{nLp+1}) 'x in zitten.']);
            end
        end
    catch
    end
    sumWeights = sumWeights + currWeight;
end



end

