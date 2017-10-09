function [outVar] = makeMFileFromCells(nameFile, txtInCellFormat)
%MAKEMFILEFROMCELLS this function does exactly what the name suggests.
%Based on textInCellFormat a file will be created (based on nameFile) in
%the CURRENT FOLDER.
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
%               nameFile       :   the name of the m-file
%               txtInCellFormat:   cell variable with a line of txt in
%                                  every position
%
% RETURN:
%               NOTHING
%
%
% EXAMPLES:
% txt{1} = 'line 1';
% txt{2} = 'alsdkfjaskldfjaklsdjfkalsdfklja';
% txt{3} = '';
% txt{4} = 'lastline';
% nameFile = 'testCombinedShit';
% makeMFileFromCells(nameFile,txt);
% open([nameFile '.m']);
%
% END OF DESCRIPTION

% $Revision: 0.0.0 $  $Date: 2017-07-15 $
%<Description>

nameFile = erase(nameFile,'.m');
try
    FID = fopen([nameFile '.m'],'a');
    for i = 1:length(txtInCellFormat)
        fprintf(FID,'%s\r\n',txtInCellFormat{i});
    end
    fclose(FID);
catch
    % Try to make file
    try
        fclose(FID);
        FID = fopen([nameFile '.m'],'w');
        for i = 1:length(txtInCellFormat)
            fprintf(FID,'%s\r\n',txtInCellFormat{i});
        end
        fclose(FID);
    catch
    end
end
