function [blResult] = isEqualCheckHelp(varAns,varStu,apStudScript,nameVar)
%ISEQUALCHECKHELP A helperfucntion that automatically give feedback about a
%possible error.
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
%               varAns:         some variable containing the solution.
%               varStu:         some variable of the student.
%               apStudScrip:    absolute path of student script.
%               nameVar:        name of the current variable.
%
% RETURN:
%               blResult:  true, if solution is correct false if error occured
%
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-02-10 $
% Creation of this script.

blResult = false;
try
    if  isequal(varAns,varStu)
        blResult = true;
    end
catch ErrMess
    % Write the error message to the student.
    WriteToLastLineOfFile(apStudScript,['% fout in variable: ' nameVar '. ' ErrMess.message]);
end

end