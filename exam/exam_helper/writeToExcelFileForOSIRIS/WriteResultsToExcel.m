function WriteResultsToExcel( apExcel,apMatGrades )

if ~exist(apExcel,'file')
    error([newline mfilename ': ' newline 'Does not exists ' apExcel newline]);
end
if ~exist(apMatGrades,'file')
    error([newline mfilename ': ' newline 'Does not exists ' apMatGrades newline]);
end

[~,excelData,~]=xlsread(apExcel);
% [le, we] = size(excelData);
% if ~isequal(we,3)
%     error([newline mfilename ': ' newline 'Excel file does not have correct size' newline]);
% end

load(apMatGrades)
if ~exist('grades','var')
    error([newline mfilename ': ' newline 'MAT file is not correct' newline]);
end
% remove zeros
grades = grades(~(grades(:,2)==0),:)
strGrades = string(grades);
% find place where grades start
[r,c] = find(contains(excelData,"Toetsdatum"));

filler = 'NA';
matrix = excelData(r+1:end,4);
txtVariant = {};
for ng = 1:length(strGrades)
    studNum = strGrades(ng,1); studGra = char(strGrades(ng,2));
    row = find(contains(excelData,studNum)==1)-8;
    if isempty(row)
        txtVariant = [txtVariant; {char(studNum) char(sprintf('%s',studGra))}];
        continue;
    elseif ~isempty(matrix{row}) && ~isequal(matrix{row},filler)
        keyboard % Apparantly the students already exists..
    else
        matrix{row} = studGra;
    end
end

%% Fill the remaining empty cells
idxEmpty = cellfun(@isempty,matrix)
matrix(idxEmpty)={filler}

%% Fill excelData with found student results
% it is assumed that column 'Resultaat' is direct to the right of
% 'Toetsdatum'
excelData((r+1):length(matrix)+r,c+1) = matrix;
endOfFoundStudents = length(matrix)+r;

%% Fill excelData with students not already present
try
% Fill studentnumbers
excelData(endOfFoundStudents+1:length(txtVariant)+endOfFoundStudents,1) = txtVariant(:,1);
% Fill grades
excelData(endOfFoundStudents+1:length(txtVariant)+endOfFoundStudents,c+1) = txtVariant(:,2);
catch
end

%% Fill file with date
% % % datetime.setDefaultFormats('default','dd-MM-yyyy');
% % % ds = char(datetime);
ds = input('Geef de exacte toets datum (dd-MM-yyyy)','s');
idxEmpty = logical([zeros(1,r) ones(1,length(txtVariant)+length(matrix))]');
excelData(idxEmpty,3)={ds};

%% Remove empty cells
idxEmpty = cellfun(@isempty,excelData);
excelData(idxEmpty)={''};

%% Write to excelfile
apExcelFin = extractBefore(apExcel,'.xlsx');
apExcelFin = [apExcelFin '_Filled.xlsx'];
xlswrite(apExcelFin,excelData)
disp([mfilename ': FINISHED!!']);
end

