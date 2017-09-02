InitAll
cd helpercode
cd checkSingleStudentAssignments
load('dicHashesAbsPath')
load('dicAssignmentsAndPoints')
load('answerfiles_week1')
CheckSingleStudentAssignment('33333333',dicWithHashes,dicNameAssignmentAndPoints,answerFilesInDir);
cd(BASEFOLDER)