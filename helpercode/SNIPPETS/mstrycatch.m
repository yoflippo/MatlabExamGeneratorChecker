try
    
    
catch err
    txterror = ['' newline];
    txterror = [txterror '' newline];
    error([mfilename ': ' newline err.message newline txterror]);
end