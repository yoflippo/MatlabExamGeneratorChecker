%% Check if first lines of files are correct.

function plotPoints( )

if ~contains(pwd,'clean_source')
    error('Go the clean_source folder');
end

close all
file = dirmf('points');
currPath = pwd;
vect = [];
for i = 1:10
    cnt = 0;
    for nf = 1:length(file)
        apFile = fullfile(file(nf).folder,file(nf).name);
        value = readTxtFile(apFile);
        
        if contains(value,num2str(i))
            % % %         cd(fileparts(apFile));
            % % %         edit(apFile)
            % % %         keyboard
            cnt = cnt + 1;
        end
        
        clc
        disp(['Checking the headers of assignments and solutions, Progress: ' num2str(round(nf/length(file)*100,1)) ' %'])
    end
    cd(currPath);
    vect(i) = cnt;
end
loglog(1:10,vect)


