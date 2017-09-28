classdef makeEmailadresTest < matlab.unittest.TestCase
    %readAssignments_TestBench 
    % https://nl.mathworks.com/videos/matlab-unit-testing-framework-74975.html
    
    properties
    end
    
    methods (Test)
        function giveWrongInput(testCase)
           testCase.verifyError(@()makeEmailadres([1111111; 22222],1),'Type:makeEmailadres')
        end
        
        function noInput(testCase)
           testCase.verifyError(@()makeEmailadres([],['']),'Err:numberIsEmpty')
        end
       
        function wrongInput(testCase)
           testCase.verifyError(@()makeEmailadres([],'tesr'),'Err:numberIsEmpty')
        end
        
        function checkElements(testCase)
            list = [1111
                2222];
            output = makeEmailadres(list,'@student.hhs.nl');
            testCase.verifyEqual(output{2},'2222@student.hhs.nl');
        end
    end
end


