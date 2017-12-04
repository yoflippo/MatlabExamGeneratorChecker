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
    %     res = res + compareFunctionSolStudent(callerName,checkingVar.testFunctionInput,apStudentSol);
    res = res + compareFunctionSolStudent(callerName,checkingVar.testFunctionInput,apCleaned);
    resinput = res;
    try
        data = checkingVar.testFunctionInput.data;
    catch
        data = checkingVar.testFunctionInput;
    end
    
    % For a function without input
    if isempty(data)
        data = 1;
    end
    
    %% Create a file from the cleaned file that contains no spaces, for easy txt comparisons
    txtns = nospaces(apCleaned);
    
    %% Check all literals
    [res2,nAbs, num] = literalsAll(txtns,checkingVar,apStudentSol,txtCleanedStudentSolution);
    res = res + res2;
    
    %% Calculate the result
    sm = ((length(checkingVar.literalsP)/2)         + ...
        length(data)                                + ...
        num.Reversed                                + ...
        num.VariantsRev                             + ...
        num.Variants                                  ...
        );
    if sm == 0
        res = 0;
    else
        res = (res-nAbs)/sm;
    end
    if res < 0
        warning('result is too low!')
        res = 0;
    elseif res > 1
        warning('result is too high!')
        res = 1;
    end
    
%     if  ~contains(apStudentSol,'CHEAT') && isequal(resinput,length(data)) ... 
%             && res < 1 && res > 0 && ~contains(pwd,'clean_source')
%         edit(apStudentSol);
%         edit(replace(callerName,'CHECK','SOL'));
%         % Open clean source CheckFile
%         apCheckAss = feval('which',callerName);
%         edit(callerName);
%         apCheckClean = insertAfter(apCheckAss,['Biostatica_Auto_Matlab' filesep],['clean_source' filesep]);
%         edit(apCheckClean);
%         keyboard %Something is wrong, because the input test is perfect but the grade not, so I use the wrong test
%     end
    
else
    if ~contains(apStudentSol,'versie')
        WriteToLastLineOfFile(apStudentSol,'% Een leeg bestand valt niet na te kijken...');
    end
end



deleteTemporaryFiles();
end %function

