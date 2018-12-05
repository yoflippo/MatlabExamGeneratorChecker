classdef ConstantsClass
    
    properties (Constant)
        YEAR = year(datetime);
        STUDENTNUMBERMAT = 'studentNum.mat';
        NAMEASSIGNMENTFOLDER = 'assignments';
        STUDENTASSFOLDER = 'student_assignments';
        STUDENTSUBFOLDER = 'submitted';
        NAMEZIPPEDWEEK = 'Biostatica_Programmeren_StudentOpdrachten_';
        EXT = '.m';
        SOLPOSTFIX = '_SOL';
        CHECKPOSTFIX = '_CHECK';
        CHEATPOSTFIX = '_CHEAT';
        NAMEZIPMFILEFORSTUDENTS = 'AfrondenWeekOpdracht.m';
        LASTASSIGNMENT = 'LaatsteOpdracht.m';
        OTHERFILESINSTUDENTFOLDER = {ConstantsClass.NAMEZIPMFILEFORSTUDENTS 'studentnummer.m' ConstantsClass.LASTASSIGNMENT};
        ADJUSTEDHASH = 'AANGEPASTE_MFILE_GEEN_PUNTEN';
        FOLDERCHEAT = 'BESTANDEN_NIET_AAN_JOU_TOEGEWEZEN';
        POSTFIX_SOL4STUD = '_UITWERKING';
        NAMERESULTMAT = 'resultatenWeek';
        VAR_RESULT = 'ResStudentScript';
        TESTFOLDER = 'fortesting';
        DIRSTUDENTNUMBERS = 'studentnumbers';
        DIRCLEANSRC = 'clean_source';
        DIRCLEANSRC_PROGASS = 'programming_assignments';
        DIRCLEANSRC_FINALASS = 'bonus_assignments';
        DIRHEADER = [ConstantsClass.DIRCLEANSRC filesep 'headers'];
        LISTWITHNEEDEDFOLDERS = {'helpercode' ConstantsClass.DIRCLEANSRC ConstantsClass.DIRSTUDENTNUMBERS ...
            ConstantsClass.TESTFOLDER ConstantsClass.STUDENTSUBFOLDER};
        WEEKFOLDERS = {'week1' 'week2' 'week3' 'week4' 'week5' 'week6' 'week7' 'week8'};
        NMBONUSASSIGNMENTDIR = 'BonusOpdracht';
        RATIO_THESIS = 0.2;
        RATIO_PROGR = 0.8;
    end
    
    properties (SetAccess = private)
        BASEFOLDER
        DATETIME
        Assignments
        BONUSASSIGNMENTS
        NUM_BONUSASSIGNEMNTS
    end
    
    properties (SetAccess = public)
        BONUSASSNUMBER
    end
    
    methods
        %% Constructor: overloaded
        function obj = ConstantsClass(varargin)
            obj.DATETIME = datetimetxt();
            obj.Assignments = fullfile(obj.BASEFOLDER,obj.NAMEASSIGNMENTFOLDER);
            %% Some defaults values that can be overwritten in the constructor
            obj.BONUSASSIGNMENTS{1} = 1:3;
            obj.BONUSASSIGNMENTS{2} = 4:6;
            obj.NUM_BONUSASSIGNEMNTS = length(obj.BONUSASSIGNMENTS);
            
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
            else
                obj.BASEFOLDER = fileparts(fileparts(mfilename('fullpath')));
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
    
    methods (Static)
        function out = BONUSASSNAME(n)
            out=[ConstantsClass.NMBONUSASSIGNMENTDIR num2str(n)];
        end
    end
    
end %class