function [outVar] = getExamQuestionInfo(apExamDir)
%GETEXAMQUESTIONINFO a function that collects all info needed to check the
%exam questions. It contains the three different types of questions: MC,
%script questions and functions. Each folder contains a file that says
%which type of assignment (MC, script, function) it contains. This
%directory has got different versions of the same kind of questions. Each
%version has it's own name and hash code. This information is all collected
%in to one struct.
%
% This function also randomly orders all the questions.
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
%               apExamDir:  Absolute path of the exam questions
%
% RETURN:       
%               outVar:     Struct containing all information needed.    
% 
% EXAMPLES:
%               of struct: exFiles.MC(1).files(1).Hash
%

% $Revision: 0.0.0 $  $Date: 2017-10-09 $
% Creation of this function.
% TODO this function is not perfect. That is because MC-questions are
% unique if no other MCQ has the same two thesisses. However it is possible
% that this function uses two MCQ where MCQ1 has thesisA and MCQ2 also has
% thesisA....

%% Get exam subfolders
cd(apExamDir)
exFiles.MC = dirmf('TypeOfAssignment_Multiplechoice');
exFiles.Scr = dirmf('TypeOfAssignment_MakeScript');
exFiles.Fun = dirmf('TypeOfAssignment_MakeFunction');

%% Add hash, path of every SOL file and add random index to struct
substr = {'MC' 'Scr' 'Fun'};
for s = 1:length(substr)
    nD = length(eval(['exFiles.' substr{s}]));
    randIndexD = randperm(nD); % create random index
    for nMrand = 1:nD
        nM = randIndexD(nMrand); % add the files in random order to struct.
        eval(['cd(exFiles.' substr{s} '(nM).folder)']);
        %% Read points -> in deelpunten
        points
        files = dirmf('_SOL');
        randIndexF = randperm(length(files)); % create random index
        for nFrand = 1:length(files)
            nF = randIndexF(nFrand);  % add the files in random order to struct.
            cf = fullfile(files(nF).folder,files(nF).name);
            % Make a second struct with a new index
            files2(nFrand).folder = files(nF).folder;
            files2(nFrand).name = files(nF).name;
            files2(nFrand).Hash = GetHashCodeFromMFile(cf);
        end
        eval(['exFiles.' substr{s} '(nMrand).files = files2;'])
        eval(['exFiles.' substr{s} '(nMrand).index = num2str(randIndexD(nM));'])
        eval(['exFiles.' substr{s} '(nMrand).points = deelpunten;'])
        clear files;
    end
    %% Reorder the struct so every randomly assigned index is in an ascending order.
    eval([' [tmp ind] = sort({(exFiles.' substr{s}  '.index)}); ']);
    eval([' exFiles.' substr{s} ' = exFiles.' substr{s} '(ind); ']);
end

outVar = exFiles;
end
