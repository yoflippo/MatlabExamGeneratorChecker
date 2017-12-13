%AFRONDENTENTAMEN
%
%
%                              ||
%                              \/
%
%
%               Druk op F5 en lees het Command Window.
%
%
%                              /\
%                              ||
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

% $Revisi0n: 0.0.0 $  $Date: 2017-10-12 $
% Creation of script





































































































% JIJ HEBT HIER NIETS TE ZOEKEN TERUG NAAR BOVEN!!!










































%% Ask for studentnumber
mf = fileparts(mfilename('fullpath'));
if ~isequal(pwd,mf)
    dbclear all
    warning off
    rmpath(genpath(mf))
    error([sprintf('\r\n') sprintf('\r\n') 'STOP! JE MOET OP "Change Folder"  DRUKKEN!'  sprintf('\r\n') sprintf('\r\n')])
end

newline = sprintf('\r\n'); %Matlab 2014 does not have the newline command
apThisFile = fileparts(mfilename('fullpath'));
cd(apThisFile)
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

txtInput = 'Heb je jouw studentennummer correct ingevoerd? Ja = 1, Anders = 0, Druk daarna op Enter): ';
while isempty(input(txtInput ))
    snumber = input('Geef hier opnieuw je studentnummer: ');
    if numel(num2str(snumber)) < 8
        warning('Je hebt te weinig cijfers opgegeven!');
    elseif numel(num2str(snumber)) > 8
        warning('Je hebt te veel cijfers opgegeven!');
    end
end

cd(apThisFile)
cd ..
apStartFile = fullfile(pwd,'deelopdracht_0');
cd(apStartFile)
studentnummer

warningtxt = 'Je moet nu echt goed gaan opletten, als je niet correct je studentnummer invoert, kunnen wij jouw tentamen niet nakijken!';
warningtxt = [warningtxt newline 'Als je niet zeker bent, of je bij "opdracht_0" je juiste studentnummer hebt ingevoerd, doe dit dan opnieuw!'];
% warningtxt = [warningtxt newline];
warningtxt = [warningtxt newline 'Voer vervolgens opnieuw: ' mfilename ' uit!'];
% warningtxt = [warningtxt newline];
warningtxt = [warningtxt newline 'Dit script stopt nu en StartTentamen.m wordt geopend! Voer StartTentamen.m opnieuw uit en volg de instructies!'];

if ~isequal(studentnumber,snumber)
    warning on
    warning(warningtxt)
    pause(2)
    open(fullfile(apStartFile,'StartTentamen.m'));
    return;
end

% Go to upper folder (the week folder)
cd ..
% Message to student
clc
snumber = num2str(snumber);
sprefix = 'TentamenBiostatica_';
disp('Er is een zip-bestand aangemaakt dat je moet inleveren: ')
disp('Dat zip-bestand heet: ');
disp(['                        ' sprefix snumber '.zip'])
% Zip the file
zip(['..' filesep sprefix snumber '.zip'],pwd)
filebrowser
cd ..
disp(' ');
disp(['Het zip-bestand staat hier: ']);
disp(pwd);
if ispc
    winopen(pwd)
end



