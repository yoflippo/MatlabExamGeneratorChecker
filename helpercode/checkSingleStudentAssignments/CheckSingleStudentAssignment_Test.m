clear all; close all; clc;
load('dicHashesAbsPath')
load('dicAssignmentsAndPoints')
load('answerfiles_week1')
CheckSingleStudentAssignment('22222222',dicWithHashes,dicNameAssignmentAndPoints,answerFilesInDir);