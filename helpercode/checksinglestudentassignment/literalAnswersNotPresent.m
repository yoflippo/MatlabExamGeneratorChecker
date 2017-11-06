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
        litR = lit;
        lit = lit(lit ~= ' ');% Remove spaces
        litR = reverseSpaceSeparatedString(litR);
        litR = litR(litR ~= ' ');
        try
            nPlusOne = literalsA{nLa+1};
            if isnumeric(nPlusOne)
                numTimes = nPlusOne;
            end
        catch
        end
        
        if findInString(txtns,lit) > 0 || findInString(txtns,litR) > 0
            nAbs = nAbs + numTimes;
            % Test for a generated file! Could also be done by testing for Hash
            if ~contains(apStudentSol,'versie')
                WriteToLastLineOfFile(apStudentSol,['% Mag niet in de code zitten: ' literalsA{nLa}]);
            end      
        end
    end
end

%% Check if function and test for assignmnents to inputs
if contains(txtns{1},'function')
    %% Get the function input
    fline = txtns{1};
    ln = extractAfter(fline,'(');
    ln = extractBefore(ln,')');
    inputs = split(ln,',');
    
    %% Check for inputparameter assignment
    for nI = 1:length(inputs)
        toFind = [inputs{nI} '='];
        toFindNot = [toFind '='];
        if findInString(txtns,toFind) > 0 && findInString(txtns,toFindNot) == 0
            nAbs = nAbs + numTimes;
            % Test for a generated file! Could also be done by testing for Hash
            if ~contains(apStudentSol,'versie')
                errTxt = ['% Je mag niet schrijven naar een inputvariabele: ' toFind];
                WriteToLastLineOfFile(apStudentSol,errTxt);
            end      
        end
        
    end
    
end


end
