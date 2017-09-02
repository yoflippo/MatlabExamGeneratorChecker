function result = CheckSingleStudentAssignment(studentdir, dicCheckFilesAbsPath,dicNameAssignmentAndPoints,answerFilesInDir)
%CHECKSINGLESTUDENTASSIGNMENT A function that checks a students week
%assignment.
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
%               1 - This functin expects an absolute path to the student folder
%               or it expects to be in the correct current folder.
%               2 - All directories that are accested should be added to the
%               Matlab path.
%               3 - It also needs to read the hash per student m-file. So the
%               right functions have to be on the path.
%               4 - It expects that m-files that do not have the right has
%               code or that have no SOLUTIONS files to be renamed in
%               non-m-files.
%               5 - Need a dictionary with hash and number of points for
%               each assignment..
%
%
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               studentdir:   name of the student folder
%               hashdic:   the dictionary with the hashes.
%
% RETURN:
%               result:     the percentage of right answers and solution.
%                           They are given as a percentage.
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-08-27 $
% Creation of the function file

%% Check if directory exists
NAMEOFTHISCRIPT = 'CHECKSINGLESTUDENTASSIGNMENT';
currPath = pwd;

if isequal(exist(studentdir),0)
    error([NAMEOFTHISCRIPT ': The accessed folder does not exists'])
end

%% Check the m-files in student directory
% Get mfiles
cd(studentdir);
mfiles = dir('**/*.m');
% Get files with hashcode
mfilesWithHash = [];
HashOfmfiles = [];
cntFile = 1;
for i = 1:length(mfiles)
    try
        absPath = fullfile(mfiles(i).folder,mfiles(i).name);
        HashOfmfiles{cntFile} = GetHashCodeFromMFile(absPath);
        mfilesWithHash{cntFile} = absPath;
        cntFile = cntFile + 1;
    catch
    end
end

%% Find the associated solution files
sumPoints = 0;
for i = 1:length(mfilesWithHash)
    % Get the check file for this assignment
    absPathCheckfile = dicCheckFilesAbsPath(HashOfmfiles{1,i})
    % Save it in a variable used by the solution
    AbsPathSOLScript = replace(absPathCheckfile,'CHECK','SOL');
    % Get the type of the file: opdracht_x, vraag_x
    AbsPathStudentScript = mfilesWithHash{1,i};
    [p,n,e] = fileparts(AbsPathStudentScript);
    % Get the number of points for this assignment
    pointsForCurrentAssignment = dicNameAssignmentAndPoints(n);  
    %Start checking
    run(absPathCheckfile);
    % Calcule partialpoints
    sumPoints = sumPoints + (pointsForCurrentAssignment * ResStudentScript);
end


end
