function olist = addZerosToCharStringList(list)

if isstring(list(1)) || ischar(list(1))
    
    
    blIsString = isstring(list(1));
    if blIsString
        list = char(list);
    end
    
    for i = 1:length(list)
        if list(i,1)== ' '
            list(i,1)= '0';
        end
    end
    
    if blIsString
        list = string(list);
    end
    
    olist = list;
    
else
    for i = 1:length(list)
        str = char(num2str(list(i)));
        if length(str) < 8
            olist(i,1:8) = string(['0' str]);
        else
            olist(i,1:8) = string(str);
        end
    end
end