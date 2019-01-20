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

try
    cd(mf)
catch
    error([sprintf('\r\n') sprintf('\r\n') sprintf('\r\n') sprintf('\r\n') 'Jij moet eerst de week eindopdracht uitpakken (unzippen)!' sprintf('\r\n') 'DOE DAT NU!' sprintf('\r\n') 'Doe je dat niet, dan loop je punten mis of gaan er zaken fout die niet fout mogen gaan.']);
end

if ~isequal(pwd,mf)
    warning off
    rmpath(genpath(mf))
    error([sprintf('\r\n') sprintf('\r\n') 'STOP! JE MOET OP "Change Folder"  DRUKKEN!'  sprintf('\r\n') sprintf('\r\n')])
end

cd ..;
dirs = dir;
errtxt = [sprintf('\r\n') sprintf('\r\n') '           LEES MIJ !!!!          ' sprintf('\r\n') sprintf('\r\n') 'Als je zo door gaat, gaat het fout. Je moet helemaal opnieuw beginnen.' sprintf('\r\n') 'Pak het verkregen zip-bestand (klik op het bestand, rechter muisknop enzv.).' sprintf('\r\n') 'Begin opnieuw met het uitvoeren van StartWeekOpdracht.m.' sprintf('\r\n') sprintf('\r\n') 'Jij mag namen van bestanden en folderstructuren e.d. niet aanpassen!'];
if contains(pwd,'.zip')
    errtxt = [sprintf('\r\n') sprintf('\r\n') '  Je hebt het door ons aangeleverde zip-bestand niet uitgepakt!' sprintf('\r\n') 'Unzip (uitpakken) het zip-bestand NU!'];
    error(errtxt);
end

if ~any(contains({dirs.name},'deelopdracht_1')) || ~any(contains({dirs.name},'deelopdracht_2'))
    error('Er missen folders die nodig zijn om een zinvol bestand aan te leveren. Je zit toch niet vanuit een zip-bestand te werken? Kijk eens naar wat wij hebben aangeleverd en herstel de folders en structuren.');
end

clc;
snumber = input('Geef hier je studentnummer: ');
while numel(num2str(snumber)) < 8 || numel(num2str(snumber)) > 8
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

apStudentNumber = fullfile(mf,'studentnummer.m');
if exist(apStudentNumber,'file')
    delete(apStudentNumber)
end

fileID = fopen(apStudentNumber,'W');
fprintf(fileID,'%s\r\n',['studentnumber = ' num2str(snumber) ';']);
clc
fullname = input('Geef nu je volledige naam: ','s')
fprintf(fileID,'%s\r\n',['fullname = ' char(39) fullname char(39) ';']);
fclose('all');

clc;
cd(mf)
cd(fullfile('..','deelopdracht_1'))
disp([sprintf('\r\n') 'Start nu met deelopdracht_1, zie Current Folder' sprintf('\r\n')])
disp('TIP1: kijk eens naar de hoeveelheid opdrachten zodat je rekening kunt houden met de beschikbare tijd.');
disp(sprintf('\r\n'));
disp('TIP2: de meeste punten verdien je met de programmeeropdrachten (zie deelopdracht_2).');