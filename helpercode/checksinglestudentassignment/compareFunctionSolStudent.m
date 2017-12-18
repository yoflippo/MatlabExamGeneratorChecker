function [resTotal] = compareFunctionSolStudent(callerName,testSeries,apStudentSol,apStudentSolOriginal)

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
resTotal = 0;
%% Perform tests version 2
for z = 1:length(testData)
    res = 0;
    if num_input ~= 0
        tVar = testData(z);
        tVar = tVar{1};
    end
    oStud = [];
    oSol = [];
    ErrMess = [];
    
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
                oStud.a = feval(nmStudentSolution,tVar);
                oSol.a =  feval(solution,tVar);
                if isequalQ(oSol.a,oStud.a)
                    res = res + 1;
                end
            catch ErrMess
                procesError(apStudentSolOriginal,ErrMess,num_input,tVar,num_output,oStud,oSol);
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
                if isequalQ(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSolOriginal,ErrMess,num_input,tVar,num_output,oStud,oSol);
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
                if isequalQ(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.c,oSol.c)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSolOriginal,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '1  2'
            try
                [oStud.a] = feval(nmStudentSolution,tVar{1},tVar{2});
                [oSol.a] = feval(solution,tVar{1},tVar{2});
                if isequalQ(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSolOriginal,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '2  2'
            try
                [oStud.a, oStud.b] = feval(nmStudentSolution,tVar{1},tVar{2});
                [oSol.a, oSol.b] = feval(solution,tVar{1},tVar{2});
                if isequalQ(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSolOriginal,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '3  2'
            try
                [oStud.a, oStud.b, oStud.c] = feval(nmStudentSolution,tVar{1},tVar{2});
                [oSol.a, oSol.b, oSol.c] = feval(solution,tVar{1},tVar{2});
                if isequalQ(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.c,oSol.c)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSolOriginal,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '4  2'
            try
                [oStud.a, oStud.b, oStud.c,oStud.d] = feval(nmStudentSolution,tVar{1},tVar{2});
                [oSol.a, oSol.b, oSol.c,oSol.d] = feval(solution,tVar{1},tVar{2});
                if isequalQ(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.c,oSol.c)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.d,oSol.d)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSolOriginal,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '1  3'
            try
                [oStud.a] = feval(nmStudentSolution,tVar{1},tVar{2},tVar{3});
                [oSol.a] = feval(solution,tVar{1},tVar{2},tVar{3});
                if isequalQ(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSolOriginal,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '2  3'
            try
                [oStud.a, oStud.b] = feval(nmStudentSolution,tVar{1},tVar{2},tVar{3});
                [oSol.a, oSol.b] = feval(solution,tVar{1},tVar{2},tVar{3});
                if isequalQ(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSolOriginal,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '3  3'
            try
                [oStud.a, oStud.b, oStud.c] = feval(nmStudentSolution,tVar{1},tVar{2},tVar{3});
                [oSol.a, oSol.b, oSol.c] = feval(solution,tVar{1},tVar{2},tVar{3});
                if isequalQ(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.c,oSol.c)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSolOriginal,ErrMess,num_input,tVar,num_output,oStud,oSol);
            end
        case '5  0'
            try
                [oStud.a, oStud.b, oStud.c, oStud.d, oStud.e] = feval(nmStudentSolution);
                [oSol.a, oSol.b, oSol.c, oSol.d, oSol.e] = feval(solution);
                if isequalQ(oStud.a,oSol.a)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.b,oSol.b)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.c,oSol.c)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.d,oSol.d)
                    res = res + 1/num_output;
                end
                if isequalQ(oStud.e,oSol.e)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSolOriginal,ErrMess,num_input,[],num_output,oStud,oSol);
            end
        otherwise
            warning([newline mfilename ': ' newline 'NO RIGHT CASE!!' newline]);
    end%switch
    
    % Error message
    if ~isequalQ(res,1) && isempty(ErrMess)
        procesError(apStudentSolOriginal,[],num_input,tVar,num_output,oStud,oSol)
    end
    resTotal = resTotal + res;
