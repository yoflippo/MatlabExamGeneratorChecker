function [ oStruct ] = changeAbsolutePath( iStruct )

nmBASE = 'Biostatica_Auto_Matlab';
ap = extractBefore(pwd,nmBASE);
if isstruct(iStruct)
    field = fieldnames(iStruct)';
    for np = 1:length(field)
        oStruct.(field{np}) = fullfile(ap,nmBASE,extractAfter(iStruct.(field{np}),nmBASE));
    end
else
    error([newline mfilename ': ' newline 'Input should be struct with absolute paths']);
end

