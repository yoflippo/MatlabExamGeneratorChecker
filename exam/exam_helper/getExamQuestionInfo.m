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
% exFiles.Scr = dirmf('TypeOfAssignment_MakeScript');
% exFiles.Fun = dirmf('TypeOfAssignment_MakeFunction');
ts1 = dirmf('TypeOfAssignment_MakeScript');
ts2 = dirmf('TypeOfAssignment_MakeFunction');
exFiles.FuncScrip = [ts1; ts2];

%% MC, Add hash, path of every SOL file and add random index to struct
nD = length(exFiles.MC);
randIndexD = randperm(nD); % create random index
for nM = 1:nD
    nMrand = randIndexD(nM); % add the files in random order to struct.
    cd(exFiles.MC(nMrand).folder)
    % Read points -> in deelpunten
    points
    files = dirmf('_SOL');
    randIndexF = randpermSpace(length(files)); % create random index
    la = length(files);
    files2 = struct('folder', cell(1, la), 'name', cell(1, la), 'Hash', cell(1, la));
    for nF = 1:length(files)
        nFrand = randIndexF(nF);  % add the files in random order to struct.
        cf = fullfile(files(nFrand).folder,files(nFrand).name);
        % Make a second struct with a new index
        files2(nF).folder = files(nFrand).folder;
        files2(nF).name = files(nFrand).name;
        files2(nF).Hash = GetHashCodeFromMFile(cf);
    end
    exFiles.MC(nMrand).files = files2;
    exFiles.MC(nMrand).index = randIndexD(nMrand);
    exFiles.MC(nMrand).points = deelpunten;
    exFiles.MC(nMrand).numVariants = length(files2);
    exFiles.MC(nMrand).usedForExam = 0;
    % Get week
    [~, e] = regexp(exFiles.MC(nMrand).folder,'week[0-9]+');
    exFiles.MC(nMrand).weekNr = str2double(exFiles.MC(nMrand).folder(e));
    
    clear files files2;
end
% Reorder the struct so every randomly assigned index is in an ascending order.
[~, ind] = sort([exFiles.MC.index]);
exFiles.MC = exFiles.MC(ind);


%% Get the functions and the scripts
nD = length(exFiles.FuncScrip);
randIndexD = randperm(nD); % create random index
for nM = 1:nD
    nMrand = randIndexD(nM); % add the files in random order to struct.
    cd(exFiles.FuncScrip(nMrand).folder)
    %% Read points -> in deelpunten
    points
    files = dirmf('_SOL');
    randIndexF = randperm(length(files)); % create random index
    for nF = 1:length(files)
        nFrand = randIndexF(nF);  % add the files in random order to struct.
        cf = fullfile(files(nFrand).folder,files(nFrand).name);
        % Make a second struct with a new index
        files2(nF).folder = files(nFrand).folder;
        files2(nF).name = files(nFrand).name;
        files2(nF).Hash = GetHashCodeFromMFile(cf);
    end
    exFiles.FuncScrip(nMrand).files = files2;
    exFiles.FuncScrip(nMrand).index = randIndexD(nMrand);
    exFiles.FuncScrip(nMrand).points = deelpunten;
    exFiles.FuncScrip(nMrand).numVariants = length(files2);
    exFiles.FuncScrip(nMrand).usedForExam = 0;
    % Get week
    [~, e] = regexp(exFiles.FuncScrip(nMrand).folder,'week[0-9]+');
    exFiles.FuncScrip(nMrand).weekNr = str2double(exFiles.FuncScrip(nMrand).folder(e));
    clear files files2;
end
%% Reorder the struct so every randomly assigned index is in an ascending order.
[~, ind] = sort([exFiles.FuncScrip.index]);
exFiles.FuncScrip = exFiles.FuncScrip(ind);

%% Reorder in number of points
[~, ind] = sort([exFiles.FuncScrip.points]);
exFiles.FuncScrip = exFiles.FuncScrip(ind);

% %% Reorder in weeks
% [~, ind] = sort([exFiles.FuncScrip.weekNr]);
% exFiles.FuncScrip = exFiles.FuncScrip(ind);

outVar = exFiles;
end
