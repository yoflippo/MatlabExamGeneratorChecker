
  copyfile([source filesep '*'],destination)
  

FM_dir = fullfile(origin_training, 'FM');
destination = fullfile(mother_folder, 'FM');
curdir = cd(FM_dir);
FM = dir('*.png');
cmd = ['copy ', sprintf('%s ',FM.name), destination];
system(cmd);
cd(curdir);