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

% Test 1
testDataPath = fullfile(pwd,'week1','deelopdracht_1','vraag_1');
testFileWithPath = fullfile(testDataPath,'vraag_1_versie_1_SOL.m');
Hash = GetHashCodeFromMFile(testFileWithPath);
assert(isequal(Hash,'1a601144ed456929771db341e2b837fd'));

% Test 2
testFileWithPath = fullfile(testDataPath,'vraag_1_versie_1.m');
Hash = GetHashCodeFromMFile(testFileWithPath);
assert(isequal(Hash,'1a601144ed456929771db341e2b837fd'));

% Test 3
testDataPath = fullfile(pwd,'week1','deelopdracht_1','vraag_1');
testFileWithPath = fullfile(testDataPath,'vraag_1_versie_2_SOL.m');
Hash = GetHashCodeFromMFile(testFileWithPath);
assert(isequal(Hash,'d6c95f3ae4bb1d9a495f3da0780657a4'));

% Test 2
testFileWithPath = fullfile(testDataPath,'vraag_1_versie_2.m');
Hash = GetHashCodeFromMFile(testFileWithPath);
assert(isequal(Hash,'d6c95f3ae4bb1d9a495f3da0780657a4'));

