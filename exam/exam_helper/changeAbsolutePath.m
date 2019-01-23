%CHANGEABSOLUTEPATH Change absolute path contained within a struct.
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
%               iStruct:    input struct containing different non-struct
%                           fields.
%
% RETURN:
%               oStruct:    output struct containing different non-struct
%                           fields.
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-12-21 $
% Creation of this function.

function [ oStruct ] = changeAbsolutePath( iStruct )

nmBASE = 'MATLAB_TOETS';
ap = extractBefore(pwd,nmBASE);
if isstruct(iStruct)
    field = fieldnames(iStruct)';
    for nf = 1:length(field)
        tmp = {iStruct.(field{nf})};
        for lf = 1:length(tmp)
            try
                if ~isnumeric(tmp{1}) && any(contains(tmp,'C:\'))
                    oStruct(lf).(field{nf}) = fullfile(ap,nmBASE,extractAfter(tmp{lf},nmBASE));
                else
                    oStruct(lf).(field{nf}) = iStruct(lf).(field{nf});
                end
            catch
                oStruct(lf).(field{nf}) = iStruct(lf).(field{nf});
            end
        end
    end
else
    error([newline mfilename ': ' newline 'Input should be struct with absolute paths']);
end

