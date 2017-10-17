function res = runChecksOnFunctionAssignment(callerName, checkingVar, apStudentSol)

%RUNCHECKSONFUNCTIONASSIGNMENT A helperfunction for the testing the answers of
%students by comparing it to a Solution file. It combines different
%functions that help in checking the asnwer.
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
%               apStudentSol:   Absolute path of student solution.
%
%


% $Revision: 0.0.0 $  $Date: 2017-10-17 $
% Creation of this function.

%% Commence the TESTING !!!
res = 0;


[txtCleanedStudentSolution, apCleaned] = readCleanMFile('-ap',apStudentSol,'mc');

if ~isempty(char(txtCleanedStudentSolution))
    %% Create compare the solution file with the student solution
    res = res + compareFunctionSolStudent(callerName,checkingVar.testFunctionInput,apStudentSol);
    
    %% Create a file from the cleaned file that contains no spaces, for easy txt comparisons
    txtns = nospaces(apCleaned);
    
    %% Check for literal answers that MUST BE PRESENT
    res = res + literalAnswersPresent(txtns,checkingVar.literalsP,apStudentSol);

    %% Check for literal answers, CAN NOT BE PRESENT
    nAbs = literalAnswersNotPresent(txtns,checkingVar.literalsA,apStudentSol);
    
    %% Check for literal answers that could be present reversed
    res = res + literalAnswersReversed(txtns,checkingVar.literalsR,apStudentSol);
    
    
    %% Calculate the result
    res = (res-nAbs)/((length(checkingVar.literalsP)/2)+length(checkingVar.testFunctionInput)+length(checkingVar.literalsR));
    if res < 0
        res = 0;
    elseif res > 1
        res = 1;
    end
end
deleteTemporaryFiles();



end

