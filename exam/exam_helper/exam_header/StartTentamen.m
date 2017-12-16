%                         ===~ STARTTENTAMEN ~===
%
%
%                  ||
%                  \/
%
%
%      Druk op F5 en volg de instructies in het Command Window!
%
%
%                                         /\
%                                         ||
%
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
%               Dit script moet door studenten worden uitgevoerd als ze
%               beginnen met het tentamen.
%
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
%
% EXAMPLES:
%               none
%

% $Revisi0n: 0.0.0 $  $Date: 2017-10-12 $
% Creation of script









































%% STOP JE MOET TERUG NAAR BOVEN


























































%% STOP!!! JIJ MOET TERUG NAAR BOVEN 
















































































%% WAT BEN JIJ KOPPIG ZEG.... TERUG.... NU!!!



















































































%% JIJ HEBT HIER NIETS TE ZOEKEN, GA NU HELEMAAL TERUG NAAR BOVEN
mf = fileparts(mfilename('fullpath'));
if ~isequal(pwd,mf)
    warning off
    rmpath(genpath(mf))
    error([sprintf('\r\n') sprintf('\r\n') 'STOP! JE MOET OP "Change Folder"  DRUKKEN!'  sprintf('\r\n') sprintf('\r\n')])
end

clc;
snumber = input('Geef hier je studentnummer: ');
while numel(num2str(snumber)) < 8 | numel(num2str(snumber)) > 8
    if numel(num2str(snumber)) < 8
        warning('Je hebt te weinig cijfers opgegeven!');
        snumber = input('Geef hier opnieuw je studentnummer: ');
    elseif numel(num2str(snumber)) > 8
        warning('Je hebt te veel cijfers opgegeven!');
        snumber = input('Geef hier opnieuw je studentnummer: ');
    end
end

while isempty(input('Heb je jouw studentennummer correct ingevoerd? Ja = 1, Anders = 0, Druk op Enter): '))
    snumber = input('Geef hier opnieuw je studentnummer: ');
    if numel(num2str(snumber)) < 8
        warning('Je hebt te weinig cijfers opgegeven!');
    elseif numel(num2str(snumber)) > 8
        warning('Je hebt te veel cijfers opgegeven!');
    end
end

apThisFile = fileparts(mfilename('fullpath'));
apStudentNumber = fullfile(apThisFile,'studentnummer.m');
fileID = fopen(apStudentNumber,'w');
fprintf(fileID,'%s\r\n',['studentnumber = ' num2str(snumber) ';']);
clc
fullname = input('Geef nu je volledige naam: ','s')
fprintf(fileID,'%s\r\n',['fullname = ' char(39) fullname char(39) ';']);
fclose('all');

clc;
cd ..
disp('Start nu met deelopdracht_1')
disp('TIP: kijk eens naar de hoeveelheid opdrachten zodat je rekening kunt houden met de beschikbare tijd');