end%for
end%function


function procesError(apStudentSol,ErrMess,num_input,tVar,num_output,oStud,oSol)
txterror = '% Tijdens het runnen van jouw uitwerking, tradt er een fout op:';
try
    if ~contains(apStudentSol,'versie')
        if ~isempty(ErrMess)
            txterror = '% Tijdens het runnen van jouw uitwerking, tradt er een fout op:';
            txterror = [txterror newline '% Matlab error bericht: ' ErrMess.message];
        end
        
        try
            switch num_input
                case 1
                    txterror = [newline '% Deze code werkt niet met de input: ' num2str(tVar)];
                case 2
                    txterror = [newline '% Deze code werkt niet met de input: ' num2str(tVar{1}) ' en ' num2str(tVar{2})];
                case 3
                    txterror = [newline '% Deze code werkt niet met de input: ' num2str(tVar{1}) ' en ' num2str(tVar{2}) ' en ' num2str(tVar{3})  ];
            end
        catch
        end
        qq = char(34);
        
        % Give expected output
        try
            switch num_output
                case 1
                    txterror = [txterror newline '% Dit is verwachte output: ' qq num2str(oSol.a) qq];
                case 2
                    txterror = [txterror newline '% Dit is verwachte output: ' qq  num2str(oSol.a) ',' qq  num2str(oSol.b) qq ];
                case 3
                    txterror = [txterror newline '% Dit is verwachte output: ' qq  num2str(oSol.a)  qq ',' qq  num2str(oSol.b)  qq ',' qq  num2str(oSol.c) qq ];
                case 4
                    txterror = [txterror newline '% Dit is verwachte output: ' qq  num2str(oSol.a)  qq ',' qq  num2str(oSol.b) qq  ',' qq  num2str(oSol.c)  qq ',' qq  num2str(oSol.d) qq ];
                case 5
                    txterror = [txterror newline '% Dit is verwachte output: ' qq  num2str(oSol.a)  qq ',' qq  num2str(oSol.b)  qq ',' qq  num2str(oSol.c)  qq ',' qq  num2str(oSol.d)  qq ',' qq  num2str(oSol.e) qq ]
            end
        catch
        end
        
        % Give student output
        try
            switch num_output
                case 1
                    txterror = [txterror newline '% Dit is de output van jouw code: ' qq num2str(oStud.a) qq];
                case 2
                    txterror = [txterror newline '% Dit is de output van jouw code: ' qq num2str(oStud.a) qq ',' qq num2str(oStud.b) qq];
                case 3
                    txterror = [txterror newline '% Dit is de output van jouw code: ' qq  num2str(oStud.a)  qq ',' qq  num2str(oStud.b)  qq  ',' qq  num2str(oStud.c) qq ];
                case 4
                    txterror = [txterror newline '% Dit is de output van jouw code: ' qq  num2str(oStud.a) ',' qq  num2str(oStud.b)  qq  ',' qq  num2str(oStud.c)  qq  ',' qq  num2str(oStud.d) qq ];
                case 5
                    txterror = [txterror newline '% Dit is de output van jouw code: ' qq  num2str(oStud.a) ',' qq  num2str(oStud.b)   qq ',' qq  num2str(oStud.c)  qq  ',' qq  num2str(oStud.d)  qq ',' qq  num2str(oStud.e)  qq ];
            end
        catch
        end
        
    end
    WriteToLastLineOfFile(apStudentSol,txterror);
catch Err
    keyboard %Something wrong with your code budy
end

end %function

function output = isequalQ(A,B)
try
    if isnumeric(A) && isnumeric(B) && all(all(abs(A) ~= Inf)) && all(all(abs(B) ~= Inf))
        output = all(all(abs(A-B)<0.05));
    else
        output = isequal(A,B);
    end
catch
    output = isequal(A,B);
end
end%f