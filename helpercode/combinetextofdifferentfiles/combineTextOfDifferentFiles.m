function [outVar] = combineTextOfDifferentFiles(varargin)
%COMBINETEXTOFDIFFERENTFILES <short description>
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
%               varargin:   different files
%
% RETURN:
%               outvar:     The lines of the different files
%
% EXAMPLES:
%               combineTextOfDifferentFiles('header_function.m');
%

% $Revision: 0.0.0 $  $Date: 2017-07-29 $
% Creation

%% Read the data of file
concatenatedTxt = {};
cnt = 1;
% fetch txt
for i = 1:length(varargin)
    % TODO: implement
    filename = varargin{i};
    txtCell = readTxtFile(filename);
    
    % copy text lines
    for j = 1:length(txtCell)
        concatenatedTxt{cnt} = txtCell{j};
        cnt = cnt + 1;
    end
    clear txtCell
end

outVar = concatenatedTxt;
end
