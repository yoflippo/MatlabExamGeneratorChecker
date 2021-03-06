function [bool cntFound linenumber linetxt] = readAndFindTextInFile(absPathOfFile,SearchString)

absPathFn = absPathOfFile;
delimiter = {''};
formatSpec = '%s%[^\n\r]';
fileID = fopen(absPathFn,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,...
    'TextType', 'string',  'ReturnOnError', false);
fclose(fileID);

bool = false;
linenumber = [];
linetxt = [];
cntFound = 0;
try
    for nLines = 1:length(dataArray{1,1})
        txt = dataArray{1,1}(nLines);
        % Search in the string
        if ~isempty(txt)
            if findstr(char(txt),SearchString)
                findstr(char(txt),'%');
                bool = true;
                linenumber = nLines;
                linetxt = txt;
                cntFound = cntFound + 1;
            end
        end
    end
catch
    error('Something went wrong');
end

end
