function deleteTemporaryFiles()
%DELETETEMPORARYFILES A simple function that deletes temporarily created
%files with certain postfixes in current folder.
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
%               Nothing.
%
% RETURN:
%               Nothing.
%
% EXAMPLES:
%               Just call this function after you created some temporary
%               files.
%

% $Revision: 0.0.0 $  $Date: 2017-10-17 $
% Creation of this function.

try
    % Add postfix of files that need to be deleted.
    tmpPostFixes = {'_COPY' '_NS'};
    cfiles = [];
    for nT = 1:length(tmpPostFixes)
        cfiles = [cfiles; dirmf(tmpPostFixes{nT})];
    end
    
    warning off
    for n = 1:length(cfiles)
        apFile2Del = fullfile(cfiles(n).folder,cfiles(n).name);
        delete(apFile2Del);
        if exist(apFile2Del,'file')
            error([mfilename ', This file should be deleted: ' apFile2Del]);
        end
    end
    warning on
catch err
    error([mfilename ': Delete the tmp files :' err.message]);
end

end%function

