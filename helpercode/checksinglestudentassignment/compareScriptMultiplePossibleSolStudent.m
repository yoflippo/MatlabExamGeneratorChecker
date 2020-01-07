function [resOut, txtns] = compareScriptMultiplePossibleSolStudent(callerName,nameMultipleVars,apCleaned,apStudentSol)
% COMPARESCRIPTMULTIPLEPOSSIBLESOLSTUDENT <short description>
%
% ------------------------------------------------------------------------
%    Copyright (C) 2019  M. Schrauwen (markschrauwen@gmail.com)
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
% BY: 2019  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               varargin:   <text>
%               varargin:   <text>
%
% RETURN:
%               outvar:     <text>
%               outvar:     <text>
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2019-01-23 $
% Creation of this function.

numberOfMultiples = length(nameMultipleVars);
resOut = 0;
res = 0;
resSolMax = 0;


for nSol = 1:2
    resSolMul = 0;
    for nMul = 1:numberOfMultiples
        res = 0;
        nameVars = nameMultipleVars{nMul};
        blTestValues = false;
        switch nSol
            case 1
                %% Run the solution file - HAS TO WORK!!
                try
                    ap.Sol = replace(callerName,'_CHECK','_SOL');
                    if exist(ap.Sol,'file')
                        run(ap.Sol);
                    end
                    blTestValues = true;
                catch ErrMess
                    keyboard % something is wrong bub
                end
            case 2
                try
                    ap.Sol2 = replace(callerName,'_CHECK','_SOL2');
                    if exist(ap.Sol2,'file')
                        run(ap.Sol2);
                    end
                    blTestValues = true;
                catch ErrMess
                end
        end
        
        if blTestValues
            %% Get values and variables from the SOLUTION file
            try
                for nV = 1:length(nameVars)
                    try
                        % Save the variables in the SOLUTION FILE
                        eval(['var' num2str(nV) 'ANS = ' nameVars{nV} ';']);
                        % Remove solution variables from Workspace.
                        eval(['clear ' nameVars{nV}  ';']);
                    catch
                    end
                end
                
                %% Run the cleaned student script, if not working no points!
                if exist(apCleaned,'file')
                    run(apCleaned);
                    txtns = nospaces(apCleaned);
                else
                    run(apStudentSol);
                    txtns = nospaces(apStudentSol);
                end
            catch ErrMess
            end
            
            %% Perform tests for certain variables in the Workspace
            for nV = 1:length(nameVars)
                try
                    if exist(['var' num2str(nV) 'ANS'],'var')
                        eval(['blTest = isequal(var' num2str(nV) 'ANS, ' nameVars{nV} ');']);
                        if blTest
                            res = res + 1;
                            eval(['clear var' num2str(nV) 'ANS;']);
                        else
                            mss = ['% verwacht resultaat in: ' nameVars{nV} '= ' num2str(eval(['var' num2str(nV) 'ANS' ]))];
                            mss = [mss newline '% verkregen resultaat = ' num2str(eval(nameVars{nV}))];
                            if ~contains(apStudentSol,'versie')
                                WriteToLastLineOfFile(apStudentSol,mss);
                            end
                        end
                    end
                catch ErrMess
                    % Test for a generated file! Could also be done by testing for Hash
                    if ~contains(apStudentSol,'versie')
                        WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
                    end
                end
            end
            resSolMul = resSolMul + res;
        end
    end
    resSolMax = max(resSolMax,resSolMul);
end %nMul
delete(apCleaned)
resOut = resSolMax;
end %function
