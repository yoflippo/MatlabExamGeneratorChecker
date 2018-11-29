function replaceVraagOpdracht(apFile,number)
%REPLACEVRAAGOPDRACHT Replace the words 'vraag', 'vraag_', opdracht' and
%'opdracht_' in a case-INsensitive manner.
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
%               apFile:     absolute path of file that needs to be read.
%               number:     number of the replace 'vraag' / 'opdracht'.
%
% RETURN:
%               none
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-10-14 $
% Creation of this function.

%% Read the file
txt = readTxtFile(apFile);
if isempty(txt) || isequal(txt{1},-1)
    error([mfilename ': Something wrong with file -> ' apFile ]);
end

%% find the words in a file
tNum = num2str(number);
words = {'opdracht' 'Opdracht' 'vraag' 'Vraag' 'Stelling' 'stelling'};
for nW = 1:length(words)
    %     txt = regexprep(txt,['(?i)' words{nW} '[_][0-9]+'], [words{nW} '_' tNum]);
    txt = regexprep(txt,['' words{nW} '[_][0-9]+'], [words{nW} '_' tNum]);
    txt = regexprep(txt,['' words{nW} '[ ][0-9]+'], [words{nW} ' ' tNum]);
    txt = regexprep(txt,['' words{nW} '[_][0-9]+'], [words{nW} '_' tNum]);
    txt = regexprep(txt,['' words{nW} '[ ][0-9]+'], [words{nW} ' ' tNum]);
end

%% Write to file
try
    writetxtfile(apFile,txt);
catch err
    error([mfilename ': ' err.message]);
end
end
