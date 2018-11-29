function exam_addHashAndHeader(ap,weekNames,nm)
%EXAM_ADDHASHANDHEADER
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
%               This is a script created to run along eCreateExam.m
%
%
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
%
% TODO: generate the hashes not all at once but for each week separately in
% the CreateWeekAssignments script.
%

% $Revisi0n: 0.0.0 $  $Date: 2017-10-08 $
% Creation of script.



%% Create new filenames (with HASH code AND combine file names)
addpath(genpath(ap.CurrExam))
cd(ap.Assignments)

savedHashes = [];
cntHash = 1;

try
    weekAssignments = dirmf();
    cd ..
    
    % traverse the folders
    for fl = 1:length(weekAssignments)
        tic;
        currentFile = weekAssignments(fl).name;
        currFileAbsPath = weekAssignments(fl).folder;
        currFileFull = fullfile(currFileAbsPath,currentFile);
        currentFileSOL = fullfile(currFileAbsPath,replace(currentFile,'.m','_SOL.m'));
        % find m-file with the answer/solution file
        if exist(currentFileSOL,'file')
            % check which types of questions are in the subfolder of the
            % current weekfolder
            subdirs = strsplit(currFileAbsPath,filesep);
            cd(fullfile(subdirs{end-2},subdirs{end-1},subdirs{end}))
            %Check for the presence of files below to give the proper
            %header in the student specific assignment
            if (exist(fullfile(currFileAbsPath, 'TypeOfAssignment_Multiplechoice.m'), 'file') == 2)
                header = combineTextOfDifferentFiles('default_header.m','header_question.m');
            elseif (exist(fullfile(currFileAbsPath, 'TypeOfAssignment_MakeScript.m'), 'file') == 2)
                header = combineTextOfDifferentFiles('default_header.m','header_script.m');
            elseif (exist(fullfile(currFileAbsPath, 'TypeOfAssignment_MakeFunction.m'), 'file') == 2)
                header = combineTextOfDifferentFiles('default_header.m','header_function.m');
            else
                error('The current folder does not contain a type file');
            end
            % Create header with hash of file
            headerHash{1} = header{1};
            % Be carefull, the following function needs unique data
            uniqueFN = generateUniqueFilename(currFileFull,year(datetime));
            % Test if a Hash is unique, could be
            if ~isempty(savedHashes)
                if  ~isempty(find(ismember(savedHashes,uniqueFN.Hash),1))
                    error('A Non unique HASH has been created');
                    cd(ap.BASEFOLDEREX);
                end
            end
            savedHashes{cntHash} = uniqueFN.Hash;
            cntHash = cntHash + 1;
            
            headerHash{2} = uniqueFN.HashCommentLine;
            % Add exam date
            headerHash{3} = ['%                            ' nm.CurrExamDir];
            
            %% Get points of assignment
            currPath = pwd;
            cd(currFileAbsPath);
            points
            cd(currPath);
            headerHash{4} = ['%                              Deelpunten: ' num2str(deelpunten)];
            
            %% Grab default header text for every m-file
            for hh = 2:length(header)
                headerHash{length(headerHash)+1} = header{hh};
            end
            headerHashSOL = headerHash;
            % Copy the clean/original file
            clear clean_file
            clean_file = combineTextOfDifferentFiles(currFileFull);
            for hh = 1:length(clean_file)
                headerHash{length(headerHash)+1} = clean_file{hh};
            end
            % Copy the clean/original SOLUTION file
            clear clean_file_SOL
            clean_file_SOL = combineTextOfDifferentFiles(currentFileSOL);
            for hh = 1:length(clean_file_SOL)
                headerHashSOL{length(headerHashSOL)+1} = clean_file_SOL{hh};
            end
            
            % Delete current file
            delete(currFileFull);
            delete(currentFileSOL);
            makeMFileFromCells(replace(currFileFull,'.m',''),headerHash)
            makeMFileFromCells(replace(currentFileSOL,'.m',''),headerHashSOL)
            if ~exist(currFileFull,'file')
                error(['There is a missing CHECK file: ' namefile]);
            end
            fclose('all');
            clear headerHash
            cd ..; cd ..; cd ..;
        end
        clc
        estPerc = round(fl/length(weekAssignments),2)*100;
        disp(['Give each assignment Hash-info: , progress: ' num2str(estPerc) '%']);
    end
catch causeException
    cd(ap.BASEFOLDEREX)
    disp(causeException);
    addpath(genpath(ap.CurrExam))
    error([mfilename ': problem with folder ']);
end

cd(ap.BASEFOLDEREX)
rmpath(genpath(ap.CurrExam));

end%function