classdef extractIndividualAssignmentsTest < matlab.unittest.TestCase
    %EXTRACTINDIVIDUALASSIGNMENTSTEST
    % 2017  M. Schrauwen (mjschrau@hhs.nl)
    % https://nl.mathworks.com/videos/matlab-unit-testing-framework-74975.html
    
    properties
    end
    
    methods (Test)
        function EmptyFolder(testCase)
           emptyFolder = 'testAssignmentsEmpty';
           testCase.verifyError(@()extractIndividualAssignments(emptyFolder),'Err:emptyFolder')
        end
%         
%         function noInput(testCase)
%            testCase.verifyError(@()makeEmailadres([],['']),'Err:numberIsEmpty')
%         end
%        
%         function wrongInput(testCase)
%            testCase.verifyError(@()makeEmailadres([],'tesr'),'Err:numberIsEmpty')
%         end
%         
%         function checkElements(testCase)
%             list = [1111
%                 2222];
%             output = makeEmailadres(list,'@student.hhs.nl');
%             testCase.verifyEqual(output{2},'2222@student.hhs.nl');
%         end
    end
end
