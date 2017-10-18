function [res,nAbs, num] = literalsAll(txtns,checkingVar,apStudentSol)

    res = 0;

 %% Check for literal answers that MUST BE PRESENT
    res = res + literalAnswersPresent(txtns,checkingVar.literalsP,apStudentSol);
    
    %% Check for literal answers, CAN NOT BE PRESENT
    nAbs = literalAnswersNotPresent(txtns,checkingVar.literalsA,apStudentSol);
    
    %% Check for literal answers that could be present reversed
    num.Reversed = 0;
    try
        res = res + literalAnswersReversed(txtns,checkingVar.literalsR,apStudentSol);
        num.Reversed = length(checkingVar.literalsR);
    catch
    end
    
    %% Check for literal and their variants
    num.Variants = 0; 
    try
        res = res + literalAnswersThisOrThat(txtns,checkingVar.literalsO,apStudentSol);
        num.Variants = length(checkingVar.literalsO);
    catch
    end
    
    %% Check for literal and their variants AND their reverses
    num.VariantsRev = 0; 
    try
        res = res + literalAnswersThisOrThatAndRev(txtns,checkingVar.literalsRO,apStudentSol);
        num.VariantsRev = length(checkingVar.literalsRO);
    catch
    end
    

end
