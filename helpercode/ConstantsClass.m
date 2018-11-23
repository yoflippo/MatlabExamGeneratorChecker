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
        
        NAMERESULTMAT = 'resultatenWeek';
        VAR_RESULT = 'ResStudentScript';
        TESTFOLDER = 'fortesting';
        DIRSTUDENTNUMBERS = 'studentnumbers';
        DIRCLEANSRC = 'clean_source';
        DIRHEADER = [ConstantsClass.DIRCLEANSRC filesep 'headers'];
        LISTWITHNEEDEDFOLDERS = {'helpercode' ConstantsClass.DIRCLEANSRC ConstantsClass.DIRSTUDENTNUMBERS ...
            ConstantsClass.TESTFOLDER ConstantsClass.STUDENTSUBFOLDER};
        WEEKFOLDERS = {'week1' 'week2' 'week3' 'week4' 'week5' 'week6' 'week7' 'week8'};
        NMBONUSASSIGNMENTDIR = 'BONUSASSIGNMENT';
    end
    
    properties (SetAccess = private)
        BASEFOLDER
        DATETIME  
        Assignments
        BONUSASSIGNMENTS
        NUM_BONUSASSIGNEMNTS
    end
    
    methods
        %% Constructor: overloaded
        function obj = ConstantsClass(varargin)
            if isequal(nargin,1)
                obj.BASEFOLDER = varargin{1};
            else % Assume that this file is one dir deeper than basefolder
                obj.BASEFOLDER = fileparts(fileparts(mfilename('fullpath')));
            end
            obj.DATETIME = datetimetxt();
            obj.Assignments = fullfile(obj.BASEFOLDER,obj.NAMEASSIGNMENTFOLDER);
            obj.BONUSASSIGNMENTS{1} = 1:3;
            obj.BONUSASSIGNMENTS{2} = 4:6;
            obj.NUM_BONUSASSIGNEMNTS = length(obj.BONUSASSIGNMENTS);
        end
    end
end %class