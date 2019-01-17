% CONSTANTSCLASS <short description>
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
% DESCRIPTION: Class containing constants.
%
%
% BY: 2018  M. Schrauwen (markschrauwen@gmail.com)
%
%
% EXAMPLES:
%   con = ConstantsClass('PATH',GetPathOneLevelUp(mfilename('fullpath')),...
%   'NumberOfBonusAssignments',2,...
%   'WeeksForAssignment',{1:3,4:6});
%
%   con = ConstantsClass;


% $Revisi0n: 0.0.0 $  $Date: 2017-12-08 $
% Creation of class

classdef ConstantsClass
    
    properties (Constant)
        ADJUSTEDHASH = 'AANGEPASTE_MFILE_GEEN_PUNTEN';
        CHEATPOSTFIX = '_CHEAT';
        CHECKPOSTFIX = '_CHECK';
        DIRCLEANSRC = 'clean_source';
        DIRCLEANSRC_EXAMASS = 'exam_assignments';
        DIRCLEANSRC_FINALASS = 'bonus_assignments';
        DIRCLEANSRC_PROGASS = 'programming_assignments';
        DIRHEADER = [ConstantsClass.DIRCLEANSRC filesep 'headers'];
        DIRHELPER = 'helpercode';
        DIRSTUDENTNUMBERS = 'studentnumbers';
        DIRTHESES = 'theses';
        DIRTHESES_CLEANSRC = 'source_theses';
        DIRTHESES_GENERATED = 'generated_theses';
        EXT = '.m';
        FOLDERCHEAT = 'BESTANDEN_NIET_AAN_JOU_TOEGEWEZEN';
        LASTASSIGNMENT = 'LaatsteOpdracht.m';
        LISTWITHNEEDEDFOLDERS = {'helpercode' ConstantsClass.DIRCLEANSRC ConstantsClass.DIRSTUDENTNUMBERS ...
            ConstantsClass.TESTFOLDER ConstantsClass.STUDENTSUBFOLDER};     
        NAMEASSIGNMENTFOLDER = 'assignments';
        NAMERESULTMAT = 'resultatenWeek';
        NAMESUB_ASSIGNMENT = 'deelopdracht_';
        NAMEZIPMFILEFORSTUDENTS = 'AfrondenWeekOpdracht.m';
        NAMEZIPPEDWEEK = 'Biostatica_Programmeren_StudentOpdrachten_';
        NMBONUSASSIGNMENTDIR = 'BonusOpdracht';
        OTHERFILESINSTUDENTFOLDER = {ConstantsClass.NAMEZIPMFILEFORSTUDENTS 'studentnummer.m' ConstantsClass.LASTASSIGNMENT};
        POSTFIX_SOL4STUD = '_UITWERKING';
        PREFIX_THESES = 'th_';
        RATIO_PROGR = 0.8;
        RATIO_THESIS = 0.2;
        SOLPOSTFIX = '_SOL';
        STUDENTASSFOLDER = 'student_assignments';
        STUDENTNUMBERMAT = 'studentNum.mat';
        STUDENTSUBFOLDER = 'submitted';
        TESTFOLDER = 'fortesting';
        TYPEASSIGNMENTS = {'theses' 'programming'};
        TYPEASSIGNMENTSDUTCH = {'stelling' 'opdracht'};
        VAR_RESULT = 'ResStudentScript';
        WEEKFOLDERS = {'week1' 'week2' 'week3' 'week4' 'week5' 'week6' 'week7' 'week8'};
        YEAR = year(datetime);
        
    end
    
    properties (SetAccess = private)
        BASEFOLDER
        DATETIME
        AP_ASSIGNMENTS
        BONUSASSIGNMENTS
        NUM_BONUSASSIGNEMNTS
    end
    
    properties (SetAccess = public)
        BONUSASSNUMBER
    end
    
    methods
        %% Constructor: overloaded
        function obj = ConstantsClass(varargin)
            obj.BASEFOLDER = fileparts(fileparts(mfilename('fullpath')));
            addpath(genpath(fullfile(obj.BASEFOLDER,obj.DIRHELPER)));
            obj.DATETIME = datetimetxt();
            obj.AP_ASSIGNMENTS = fullfile(obj.BASEFOLDER,obj.NAMEASSIGNMENTFOLDER);
            %% Some defaults values that can be overwritten in the constructor
            obj.BONUSASSIGNMENTS{1} = 1:3;
            obj.BONUSASSIGNMENTS{2} = 4:6;
            obj.BONUSASSIGNMENTS{3} = 7:8;
            obj.NUM_BONUSASSIGNEMNTS = length(obj.BONUSASSIGNMENTS);
            NumberOfBonusAssignments = obj.NUM_BONUSASSIGNEMNTS ;
            WeeksForAssignment = obj.BONUSASSIGNMENTS;
            %% Parse varargin
            minargin = 0;
            maxargin = (minargin+3)*2;
            if nargin < minargin
                error([ mfilename ':Needs at minimum' num2str(minargin) ' argument(s) ']);
            end
            if nargin > maxargin
                error([ mfilename ':Needs max ' num2str(minargin) ' arguments ']);
            end
            
            if nargin > 1
                for narg = 1:nargin
                    try
                        sc = upper(varargin{narg});
                        switch sc
                            case {'PATH'}
                                obj.BASEFOLDER = varargin{narg+1};
                            case {'NUMBEROFBONUSASSIGNMENTS','NOBA'}
                                NumberOfBonusAssignments = varargin{narg+1};
                            case {'WEEKSFORASSIGNMENT', 'WFA'}
                                WeeksForAssignment = varargin{narg+1};
                                if ~isequal(length(WeeksForAssignment),NumberOfBonusAssignments)
                                    error([newline mfilename ': ' newline 'Number of bonus assignment does not match the given weeks' newline]);
                                end
                            otherwise
                                % Do nothing in the case of varargin{narg+1};
                        end
                    catch
                    end
                end
            elseif isequal(nargin,1) % Only ONE argument
                obj.BASEFOLDER = varargin{1};
            end
            
            % Change the default values
            if ~isequal(NumberOfBonusAssignments,length(obj.BONUSASSIGNMENTS)) || ...
                    ~isempty(WeeksForAssignment)
                for nBA = 1:NumberOfBonusAssignments
                    obj.BONUSASSIGNMENTS{nBA} = WeeksForAssignment{nBA};
                end
                obj.NUM_BONUSASSIGNEMNTS = NumberOfBonusAssignments;
            end
            
        end %function
    end %methods
    
    methods
        function out = BONUSASSNAME(obj,n)
            try
                out=[obj.NMBONUSASSIGNMENTDIR num2str(n)];
            catch
                out=[obj.NMBONUSASSIGNMENTDIR num2str(obj.BONUSASSNUMBER)];
            end
        end
    end
    
end %class