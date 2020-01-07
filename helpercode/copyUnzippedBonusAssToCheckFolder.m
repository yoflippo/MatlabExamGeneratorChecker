% function [outVar] = copyUnzippedBonusAssToCheckFolder()
% COPYUNZIPPEDBONUSASSTOCHECKFOLDER <short description>
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

% $Revision: 0.0.0 $  $Date: 2019-01-18 $
% Creation of this function.

num = input('Give bonus assignment number: ');
while ~logical(input('Is this the right number? No = 0, Yes = else: '))
    num = input('Give bonus assignment number: ');
end

if ~exist('con','var')
    error([newline mfilename ': ' newline 'Need variable con' newline]);
end

ap.currFol = fullfile(con.BASEFOLDER,con.STUDENTSUBFOLDER,con.BONUSASSNAME(num));
ap.currFolUnzipped = [ap.currFol '_unzipped'];

try
    rmdir(ap.currFol,'s');
catch
end
mkdir(ap.currFol);
copyfiles(ap.currFolUnzipped,ap.currFol);
disp([mfilename ': FINISHED!!']);
% end %function

