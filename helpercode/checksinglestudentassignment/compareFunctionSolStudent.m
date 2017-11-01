function [res] = compareFunctionSolStudent(callerName,testSeries,apStudentSol)

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
elseif length(testData) == 1
    num_input = 1;
end

%% Test for number of outputs of assignment by checking the SOLUTION
num_output = countNumberOfFunctionOutputs(solution);

%% Perform tests version 2
for z = 1:length(testData)

    tVar = testData(z);
    tVar = tVar{1};
    
    switch num2str([num_output num_input])
        case '1  0'
            try
                if isequal(feval(nmStudentSolution) , feval(solution))
                    res = res + 1;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input);
            end
        case '1  1'
            try
                if isequal(feval(nmStudentSolution,tVar) , feval(solution,tVar))
                    res = res + 1;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input);
            end
        case '2  1'
            try
                [oa, ob] = feval(nmStudentSolution,tVar);
                [oas, obs] = feval(solution,tVar);
                if isequal(oa,oas)
                    res = res + 1/num_output;
                end
                if isequal(ob,obs)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input);
            end
        case '3  1'
            try
                [oa, ob, oc] = feval(nmStudentSolution,tVar);
                [oas, obs, ocs] = feval(solution,tVar);
                if isequal(oa,oas)
                    res = res + 1/num_output;
                end
                if isequal(ob,obs)
                    res = res + 1/num_ouput;
                end
                if isequal(oc,ocs)
                    res = res + 1/num_ouput;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input);
            end
        case '1  2'
            try
                [oa] = feval(nmStudentSolution,tVar{1},tVar{2});
                [oas] = feval(solution,tVar{1},tVar{2});
                if isequal(oa,oas)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input);
            end
        case '2  2'
            try
                [oa, ob] = feval(nmStudentSolution,tVar{1},tVar{2});
                [oas, obs] = feval(solution,tVar{1},tVar{2});
                if isequal(oa,oas)
                    res = res + 1/num_output;
                end
                if isequal(ob,obs)
                    res = res + 1/num_ouput;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input);
            end
        case '3  2'
            try
                [oa, ob, oc] = feval(nmStudentSolution,tVar{1},tVar{2});
                [oas, obs, ocs] = feval(solution,tVar{1},tVar{2});
                if isequal(oa,oas)
                    res = res + 1/num_output;
                end
                if isequal(ob,obs)
                    res = res + 1/num_ouput;
                end
                if isequal(oc,ocs)
                    res = res + 1/num_ouput;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input);
            end
        case '1  3'
            try
                [oa] = feval(nmStudentSolution,tVar{1},tVar{2},tVar{3});
                [oas] = feval(solution,tVar{1},tVar{2},tVar{3});
                if isequal(oa,oas)
                    res = res + 1/num_output;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input);
            end
        case '2  3'
            try
                [oa, ob] = feval(nmStudentSolution,tVar{1},tVar{2},tVar{3});
                [oas, obs] = feval(solution,tVar{1},tVar{2},tVar{3});
                if isequal(oa,oas)
                    res = res + 1/num_output;
                end
                if isequal(ob,obs)
                    res = res + 1/num_ouput;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input);
            end
        case '3  3'
            try
                [oa, ob, oc] = feval(nmStudentSolution,tVar{1},tVar{2},tVar{3});
                [oas, obs, ocs] = feval(solution,tVar{1},tVar{2},tVar{3});
                if isequal(oa,oas)
                    res = res + 1/num_output;
                end
                if isequal(ob,obs)
                    res = res + 1/num_ouput;
                end
                if isequal(oc,ocs)
                    res = res + 1/num_ouput;
                end
            catch ErrMess
                procesError(apStudentSol,ErrMess,num_input);
            end          
        otherwise
    end
end%for

end%function


function procesError(apStudentSol,ErrMess,num_input)

if ~contains(apStudentSol,'versie')
    if isequal(num_input,1)
        txterror = ['% Deze code werkt niet met de input: ' num2str(tVar)];
        txterror = [txterror newline 'Matlab error bericht: ' ErrMess.message];
        WriteToLastLineOfFile(apStudentSol,txterror);
    elseif isequal(num_input,2)
        txterror = ['% Deze code werkt niet met de input: ' num2str(tVar{1}) ' en ' num2str(tVar{2})];
        txterror = [txterror newline 'Matlab error bericht: ' ErrMess.message];
        WriteToLastLineOfFile(apStudentSol,txterror);
    elseif isequal(num_input,3)
        txterror = ['% Deze code werkt niet met de input: ' num2str(tVar{1}) ' en ' num2str(tVar{2}) ' en ' num2str(tVar{3})  ];
        txterror = [txterror newline 'Matlab error bericht: ' ErrMess.message];
        WriteToLastLineOfFile(apStudentSol,txterror);
    end
end

end %function
