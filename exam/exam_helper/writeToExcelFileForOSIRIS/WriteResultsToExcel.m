function WriteResultsToExcel( apExcel,apMatGrades )

if ~exist(apExcel,'file')
    error([newline mfilename ': ' newline 'Does not exists ' apExcel newline]);
end
if ~exist(apMatGrades,'file')
    error([newline mfilename ': ' newline 'Does not exists ' apMatGrades newline]);
end

[~,excelData,~]=xlsread(apExcel);
[le, we] = size(excelData);
if ~isequal(we,3)
    error([newline mfilename ': ' newline 'Excel file does not have correct size' newline]);
end

load(apMatGrades)
if ~exist('grades','var')
    error([newline mfilename ': ' newline 'MAT file is not correct' newline]);
end
strGrades = string(grades);
filler = 'NA';
matrix = excelData(:,2);
txtVariant = "";
for ng = 1:length(strGrades)
    studNum = strGrades(ng,1); studGra = char(strGrades(ng,2));
    row = find(contains(excelData,studNum)==1);
    if isempty(row)
        keyboard % Student does not exist!
        txtVariant = [txtVariant; string(sprintf('%s\t%s',studNum,studGra))];
        continue;
    elseif ~isempty(matrix{row}) && ~isequal(matrix{row},filler)
        keyboard % Apparantly the students already exists..
    else
        matrix{row} = studGra;
    end
    txtVariant = [txtVariant; string(sprintf('%s\t%s',studNum,studGra))];
end

% Fill the remaining empty cells
for n = 2:length(matrix)
    if isempty(matrix{n})
        matrix{n} = filler;
    end 
end

indEmpty = contains(matrix,filler);
otherStudents = excelData(indEmpty,1);
for n = 1:length(otherStudents)
   txtVariant = [txtVariant; string(sprintf('%s\t%s',otherStudents{n},filler))] ;
end
txtVariant = txtVariant(find(txtVariant~=""));
%% Write the files
writetxtfile(replace(apExcel,'.xls','.txt'),txtVariant);
xlswrite(apExcel,matrix,'Resultaat','B1')
end

