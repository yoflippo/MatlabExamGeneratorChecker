function [oCopy, oApCopy, oNospaces] = readCleanMFile(varargin)
%READCLEANMFILE A simple function that make a copy of an M-file and cleans
%the copy.
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

% $Revision: 0.0.0 $  $Date: 2017-09-29 $
% Creation of the function

%% Parse varargin

% Test for right input
minargin = 1;
maxargin = minargin+4;
if nargin < minargin
    error([ mfilename ':Needs at minimum' num2str(minargin) ' argument(s) ']);
end
if nargin > maxargin
    error([ mfilename ':Needs max ' num2str(minargin) ' arguments ']);
end

if nargin == 1
    apDes = varargin{1};
    blMakeCopy = false;
    blNoSpaces = false;
    blUpper = false;
    blMC = false;
else
    % Create variables that need to be filled
    apDes = [];
    blMakeCopy = false;
    blNoSpaces = false;
    blUpper = false;
    blMC = false;
    oNospaces = [];
    
    for narg = 1:nargin
        sc = upper(varargin{narg});
        switch sc
            case {'-AP','AP', '-APDES'}
                apDes = varargin{narg+1};
            case {'-MAKECOPY', '-MC', 'MC'}
                blMakeCopy = true;
            case {'-NS', '-NOSPACES', 'NS'}
                blNoSpaces = true;
            case {'-UPPER', 'UPPER'}
                blUpper = true;
            case {'-MULCHOICE'}
                blMC = true;
                blUpper = true;
                blNoSpaces = true;
            otherwise
                % Do nothing in the case of varargin{narg+1};
        end
    end
    
    if isempty(apDes)
        error([mfilename ': no path given.']);
    end
end

%% Make copy so original file is kept intact
blMadeCopy = false;
if ~blMC
    apCopy = replace(apDes,'.m','_COPY.m');
    copyfile(apDes,apCopy);
    blMadeCopy = true;
    fclose('all');
else
    apCopy = apDes;
end

%% Clean up!
try
    delimiter = {'\n'};
    formatSpec = '%s';
    fileID = fopen(apCopy,'r');
    txt = textscan(fileID, formatSpec,'Whitespace','', 'Delimiter', delimiter,...
        'TextType', 'string',  'ReturnOnError', false);
    fclose('all');
    txt = txt{1,1};
catch err
    error([mfilename ': Could not read the file: ' err.message]);
end

%% Remove comments
for nL = 1:length(txt)
    if contains(txt(nL),'%')
        txt(nL) = extractBefore(txt(nL),'%');
    end
end

%% Remove trailling space
txt = deblank(txt);
% Remove empty lines
txt(all(txt=="",2),:)=[];

%% Remove 'clear' variants
txt = strrep(txt,'clear','%clear');
txt = strrep(txt,'input(','%input(');
txt = commentLineFromTxt(txt,'uigetfile');
txt = commentLineFromTxt(txt,'uigetdir');

%% Remove spaces do not change file
if blNoSpaces
    if ~isempty(txt) && isequal(txt{1},-1)
        txt = [];
    else
        txt = strrep(txt,' ','');
    end
end

%% Make upper
if blUpper
    txt = upper(txt);
end

if ~blMC
    %% Add semicolons should they be forgotten
    writetxtfile(apCopy,txt);
    oCopy = addSemiColons(apCopy);
else
    oCopy = txt;
end


if blMakeCopy
    oApCopy = apCopy;
else
    oApCopy = [];
    if blMadeCopy
        delete(apCopy);
    end
end

end %function