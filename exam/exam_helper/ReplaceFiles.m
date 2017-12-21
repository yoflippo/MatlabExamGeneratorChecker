% cd(ap.Submitted)
cd('tmp_unzipped')
nm = 'Gaan8.txt';
files = dirmf(nm);
apNew = fullfile(ap.CurrExam,nm);

for n = 1:length(files)
   copyfile(apNew,files(n).folder);  
end