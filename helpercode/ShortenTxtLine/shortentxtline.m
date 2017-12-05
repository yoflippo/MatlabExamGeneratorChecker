function [ newtxt ] = shortentxtline( varargin )
%<NAMEINCAPTIALS> <short description>
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

% $Revision: 0.0.0 $  $Date: 20xx-xx-xx $
% Creation of this function.


minargin = 1;
maxargin = (minargin+1)*2;
if nargin < minargin
    error([ mfilename ':Needs at minimum' num2str(minargin) ' argument(s) ']);
end
if nargin > maxargin
    error([ mfilename ':Needs max ' num2str(minargin) ' arguments ']);
end

% Create variables that need to be filled
txt = [];
linecolumn = 55;

if nargin > (minargin+2)
    for narg = 1:nargin
        sc = upper(varargin{narg});
        switch sc
            case {'TXT', '-TXT'}
                SearchString = varargin{narg-1};
            case {'LINECOLUMN', 'LC', '-LC'}
                SearchString = varargin{narg-1};
            otherwise
                % Do nothing in the case of varargin{narg+1};
        end
    end
elseif nargin == 2
    txt = varargin{1};
    linecolumn = varargin{2};
elseif nargin == 1
    txt = varargin{1};
else
    error([newline mfilename ': ' newline 'Impossible imput' newline]);
end

% Make one big line
ntxt = [];
ntxt = strcat(ntxt,txt(1))
for i = 2:length(txt)
    if strlength(txt(i)) > 30 && txt(i) ~= ""
    ntxt = strcat(ntxt," ",txt(i))
    else
        BUSY )(*&^%$#@!@#$%^&
    end
end
cntxt = char(ntxt);

%% Make new lines
cnt = 1;
tmptxt = cntxt;
while ~isempty(tmptxt)
    if length(tmptxt) > linecolumn
        lb = max(find(tmptxt(1:linecolumn) == ' '))
        newtxt(cnt,1) = string(tmptxt(1:lb))
        tmptxt = tmptxt(lb+1:end);
        cnt = cnt + 1;
    else
        newtxt(cnt) = tmptxt;
        break
    end
end

end



