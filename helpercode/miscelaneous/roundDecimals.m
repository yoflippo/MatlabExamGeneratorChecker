function output = roundDecimals(number, decimals)
%ROUNDDECIMALS Round numbers to a certain precision
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
% PARAMETERS:number, decimals
%               number:   the number of which the precision had to be
%               adjusted
%               decimals:   number of decimals
%
% RETURN:       
%               output:     number with adjusted precision  
% 
% EXAMPLES:
%               roundDecimals(1.123456789,2) gives 1.12
%

% $Revision: 0.0.0 $  $Date: 2017-07-29 $
% Creation of script


%roundDecimals round data with specified number of decimals.
%   RoundedNumber = roundDecimals(number,decimals) 
%   By MS2013

decimal = 10^decimals;
output = sprintf('%g',(round(number*decimal))/decimal);

end
