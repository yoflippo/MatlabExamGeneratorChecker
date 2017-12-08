function [res] = compareFunctionSolStudent(callerName,testSeries,apStudentSol,apStudentSolOriginal)

%COMPAREFUNCTIONSOLSTUDENT A helperfunction for the testing the answers of
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


% $Revision: 0.0.0 $  $Date: 2017-10-30 $
% Creation of this function.

res = 0;
[~, nmStudentSolution] = fileparts(apStudentSol);
solution = replace(callerName,'_CHECK','_SOL');

blStruct = false;
num_input = 0;
num_output = 0;

if isstruct(testSeries)
    blStruct = true;
    testData = testSeries.data;
else % keeping backwards compatibility
    testData = testSeries;
end

%% Test for number of inputs of function by checking testdata
if length(testData) > 1
    if ~isequal(length(testData{1}),length(testData{2}))
        error([mfilename ': ' newline 'The function test inputs of the checkfile are incorrect!']);
    else
        num_input = length(testData{1});
    end
else %In case we need to test a function without inputs
    num_input = 0;
    testData = 1;
end

%% Test for number of outputs of assignment by checking the SOLUTION
num_output = countNumberOfFunctionOutputs(solution);

%% Perform tests version 2
for z = 1:length(testData)
    
    if num_input ~= 0
        tVar = testData(z);
        tVar = tVar{1};
    end
    oStud = [];
    oSol = [];
    
    switch num2str([num_output num_input])
        case '1  0'
            try
                if isequal(feval(nmStudentSolution) , feval(solution))
                    res = res + 1;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '1  1'
            try
                % Remove the cell -- the cell-type is no part of Biostatica
                % Matlab and so a test for a cell will never be present
                if iscell(tVar)
                    tVar = tVar{1};
                end
                oStud = feval(nmStudentSolution,tVar);
                oSol =  feval(solution,tVar);
                if isequal(outSol,outStud)
                    res = res + 1;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '2  1'
            try
                % Remove the cell -- the cell-type is no part of Biostatica
                % Matlab and so a test for a cell will never be present
                if iscell(tVar)
                    tVar = tVar{1};
                end
                [oStud.a, oStud.b] = feval(nmStudentSolution,tVar);
                [oSol.a, oSol.b] = feval(solution,tVar);
                if isequal(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequal(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '3  1'
            try
                % Remove the cell -- the cell-type is no part of Biostatica
                % Matlab and so a test for a cell will never be present
                if iscell(tVar)
                    tVar = tVar{1};
                end
                [oStud.a, oStud.b, oStud.c] = feval(nmStudentSolution,tVar);
                [oSol.a, oSol.b, oSol.c] = feval(solution,tVar);
                if isequal(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequal(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
                if isequal(oStud.c,oSol.c)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '1  2'
            try
                [oStud.a] = feval(nmStudentSolution,tVar{1},tVar{2});
                [oSol.a] = feval(solution,tVar{1},tVar{2});
                if isequal(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '2  2'
            try
                [oStud.a, oStud.b] = feval(nmStudentSolution,tVar{1},tVar{2});
                [oSol.a, oSol.b] = feval(solution,tVar{1},tVar{2});
                if isequal(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequal(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '3  2'
            try
                [oStud.a, oStud.b, oStud.c] = feval(nmStudentSolution,tVar{1},tVar{2});
                [oSol.a, oSol.b, oSol.c] = feval(solution,tVar{1},tVar{2});
                if isequal(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequal(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
                if isequal(oStud.c,oSol.c)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '4  2'
            try
                [oStud.a, oStud.b, oStud.c,oStud.d] = feval(nmStudentSolution,tVar{1},tVar{2});
                [oSol.a, oSol.b, oSol.c,oSol.d] = feval(solution,tVar{1},tVar{2});
                if isequal(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequal(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
                if isequal(oStud.c,oSol.c)
                    res = res + 1/num_output;
                end
                if isequal(oStud.d,oSol.d)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '1  3'
            try
                [oStud.a] = feval(nmStudentSolution,tVar{1},tVar{2},tVar{3});
                [oSol.a] = feval(solution,tVar{1},tVar{2},tVar{3});
                if isequal(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '2  3'
            try
                [oStud.a, oStud.b] = feval(nmStudentSolution,tVar{1},tVar{2},tVar{3});
                [oSol.a, oSol.b] = feval(solution,tVar{1},tVar{2},tVar{3});
                if isequal(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequal(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '3  3'
            try
                [oStud.a, oStud.b, oStud.c] = feval(nmStudentSolution,tVar{1},tVar{2},tVar{3});
                [oSol.a, oSol.b, oSol.c] = feval(solution,tVar{1},tVar{2},tVar{3});
                if isequal(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequal(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
                if isequal(oStud.c,oSol.c)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '5  0'
            try
                [oStud.a, oStud.b, oStud.c, oStud.d, oStud.e] = feval(nmStudentSolution);
                [oSol.a, oSol.b, oSol.c, oSol.d, oSol.e] = feval(solution);
                if isequal(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequal(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
                if isequal(oStud.c,oSol.c)
                    res = res + 1/num_output;
                end
                if isequal(oStud.d,oSol.d)
                    res = res + 1/num_output;
                end
                if isequal(oStud.e,oSol.e)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input,[],num_output,oStud,oSol);
            end
        otherwise
            warning([newline mfilename ': ' newline 'NO RIGHT CASE!!' newline]);
    end%switch
    % Error message
    if ~isequal(res,1)
        procesError(apStudentSolOriginal,[],num_input,tVar,num_output,oStud,oSol)
    end
end%for
end%function


function procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol)
if ~contains(apStudentSol,'versie')
    %     keyboard %CHECK IF IT WORKS
    txterror = newline;
    if ~isempty(ErrMess)
        txterror = 'Tijdens het runnen van jouw uitwerking, tradt er een fout op';
        txterror = [txterror 'Matlab error bericht: ' ErrMess.message];
    else
        switch num_input
            case 1
                txterror = ['% Deze code werkt niet met de input: ' num2str(tVar)];
            case 2
                txterror = ['% Deze code werkt niet met de input: ' num2str(tVar{1}) ' en ' num2str(tVar{2})];
            case 3
                txterror = ['% Deze code werkt niet met de input: ' num2str(tVar{1}) ' en ' num2str(tVar{2}) ' en ' num2str(tVar{3})  ];
            otherwise
                txterror = ['%' newline];
        end
        switch num_output
            case 1
                txterror = ['% Dit is de output van jouw code: ' num2str(oStud.a)];
                txterror = [txterror newline '% Dit is verwachte output: ' num2str(oSol.a)];
            case 2
                txterror = ['% Dit is de output van jouw code: ' num2str(oStud.a) ',' num2str(oStud.b)];
                txterror = [txterror newline '% Dit is verwachte output: ' num2str(oSol.a) ',' num2str(oSol.b)];
            case 3
                txterror = ['% Dit is de output van jouw code: ' num2str(oStud.a) ',' num2str(oStud.b)  ',' num2str(oStud.c)];
                txterror = [txterror newline '% Dit is verwachte output: ' num2str(oSol.a) ',' num2str(oSol.b) ',' num2str(oSol.c)];
            case 4
                txterror = ['% Dit is de output van jouw code: ' num2str(oStud.a) ',' num2str(oStud.b)  ',' num2str(oStud.c)  ',' num2str(oStud.d)];
                txterror = [txterror newline '% Dit is verwachte output: ' num2str(oSol.a) ',' num2str(oSol.b) ',' num2str(oSol.c) ',' num2str(oSol.d)];
            case 5
                txterror = ['% Dit is de output van jouw code: ' num2str(oStud.a) ',' num2str(oStud.b)  ',' num2str(oStud.c)  ',' num2str(oStud.d) ',' num2str(oStud.e)];
                txterror = [txterror newline '% Dit is verwachte output: ' num2str(oSol.a) ',' num2str(oSol.b) ',' num2str(oSol.c) ',' num2str(oSol.d) ',' num2str(oSol.e)]
            otherwise
                txterror = ['%' newline];
        end
    end
    WriteToLastLineOfFile(apStudentSol,txterror);
end
end %function
