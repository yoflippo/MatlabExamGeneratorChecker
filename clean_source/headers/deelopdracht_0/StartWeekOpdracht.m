%STARTTENTAMEN
%
%
%                        ||
%                        \/
%
%
%                    Druk op de button RUN (F5)
%
%
%                            /\
%                            ||
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

% $Revisi0n: 0.0.0 $  $Date: 2017-11-28 $
% Creation of script









































%% STOP JE MOET TERUG NAAR BOVEN


























































%% STOP JIJ MOET TERUG NAAR BOVEN
















































































%% WAT BEN JIJ KOPPIG ZEG.... TERUG.... NU!!!



















































































%% JIJ HEBT HIER NIETS TE ZOEKEN, GA NU HELEMAAL TERUG NAAR BOVEN
clear variables
close all
clc
try
    cd(fileparts(mfilename('fullpath')))
catch
    error([newline newline newline newline 'Jij moet eerst de week eindopdracht uitpakken (unzippen)!' newline 'DOE DAT NU!' newline 'Doe je dat niet, dan loop je punten mis of gaan er zaken fout die niet fout mogen gaan.']);
end
cd ..;
dirs = dir;
errtxt = [newline newline '           LEES MIJ !!!!          ' newline newline 'Als je zo door gaat, gaat het fout. Je moet helemaal opnieuw beginnen.' newline 'Pak het verkregen zip-bestand (klik op het bestand, rechter muisknop enzv.).' newline 'Begin opnieuw met het uitvoeren van StartWeekOpdracht.m.' newline newline 'Jij mag namen van bestanden en folderstructuren e.d. niet aanpassen!'];

if ~any(contains({dirs.name},'deelopdracht_1')) || ~any(contains({dirs.name},'deelopdracht_2')) || ~any(contains({dirs.name},'AfrondenWeekOpdracht.m'))
  error('Kennelijk missen er folders die nodig zijn om een zinvol bestand aan te leveren. Kijk eens naar wat wij hebben aangeleverd en herstel de folders en structuren.');
end


disp('Alles lijkt goed te gaan. Ga aan de slag met deelopdracht_1')

