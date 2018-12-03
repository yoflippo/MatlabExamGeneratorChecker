function otxt = addSemiColons(apFile)
%ADDSEMICOLONS A script that automatically adds semicolons to a file.
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
%               apFile:   The absolute path of a script/function
%
% RETURN:
%               nothings
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-05-10 $
% Creation of script

faults = checkcode(apFile,'-id','-fullpath');

%% Search struct faults for certain keywords which say a semicolon is
% missing.
if ~isempty(faults)
    ccKeywords = {'NOPRT' 'PRTCAL' 'NOPTS'};
    index = [];
    for nK = 1:length(ccKeywords)
        index = [index find(strcmp({faults.id}, ccKeywords{nK})==1)];
    end
    index = sort(index);
    
    %% Read the file
    try
        txt = readTxtFile(apFile);
    catch
        error([mfilename ': Could not read the file']);
    end
    
    
    %% Add semicolons
    % Browse through faults
    for n = 1:length(index)
        idx = faults(index(n)).line;
        txt{idx} = [txt{idx} ';'];
    end
    
    % Add a semicolon for every file that ends with )
    bck = ')';
    % Walk through txt
    try
        for nL = (faults(1).line+1):length(txt)
            tmp = txt{nL}; % Remove cell bothersomeness and trailing spaces
            if ~isempty(tmp) && contains(tmp(end),bck) && ~contains(tmp(end),';') ...
                    && ~contains(tmp,iskeyword())
                tmp = [tmp ';'];
            end
            txt{nL} = tmp;
        end
    catch
    end
    
    
    %% Write to file
    writetxtfile(apFile,txt);
    otxt = txt;
else % no faults
    %% Read the file
    try
        otxt = readTxtFile(apFile);
    catch
        error([mfilename ': Could not read the file']);
    end
end % empty

end