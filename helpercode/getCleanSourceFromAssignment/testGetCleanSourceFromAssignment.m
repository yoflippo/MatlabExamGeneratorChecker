% TESTGETCLEANSOURCEFROMASSIGNMENT <short description>
%
% ------------------------------------------------------------------------
%    Copyright (C) 2018  M. Schrauwen (markschrauwen@gmail.com)
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
% BY: 2018  M. Schrauwen (markschrauwen@gmail.com)
%
% 
% EXAMPLES:
%
%

% $Revisi0n: 0.0.0 $  $Date: 2018-12-07 $
%<Description>



clear all; close all; clc;
% Create copy of testdata
[currPath, nmCurrFile] = fileparts(mfilename('fullpath'));
cd(currPath)
nmRootMatlabBiostat = 'MATLAB_TOETS';

load('WorkSpacePerformAllAfterCheckingBonusOpdracht11812061028.mat')

apPathRoot = fullfile(extractBefore(pwd,nmRootMatlabBiostat),nmRootMatlabBiostat);
apPathRest = 'assignments\BonusOpdracht1\deelopdracht_5\opdracht_2\opdracht_2_versie_1.m'
apPathRest = strrep(apPathRest,'\',filesep);

apPathClean = con.DIRCLEANSRC
getCleanSourceFromAssignment(con);
