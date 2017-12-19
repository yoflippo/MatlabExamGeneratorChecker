cd(ap.Submitted)
nm = 'Gaan8.txt';
files = dirmf(nm);
apNew = fullfile(ap.CurrExam,nm);

for n = 1:length(files)
   copyfile(apNew,files(n).folder);  
end