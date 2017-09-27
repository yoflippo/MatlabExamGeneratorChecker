function [bool] = readAndFindTextInFile(absPathOfFile,SearchString)

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
        if ~isempty(findstr(char(line),SearchString))
            blFoundFile = true;
            break;
        end
    end
    bool = blFoundFile;
catch
    error('Something went wrong');
end

end
