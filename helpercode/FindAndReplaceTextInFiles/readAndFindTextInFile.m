function [bool] = readAndFindTextInFile(absPathOfFile,SearchString,NotInComment)

absPathFn = absPathOfFile;
delimiter = {''};
formatSpec = '%s%[^\n\r]';
fileID = fopen(absPathFn,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,...
    'TextType', 'string',  'ReturnOnError', false);
fclose(fileID);

try
    for nLines = 1:length(dataArray{1,1})
        line = dataArray{1,1}(nLines);
        blFoundFile = false;
        % Search in the string
        if ~isempty(line)
            if findstr(char(line),SearchString)
              if NotInComment
                  
                  XXX MAKE IT SO THAT USER CAN CHECK FOR MATLAB COMMENTS IN FOUND STRING
                  
                 findstr(char(line),'%') 
              end
            blFoundFile = true;
            break;
            end
        end
    end
    bool = blFoundFile;
catch
    error('Something went wrong');
end

end
