function nAbs = literalAnswersNotPresent(txtns,literalsA,apStudentSol,txtclean)
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
        
        [fndNumStr, lnStr] = findInString(txtns,lit);
        [fndNumStrR,lnStrR]  = findInString(txtns,litR);
        if fndNumStr > 0 || fndNumStrR > 0
            nAbs = nAbs + numTimes;
            % Test for a generated file! Could also be done by testing for Hash
            if ~contains(apStudentSol,'versie')
                %                 WriteToLastLineOfFile(apStudentSol,['% Mag niet in de code zitten: ' literalsA{nLa}]);
                mss = ['% De onderstaande regel(s) voldoe(t)(n) niet aan de opdracht: ']
                if isempty(lnStr)
                    for n = 1:length(lnStrR)
                        mss = [mss newline char(34) '% ' txtclean{lnStrR(n)} char(34)]
                    end
                else
                    for n = 1:length(lnStr)
                        mss = [mss newline '% ' char(34) txtclean{lnStr(n)} char(34)]
                    end
                end
                WriteToLastLineOfFile(apStudentSol,mss);
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
        if findArgAssignment(txtns,toFind)
            nAbs = nAbs + numTimes;
            % Test for a generated file! Could also be done by testing for Hash
            if ~contains(apStudentSol,'versie')
                errTxt = ['% Je mag niet schrijven naar een inputvariabele: ' toFind];
                keyboard
                WriteToLastLineOfFile(apStudentSol,errTxt);
            end
        end
        
    end
    
end


end

function blFound = findArgAssignment(txt,searchString)
blFound = false;
try
    % %     fndStrings = regexp(txt,['(?<!\.)\<' searchString '\>(?!\.)[ =]']); %regexp('demon= demo = _demo= kdemon= demo= demo ==','(?<!\.)\<demo\>(?!\.)[ =]')
    tst = contains(txt,searchString) & ~contains(txt,[searchString '='])
    if any(tst)
        blFound = true;
    end
catch err
    error([mfilename ', ' newline err.message newline]);
end

end

