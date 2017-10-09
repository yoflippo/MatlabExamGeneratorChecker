function [outVar] =getExamQuestionInfo(apExamDir)
%GETEXAMQUESTIONINFO a function that collects all info needed to check the
%exam questions. It contains the three different types of questions: MC,
%script questions and functions. Each folder contains a file that says
%which type of assignment (MC, script, function) it contains. This
%directory has got different versions of the same kind of questions. Each
%version has it's own name and hash code. This information is all collected
%in to one struct.
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

%% Get exam subfolders
cd(apExamDir)
exFiles.MC = dirmf('TypeOfAssignment_Multiplechoice');
exFiles.Scr = dirmf('TypeOfAssignment_MakeScript');
exFiles.Fun = dirmf('TypeOfAssignment_MakeFunction');

%% Add hash, path of every SOL file and add random index to struct
substr = {'MC' 'Scr' 'Fun'};
for s = 1:length(substr)
    for nM = 1:length(eval(['exFiles.' substr{s}]))
        eval(['cd(exFiles.' substr{s} '(nM).folder)']);
        files = dirmf('_SOL');
        randIndex = randperm(length(files)); % create random index
        for nF = 1:length(files)
            cf = fullfile(files(nF).folder,files(nF).name);
            files(nF).Hash = GetHashCodeFromMFile(cf);
            files(nF).RandIndex = randIndex(nF);
        end
        eval(['exFiles.' substr{s} '(nM).files = files;'])
        clear files;
    end
end

outVar = exFiles;
end
