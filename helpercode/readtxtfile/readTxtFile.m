function [oTxt oTxtBelowSep] = readTxtFile(varargin)
%READTXTFILE A simple function that reads every line of a text-based file.
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
%               A function that literally reads a txt-file. Also taking in
%               to account the empty lines. Other functions as: txtscan(),
%               fgetl(), fgets() appear not to have this option. The
%               function fileread() makes one long string of a file, so
%               that is no option.
%
%
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
% PARAMETERS:
%               fullpath:   the absolute path of a txt-file with filename.
%
% RETURN:
%               outvar:     a cell based variable.
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-09-15 $
% Creation of the function


%%% THIS FUNCTION CAN BE IMPROVED VERY MUCH!!!!
% % % % % % % % % delimiter = {'\n'};
% % % % % % % % % formatSpec = '%s';
% % % % % % % % % fileID = fopen(apScript,'r');
% % % % % % % % % txt = textscan(fileID, formatSpec,'Whitespace','', 'Delimiter', delimiter,...
% % % % % % % % %     'TextType', 'string',  'ReturnOnError', false);
% % % % % % % % % fclose(fileID);
% % % % % % % % % txt = txt{1,1};


%% Parse varargin

namefunction = 'readTxtFile';
minargin = 1;
maxargin = minargin+1;
if nargin < minargin
    error([ namefunction ':Needs at minimum' num2str(minargin) ' argument(s) ']);
elseif nargin > maxargin
    error([ namefunction ':Needs max ' num2str(minargin) ' arguments ']);
end

%% Proces needed input
if nargin >= minargin
    apFile = varargin{1};
end

blSeparatorPresent = false;
if nargin == maxargin
    separator = varargin{2};
    txtBelow = '';
    blSeparatorPresent = true;
end

blSeparatorFound = false;
try
    fileID = fopen(apFile,'r');
    c = 1;
    warning off
    tline{c,1} = fgetl(fileID);
%     tline{c,1} = removeReturnAndNewline(tline{c,1});
    while ischar(tline{c,1})
        c = c + 1;
        tmp = fgetl(fileID);
        % Do not use EOF
        if ~ischar(tmp)
            break;
        end     
        tline{c,1} = tmp;
 
        %% Test for separator
        if (blSeparatorPresent && contains(tmp,separator)) || blSeparatorFound
            if contains(tmp,separator)
                k = 1;
            end
            txtBelow{k,1} = tline{c,1};
            blSeparatorFound = true;
            k = k + 1;
        else
            lastline = c;
        end
    end
    fclose(fileID);
    warning on
    if tline{1} == -1
        oTxt = '';
    else
        oTxt = tline;
    end
    
    if blSeparatorFound
        oTxtBelowSep = char(txtBelow);
        % Remove line with separator
        oTxtBelowSep = oTxtBelowSep(2:end,:);
    else
        oTxtBelowSep = '';
    end
catch
    fclose(fileID);
end

end %function readTxtFile
