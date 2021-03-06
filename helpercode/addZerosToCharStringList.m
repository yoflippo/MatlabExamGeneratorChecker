function olist = addZerosToCharStringList(list)
% ADDZEROSTOCHARSTRINGLIST <short description>
%
% ------------------------------------------------------------------------
%    Copyright (C) 2020  M. Schrauwen (markschrauwen@gmail.com)
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
% BY: 2020  M. Schrauwen (markschrauwen@gmail.com)
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

% $Revision: 0.0.0 $  $Date: 2020-01-15 $
% Creation of this function.

if isstring(list(1)) || ischar(list(1))
    blIsString = isstring(list(1));
    if blIsString
        list = char(list);
    end
    
    for i = 1:length(list)
        if list(i,1)== ' '
            list(i,1)= '0';
        end
    end
    
    if blIsString
        list = string(list);
    end
    
    olist = list;
else
    for i = 1:length(list)
        str = char(num2str(list(i)));
        if length(str) < 8
            olist(i) = string(['0' str]);
        else
            olist(i) = string(str);
        end
    end
end