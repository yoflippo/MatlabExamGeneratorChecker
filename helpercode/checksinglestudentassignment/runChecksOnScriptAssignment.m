function [res,num] = runChecksOnScriptAssignment(callerName, checkingVar, apStudentSol)

%RUNCHECKSONASSIGNMENT A helperfunction for the testing the answers of
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

% Creates a copy with cleaned code
[txtCleanedStudentSolution, apCleaned] = readCleanMFile('-ap',apStudentSol,'-makecopy');

if ~isempty(char(txtCleanedStudentSolution))
    %% Check for while-loops who last forever
    clear global mscounter
    txtCleanedStudentSolution = adjustMFileToPrevent4EverWhile(apCleaned,txtCleanedStudentSolution);
    global mscounter
    if ~isequal(mscounter,1000)
        %% Run the SOL file and the Student-solution and compare the used variables for their values
        try
            [res, txtns] = compareScriptSolStudent(callerName,checkingVar.nameVars,apCleaned,apStudentSol);
            resinput = res;
        catch err
            deleteTemporaryFiles();
            return;
        end
        num.nameVars = length(checkingVar.nameVars);
        
        %% Check multiple possible variables that should be tested
        try
            num.nameVarsOr = 0;
            resMul = 0;
            if ~isempty(checkingVar.nameVarsOr)
                [resMul, txtns] = compareScriptMultiplePossibleSolStudent(callerName,checkingVar.nameVarsOr,apCleaned,apStudentSol);
            end
            num.nameVarsOr = length(checkingVar.nameVarsOr);
        catch err
            deleteTemporaryFiles();
        end
        
        
        if resMul > num.nameVarsOr
            keyboard
            error([newline mfilename ': ' newline 'impossible situation' newline]);
        end
        
        
        %% Check for literal answers, CAN NOT BE PRESENT
        nAbs = literalAnswersNotPresent(txtns,checkingVar.literalsA,apStudentSol,txtCleanedStudentSolution);
        
        %% Handle situation if input / output is correct (regardless of code used)
        if num.nameVars > 1 && resinput / num.nameVars == 1 && nAbs == 0
            %In this case the student should receive ALL points
            res = 1;
        else
            %% Add resMul
            res = res + resMul;
            
            %% Check all literals
            [res2,num2,weights] = literalsAll(txtns,checkingVar,apStudentSol);
            res = res + res2;
            
            % Get remaining numbers.
            num2.Present = weights.laPresent;
            
            %% Calculate the result
            res = (res-nAbs)/ (      ...
                num2.Present         + ...
                num.nameVars         + ...
                num.nameVarsOr       + ...
                num2.Reversed        + ...
                num2.VariantsRev     + ...
                num2.Variants        + ...
                num2.SameLine          ...
                );
            
            % % % % %         % If the I/O is wrong only a maximum of 50% can be earned.
            % % % % %         if num.nameVars > 1
            % % % % %             res = min(res,0.5);
            % % % % %         end
            if length(num.nameVars) > 1
                if ~contains(apStudentSol,'versie')
                    WriteToLastLineOfFile(apStudentSol,'% De verwachte output is verkeerd.');
                end
                res = res/1.5;
            end
        end
        
        if res < 0
            warning('result is too low!')
            res = 0;
        elseif res > 1
            warning('result is too high!')
            keyboard
        end
    else
        WriteToLastLineOfFile(apStudentSol,'% Eeuwige while-lus, dus je krijgt nul punten');
    end %test forever while
else
    if ~contains(apStudentSol,'versie')
        WriteToLastLineOfFile(apStudentSol,'% Een leeg bestand valt niet na te kijken...');
    end
end

deleteTemporaryFiles();
end %function