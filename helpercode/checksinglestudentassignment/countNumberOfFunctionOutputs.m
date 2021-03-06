function num_output = countNumberOfFunctionOutputs(apSol)


%COMPARESCRIPTSOLSTUDENT A helperfunction for the testing the answers of
%students by comparing it to a Solution file.
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
%               txtns:          The txt of the cleaned file (readCleanMfile)
%                               without spaces.
%               literalsP:      The literals that must be present in the file.
%               apStudentSol:   The absolute path of the student solution.
%
% RETURN:
%               res:            The result (value between 0..1)


% $Revision: 0.0.0 $  $Date: 2017-10-17 $
% Creation of this function.

txt = removeCommentsAndEmptyLines([apSol '.m'],'ot');
num_output = 0;
% [txt, ~] = readCleanMFile(apSol)
if sum(contains(txt,'function')) > 0
    [~, lines, ~] = findRegEx(txt,'function');
    tl = extractAfter(txt{lines},'function');
    if contains(tl,'=')
        tl = extractBefore(tl,'=');
        if contains(tl,'[')
            tl = extractAfter(tl,'[');
            tl = extractBefore(tl,']');
             numCommas = length(strfind(tl,','));
             if isequal(numCommas,0)
             % Extra too many spaces
             tl = regexprep(tl,'(\[)( )+','[');
             tl = regexprep(tl,'( )+(\])',']'); 
             regexprep(tl,'( )+',' ')
             numSpaces = length(strfind(tl,' '));
             num_output = numSpaces + 1;
             else
                 num_output = numCommas + 1;
             end
        else
            num_output = 1;
        end
    end
else
    error([mfilename ': ' newline 'The solution file does not contain the keyword: FUNCTION!']);
end

end

