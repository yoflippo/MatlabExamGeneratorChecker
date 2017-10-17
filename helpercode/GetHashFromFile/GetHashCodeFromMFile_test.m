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

% A testscript can be runned by the Matlab unit test environment by calling
% : result = runtests('<name of testscript>');
% For more info: https://nl.mathworks.com/help/matlab/ref/assert.html
% For more info: https://nl.mathworks.com/help/matlab/ref/runtests.html


clear all; close all; clc;
apTestData1 = replace(mfilename('fullpath'),'_test','_testdata1.m');
apTestData2 = replace(mfilename('fullpath'),'_test','_testdata2.m');

% Test 1
Hash = GetHashCodeFromMFile(apTestData1);
assert(~isempty(Hash));

% Test 2
Hash = GetHashCodeFromMFile(apTestData2);
assert(~isempty(Hash));

disp([replace(mfilename,'_test','') ': is working correctly']);


