function [outVar] = GetDictionaryWithHashAndLocation(absPath,SOLPOSTFIX)
%GETDICTIONARYWITHHASHANDLOCATION This function will get a dictionary with
%all the HashCodes from the base files generated. This dictionary can be
%used to quickly compare files.
%
% THIS FILE DEPENDS ON InitAll.m
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
%               absPath:   the absolute path that contains files
%               SOLPOSTFIX:     A unique piece of string in the filename of
%                               files in the absPath
%
% RETURN:
%               outVar:     a dictionary with hashcodes and absolute paths.
%
% EXAMPLES:
%               Dic = GetDictionaryWithHashAndLocation(pathFiles,'_SOL');
%               To see the keys of the dictionary: keys(Dic)
%               To see the values of the dictionary: values(Dic)

% $Revision: 0.0.0 $  $Date: 2017-09-21 $
% Creation of function

nameAssignmentFolder = absPath;
currPath = pwd;

if strfind(nameAssignmentFolder,'.')
    error('GetDictionaryWithHashAndLocation: location cannot contain file extension. Only give a path!');
end
cd(nameAssignmentFolder)
mfiles = dir(['**' filesep '*' SOLPOSTFIX '*.m']); 
cd(currPath)

% Get the hascodes
for nHash = 1:length(mfiles)
    p = fullfile(mfiles(nHash).folder,mfiles(nHash).name);
    HashCodes{nHash} = GetHashCodeFromMFile(p) ;
    Paths{nHash} = p;
end

% Combine the relevant files in a Container (dictionary) so the
% hashcode is combined with a location for fast lookup
try
    outVar = containers.Map(HashCodes,Paths);
catch err
    error([newline mfilename ',' err.message]);
end


end
