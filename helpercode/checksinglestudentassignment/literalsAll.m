function [res,num,weights] = literalsAll(txtns,checkingVar,apStudentSol)

res = 0;

%% Check for literal answers that MUST BE PRESENT
if ~isequal(mod(length(checkingVar.literalsP),2),0) %must be an even numer
    error([mfilename ': you are missing a checking parameter in CHECK file'])
end
[resP, w] = literalAnswersPresent(txtns,checkingVar.literalsP,apStudentSol);
res = res + resP;
weights.laPresent = w;

%% Check for literal answers that could be present reversed
num.Reversed = 0;
try
    res = res + literalAnswersReversed(txtns,checkingVar.literalsR,apStudentSol);
    num.Reversed = length(checkingVar.literalsR);
catch err
    warning(err.message);
end

%% Check for literal and their variants
num.Variants = 0;
try
    res = res + literalAnswersThisOrThat(txtns,checkingVar.literalsO,apStudentSol);
    num.Variants = length(checkingVar.literalsO);
catch err
    warning(err.message);
end

%% Check for literal and their variants AND their reverses
num.VariantsRev = 0;
try
    res = res + literalAnswersThisOrThatAndRev(txtns,checkingVar.literalsRO,apStudentSol);
    num.VariantsRev = length(checkingVar.literalsRO);
catch err
    warning(err.message);
end

%% Check for literals on the same line
num.SameLine = 0;
try
    res = res + literalSameLine(txtns,checkingVar.literalsSL,apStudentSol);
    num.SameLine = length(checkingVar.literalsRO);
catch err
%     warning(err.message);
end

end

