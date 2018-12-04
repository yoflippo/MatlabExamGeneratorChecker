function [grade, grade_theses, grade_prog] = calculateGrade(con, strPoints, numTheses)

%% Calculate Thesis grade
pointsPerAssignment = strPoints.pointsAss;
weightTheses = pointsPerAssignment(1);
sumThesesPointsStud = sum(strPoints.pointsAssStud(1:numTheses));
sumThesesPoints = sum(pointsPerAssignment(1:numTheses));
sumProgrammingPoints = sum(pointsPerAssignment(numTheses+1:end));
sumProgrammingPointsStud = sum(strPoints.pointsAssStud(numTheses+1:end));
% first half of theses points
% 10
%   |                  /
%   |                 /
%   |                /
%  5|               /
%   |              /
%   |             /
%   |            /
%  1| _ _ _ _ _ /
%   |====================num_points
sumThesesPointsStud = sumThesesPointsStud-((numTheses/2)*weightTheses);
if sumThesesPointsStud > 0
    ratio = sumThesesPointsStud/(sumThesesPoints/2);
    grade_theses = (ratio*9)+1;
else % no points
    grade_theses = 1;
end

%% Calculate grade programming assignments
if sumProgrammingPointsStud > 0
    ratio = sumProgrammingPointsStud/sumProgrammingPoints;
    grade_prog = (ratio*9)+1;
else % no points
    grade_prog = 1;
end


% Final Grade
grade = con.RATIO_THESIS * grade_theses + con.RATIO_PROGR*grade_prog;

end%function

