function [res, txtns] = compareScriptSolStudent(callerName,nameVars,apCleaned,apStudentSol)

%COMPARESCRIPTSOLSTUDENT A helperfunction for the testing the answers of
%students by comparing it to a Solution file.
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

res = 0;

%% Run the solution file - HAS TO WORK!!
try
    run(replace(callerName,'_CHECK','_SOL'));
catch ErrMess
    keyboard
    open(replace(callerName,'_CHECK','_SOL'));
    error([mfilename ': SERIOUS PROBLEM WITH SOL FILE ' ErrMess.message]);
    return;
end

% Get values and variables from the SOLUTION file
for nV = 1:length(nameVars)
    % Save the variables in the SOLUTION FILE
    eval(['var' num2str(nV) 'ANS = ' nameVars{nV} ';']);
    % Remove solution variables from Workspace.
    eval(['clear ' nameVars{nV}  ';']);
end

%% Run the cleaned student script, if not working no points!
try
    if exist(apCleaned,'file')
        run(apCleaned);
        txtns = nospaces(apCleaned);
    else
        run(apStudentSol);
        txtns = nospaces(apStudentSol);
    end
catch ErrMess
    % Test for a generated file! Could also be done by testing for Hash
    txterror = 'Het script of de functie van de student kan niet worden uitgevoerd!';
    if ~contains(apStudentSol,'versie')
        WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
        WriteToLastLineOfFile(apStudentSol,['% ' txterror]);        
    end
    delete(apCleaned);
    error(txterror);
    return;
end

%% Perform tests for certain variables in the Workspace
for nV = 1:length(nameVars)
    try
        eval(['blTest = isequal(var' num2str(nV) 'ANS, ' nameVars{nV} ');']);
        if blTest
            res = res + 1;
        end
    catch ErrMess
        % Test for a generated file! Could also be done by testing for Hash
        if ~contains(apStudentSol,'versie')
            WriteToLastLineOfFile(apStudentSol,['% ' ErrMess.message]);
        end
    end
end


end

