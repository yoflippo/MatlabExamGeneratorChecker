function [res] = compareFunctionSolStudent(callerName,testSeries,apStudentSol)

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
[~, nmStudentSolution] = fileparts(apStudentSol);
solution = replace(callerName,'_CHECK','_SOL');
blDoubleOutput = false;
blStruct = false;
blDoubleInput = false;

if isstruct(testSeries)
    blStruct = true;
    blDoubleOutput = testSeries.DOUBLE_OUTPUT;
    try
        blDoubleInput = testSeries.DOUBLE_INPUT;
    catch
    end
    testData = testSeries.data;
else
    testData = testSeries;
end

if blDoubleInput && blDoubleOutput
    error(' NOT IMPLEMENTED YET!!!!!!!!!!')
end

%% Perform Tests
for z = 1:length(testData)
    
    if ~blStruct
        tVar = testData(z);
    end
    
    if iscell(testData)
        tVar = testData{z};
        if iscell(tVar) && ~blDoubleInput
            tVar = tVar{1};
        end
    end
    
    try
        try
            if blDoubleOutput
                eval(['[a1,b1] = ' nmStudentSolution '(tVar);']);
                eval(['[a2,b2] = ' solution '(tVar);']);
                if (isequal(a1,a2) && isequal(b1,b2)) || (isequal(a1,b2) && isequal(b1,a2))
                    res = res + 1;
                end
            elseif blDoubleInput
                if isequal(eval([nmStudentSolution '(tVar{1},tVar{2})']) , eval([solution '(tVar{1},tVar{2})']))
                    res = res + 1;
                end
            else
                if isequal(eval([nmStudentSolution '(tVar)']) , eval([solution '(tVar)']))
                    res = res + 1;
                end
            end
        catch % Testing single numeric input
            if isequal(eval([nmStudentSolution '(' tVar ')']) , eval([solution '(' tVar ')']))
                res = res + 1;
            end
        end
    catch ErrMess
        if ~contains(apStudentSol,'versie')
            txterror = ['% Deze code werkt niet met de input: ' num2str(tVar)];
            txterror = [txterror newline 'Matlab error bericht: ' ErrMess.message];
            WriteToLastLineOfFile(apStudentSol,txterror);
        end
    end
end



end%function

