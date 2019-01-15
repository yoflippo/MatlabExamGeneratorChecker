function [oCopy] = adjustMFileToPrevent4EverWhile(apFile,code)
% ADJUSTMFILETOPREVENT4EVERWHILE <short description>
%
% ------------------------------------------------------------------------
%    Copyright (C) 2019  M. Schrauwen (markschrauwen@gmail.com)
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
% BY: 2019  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               varargin:   <text>
%               varargin:   <text>
%
% RETURN:
%               outvar:     <text>
%               outvar:     <text>
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2019-01-15 $
% Creation of this function.



blIsFile = false;
try
    if isdir(fileparts(apFile))
        %% Check if file is cleaned, if not clean
        blIsFile = true;
        if exist('code','var')
            oCopy = code;
        else
            [oCopy, ~, ~] = readCleanMFile('AP',apFile);
        end
    end
catch
    oCopy = apFile;
end


%% Find lines with while
linesWithWhile = find(contains(oCopy,'while'));

if any(linesWithWhile)
    %% Add global variable to code
    oCopy = ["global mscounter; mscounter = 1;" ;  oCopy; ""; "function o = funcCnt(c)"; " global mscounter; mscounter = c + 1;"; "o = mscounter;"; "end";];
    linesWithWhile = find(contains(oCopy,'while'));
    %% Add mscounter to while lines
    for n = linesWithWhile
        line = char(oCopy(n));
        line = insertAfter(line,'while','((');
        line = [line ') && (funcCnt(mscounter) < 1000))'];
        line = string(line);
        oCopy(n) = line;
    end
    
    if blIsFile
        delete(apFile)
        makeMFileFromCells(apFile,oCopy)
    end
    % edit(apFile)
end

end %function


% close all; clear variables;
% global mscounter; mscounter = 1;
% while true && (funcCnt(mscounter) < 100)
%     disp(num2str(mscounter))
% end
%
% function o = funcCnt(c)
% global mscounter; mscounter = c + 1;
% o = mscounter;
% end