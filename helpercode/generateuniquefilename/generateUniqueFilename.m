function [output] = generateUniqueFilename(assignmentTitle,sVersion)
%GENERATEUNIQUEFILENAME based on the parameters creates a line of comment
%with an unique hash code AND generates new filename.
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
%               assignmentTitle:   this parameter contains the assignment name
%               (string)
%               sVersion:   this parameter is for changing the source file
%               in a next year. 
%
% RETURN:       
%               output:    this file does not generate output. However
%               after execution the clipboard contains a unique hash code
%               based on 
% 
% EXAMPLES:     generateUniqueFilename('assignment_1',1)
%
%

% $Revision: 0.0.0 $  $Date: 2017-03-20 $
%   Creation of file.

    sFileExtension = '.m';
    hashOpdr = DataHash([assignmentTitle num2str(sVersion)]);
    sUniqueName = [ assignmentTitle '_' hashOpdr sFileExtension];
    hashcommentline =['%                    |' hashOpdr '|'];
    comment = ['% ' assignmentTitle '  ' hashcommentline];
%     clipboard('copy',comment);
    output.UniqueName = sUniqueName;
    output.Hash = hashOpdr;
    output.HashCommentLine = hashcommentline;
    output.Comment = comment;
    output.Version = sVersion;
end

