function output = Limitdecplaces(varargin)
% LIMITDECPLACES - het limiteren van het aantal decimalen
% Gebaseerd op de Matlab functie 'round'.

%    Copyright (C) 2013  M. Schrauwen (mjschrau@hhs.nl)
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

%   eerste argument         : data
%   argument 'numbdecimals' : aantal decimalen die gewenst zijn. default
%                             worden 4 decimalen teruggegeven. 
% 
% MS2013 (m.j.a.j.schrauwen@hhs.nl)

% $Revisie: 1.0.0.0 $  $Datum: 2013-11-09 $


%% Testen op juiste input
if nargin > 3
    error(message('functie: Limitdecplaces. Stuur maximaal 3 argumenten mee (zie help)'));
end


%% Testen of er een vector is meegestuurd
data = varargin{1};
[l w] = size(data);
blOmgedraaid = 0;
if l<w %overal dezelfde indeling hanteren
    data = data';
    w = l;
    l = length(data);
    blOmgedraaid = 1; %test variabele, zie einde van dit script
end

%% lezen van meegestuurde parameters
numberOfDecimals = 4;
for i=1:nargin
    if ischar(varargin{i})
        switch varargin{i}
            case {'Numbdecimals',upper('numbdecimals'),lower('numbdecimals')}
                numberOfDecimals = varargin{i+1};
            otherwise
                disp(['-------------------------------------------------------']);
                disp(['WAARSCHUWING bij functie "Limitdecplaces":']);
                disp(['het argument: "' varargin{i} '" is geen geldig argument!']);
                disp(['']);
                disp(['-------------------------------------------------------']);
        end
    end
end

%% Afronden op het aantal decimalen
factor = 10^numberOfDecimals;
data = round(data*factor)/factor;


%% Herstellen naar oorspronkelijke opmaak
if blOmgedraaid
    output = data';
else
    output = data;
end















