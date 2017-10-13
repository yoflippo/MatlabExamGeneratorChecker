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
        OTHERFILESINSTUDENTFOLDER = {'AfrondenWeekOpdracht.m' 'studentnummer.m'};
        ADJUSTEDHASH = 'AANGEPASTE_MFILE_GEEN_PUNTEN';
        FOLDERCHEAT = 'BESTANDEN_NIET_AAN_JOU_TOEGEWEZEN';
        NAMEZIPMFILEFORSTUDENTS = 'AfrondenWeekOpdracht.m';
        NAMERESULTMAT = 'resultatenWeek';
        VAR_RESULT = 'ResStudentScript';
        TESTFOLDER = 'fortesting';
        DIRSTUDENTNUMBERS = 'studentnumbers';
        DIRCLEANSRC = 'clean_source';
        LISTWITHNEEDEDFOLDERS = {'helpercode' ConstantsClass.DIRCLEANSRC ConstantsClass.DIRSTUDENTNUMBERS ...
            ConstantsClass.TESTFOLDER ConstantsClass.STUDENTSUBFOLDER};
        WEEKFOLDERS = {'week1' 'week2' 'week3' 'week4'};
    end
    properties (SetAccess = private)
        BASEFOLDER
    end
    
    methods
        function obj = ConstantsClass(apBase)
            obj.BASEFOLDER = apBase;
        end
    end
end %class