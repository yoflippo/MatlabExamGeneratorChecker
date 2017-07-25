function [ output_args ] = makeEmailadres(numbers,postfix)
%MAKEEMAILADRES creates a list of e-mailadresses based on a list of
%studentnumbers and the postfix.
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
%               numbers:   list with studentnumbers
%               postfix:   the postfix for creation of the e-mailadres. for
%               instance '@student.hhs.nl'.
%
% RETURN:       
%               output_args:     list with e-mail adresses.
% 
% EXAMPLES:
%
%

% $Revision: 0.0.0 $  $Date: 2017-03-10 $
%       Creation of this file

    if ~ischar(postfix)
        error('Type:makeEmailadres','the argument "postfix" is no string');
    end
    if isempty(numbers)
       error('Err:numberIsEmpty','the argument numbers is empty'); 
    end
    lstWithEmailAdresses = [];
    for i = 1:length(numbers)
        lstWithEmailAdresses{i} = [num2str(numbers(i)) postfix]; 
    end
    output_args = lstWithEmailAdresses;
end

