classdef readFilesInSubFolderTest < matlab.unittest.TestCase
    %readAssignments_TestBench 
    % https://nl.mathworks.com/videos/matlab-unit-testing-framework-74975.html
    
    properties
    end
    
    methods (Test)
        function testFilesFound(testCase)
           currFolder = pwd;
           cd ..
           output = readFilesInFolder(['assignments']);
           cd(currFolder)
           testCase.verifyEqual(output.blFound,1);
        end
        
        function testFindingNonExistingFolder(testCase)
           output = readFilesInFolder('nonExisting');
           testCase.verifyEqual(output.blFound,0);
        end  
    end  
end
