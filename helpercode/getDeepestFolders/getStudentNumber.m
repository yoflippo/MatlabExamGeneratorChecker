function [snum] = getStudentNumber()
apOld = pwd;
file = dirmf('studentnummer.m');
cd(file(1).folder)
studentnummer
cd(apOld)
snum = studentnumber;
end

