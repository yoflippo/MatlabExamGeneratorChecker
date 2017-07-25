%giveEachMFileAHashCode
%
% ------------------------------------------------------------------------
%    Copyright (C) 2017  M. Schrauwen (mjschrau@hhs.nl)
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
% This script 
%
% 
% BY: 2017  M. Schrauwen (mjschrau@hhs.nl)
% 
% 
% USE:
%
% 
% EXAMPLES:
%
%

% $Revisi0n: 0.0.0 $  $Date: 20xx-xx-xx $
%<Description>


folders = getFolders(pwd);
clean_source = folders{1};
handle_source = 'source_with_handle'
%% Check if folder with handles are generated, if so delete that folder
for i = 1:length(folders)
    if folders{i} == handle_source
        rmdir handle_source
    end
end
mkdir(handle_source);
cd(handle_source);
handle_sourcefolder_abs = pwd;
cd ..
%% Copy clean_source folder
cd(clean_source)
subfolders = getFolders(pwd);
for i = 1:length(subfolder)
    cd(subfolders{i})
    % Get all the assignment folder
    assignment_folder = getFolders(pwd);
    for j = 1:length(assignment_folder)
         cd(assignment_folder{j})
        copyfile * handle_sourcefolder_abs;
        %%%%%%%%%%%%%%%%%SDFGJKJUYTRTHJY%$R
    end
    
end


versie = 1; generateUniqueFilename(folders{1},versie)
