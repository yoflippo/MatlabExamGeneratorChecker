function [outVar] = readTxtFile(varargin)
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
%               that is no option eather.
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

%% Parse varargin

namefunction = 'readTxtFile';
maxargin = 1;
minargin = 1;
if nargin < minargin
    error([ namefunction ':Needs at minimum' num2str(minargin) ' argument(s) ']);
end
if nargin > maxargin
    error([ namefunction ':Needs max ' num2str(minargin) ' arguments ']);
end

% % fExtension = [];
% % AbsPath = [];
% % AskUserForPath = [];
% % SearchString = [];
% % blAskUser = false;
% % blEdit = false;
% % blBreakpoint = false;
% % for narg = 1:nargin
% %     sc = upper(varargin{narg});
% %     switch sc
% %         case {'EXT'}
% %             fExtension = varargin{narg+1};
% %         case {'ABSPATH'}
% %             AbsPath = varargin{narg+1};
% %         case {'ASKUSER'}
% %             blAskUser = true;
% %         case {'SEARCHSTRING', 'SS'}
% %             SearchString = varargin{narg+1};
% %         case {'EDITIFFOUND', 'EIF'}
% %             blEdit = true;
% %         case {'SETBREAKPOINT', 'SBP'}
% %             blBreakpoint = true;
% %         otherwise
% %     end
% % end
% % 
% % if isempty(fExtension)
% %     error([ namefunction ' you need to specify an extension (see help)']);
% % end


fileID = fopen(varargin{1},'r');
c = 1;
warning off
tline{c,1} = fgets(fileID);
while ischar(tline{c,1})
    c = c + 1;
    tline{c,1} = fgets(fileID);
    % Remove ' \n ' characters
    tline{c,1} = strrep(tline{c,1},sprintf('\n'),'');
    tline{c,1} = strrep(tline{c,1},sprintf('\r'),'');
end
fclose(fileID);
warning on
tline{end,1} = [];
outVar = tline;
end
