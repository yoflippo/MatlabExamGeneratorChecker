%AFRONDENWEEKOPDRACHT
%
%
%                    Open dit script en druk op F5
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
%               klaar zijn met de weekopdracht. Dit script pakt alle
%               bestanden in een zipbestand dat automatisch correct van een
%               naam wordt voorzien. Als je dit script niet uitvoert en
%               zelfstandig alle bestanden inpakt is het mogelijk dat er
%               geen punten worden toegekend aan de weekopdracht.
%
% BY: 2017  M. Schrauwen (markschrauwen@gmail.com)
%
%
% EXAMPLES:
%               none
%

% $Revisi0n: 0.0.0 $  $Date: 2017-07-29 $
% Creation of script

% Extract studentnumber
try
    studentnummer;
catch
    error('Het bestand ''studentnummer.m'' niet gevonden!! Als je de bestanden en folderstructuur niet intact laat krijg je geen punten vooor de weekopdracht');
end
% Go to upper folder (the week folder)
cd ..
% Message to student
clc
disp('Er is nu zip-bestand aangemaakt die je moet opsturen: ')
disp('Dat zip-bestand heet: ');
disp(['                        Biostatica_ToSubmit_' currentStudentNumber '.zip'])
% Zip the file
zip(['..' filesep 'Biostatica_ToSubmit_' currentStudentNumber '.zip'],pwd)
filebrowser
cd ..
disp(" ");
disp(['Het zip-bestand staat hier: ']);
disp(pwd);
if ispc
    winopen(pwd)
end


