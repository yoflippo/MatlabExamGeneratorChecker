% add all (sub)folder
addpath(genpath(pwd));
suite = matlab.unittest.TestSuite.fromFolder(pwd);
result = run(suite);
cd ..