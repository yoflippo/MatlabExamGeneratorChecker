function [res, txtns] = compareScriptMultiplePossibleSolStudent(callerName,nameMultipleVars,apCleaned,apStudentSol)
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

try
    numberOfMultiples = length(nameMultipleVars);
    
    resTotal = 0;
    for nMul = 1:numberOfMultiples
        var = nameMultipleVars{nMul};
        for nVar = 1:length(var)
            %% more or less a copy of comparescriptSolStudent
            if exist('resMax','var')
                resTotal = resMax;
            end
            
            resMax = 0;
            res = 0;
            nameVars = var;
            for n = 1:2
                resMax = max(resMax,res);
                res = 0;
                switch n
                    case 1
                        %% Run the solution file - HAS TO WORK!!
                        try
                            run(replace(callerName,'_CHECK','_SOL'));
                        catch ErrMess
%                             keyboard
%                             open(replace(callerName,'_CHECK','_SOL'));
%                             error([mfilename ': SERIOUS PROBLEM WITH SOL FILE ' ErrMess.message]);
%                             res = resTotal;
%                             return;
                        end
                    case 2
                        try
                            run(replace(callerName,'_CHECK','_SOL2'));
                        catch ErrMess
                            %                 keyboard
                            %                 open(replace(callerName,'_CHECK','_SOL2'));
                            %                 error([mfilename ': SERIOUS PROBLEM WITH SOL FILE ' ErrMess.message]);
%                             res = resTotal;
%                             return;
                        end
                end
                
                try
                    % Get values and variables from the SOLUTION file
                    
                    for nV = 1:length(var)
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
                    
                    res = max(resMax,res);
                end
                
                %% Perform tests for certain variables in the Workspace
                for nV = 1:length(nameVars)
                    try
                        eval(['blTest = isequal(var' num2str(nV) 'ANS, ' nameVars{nV} ');']);
                        if blTest
                            res = res + 1;
                        else
                            mss = ['% verwacht resultaat in: ' nameVars{nV} '= ' num2str(eval(['var' num2str(nV) 'ANS' ]))];
                            mss = [mss newline '% verkregen resultaat = ' num2str(eval(nameVars{nV}))];
                            if ~contains(apStudentSol,'versie')
                                WriteToLastLineOfFile(apStudentSol,mss);
                            end
                        end
                    catch ErrMess
                        % Test for a generated file! Could also be done by testing for Hash
                        if ~contains(apStudentSol,'versie')
                            WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
                        end
                    end
                end
            end
            
            res = max(resMax,res);
        end
        resTotal = res + resTotal;
    end %nMul
catch err
    txterror = ['' newline];
    txterror = [txterror '' newline];
    error([mfilename ': ' newline err.message newline txterror]);
end

%% Finally
delete(apCleaned)
res = resTotal;

end %function

