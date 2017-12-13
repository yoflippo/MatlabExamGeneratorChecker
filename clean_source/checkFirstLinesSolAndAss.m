%% Check if first lines of files are correct.

function checkFirstLinesSolAndAss( )

if ~contains(pwd,'clean_source')
    error('Go the clean_source folder');
end

close all
postfix = '_SOL';
solfiles = dirmf(postfix);
for nf = 1:length(solfiles)
    apSol = fullfile(solfiles(nf).folder,solfiles(nf).name);
    apStu = replace(apSol,postfix,'');
    txtSol = readTxtFile(apSol);
    txtStu = readTxtFile(apStu);
    
    lStu = length(txtStu);
    lSol = length(txtSol);
    
    if isequal(lStu,lSol)
        fin = lSol -1;
    else
        fin = min(lStu,lSol);
    end
    
    if ~contains(txtSol{1},'Opdracht') && ~contains(txtSol{1},'Vraag') && ...
            ~contains(txtStu{1},'Vraag') && ~contains(txtStu{1},'Vraag')
        disp('FIRST LINE IS WRONG MOFO!');
        edit(apSol)
        edit(apStu)
        keyboard
    end
    
    for l = 1:fin
        if ~isequal(txtSol{l},txtStu{l})
            if ~contains(txtStu{l},'NaN')
                edit(apSol)
                edit(apStu)
                disp(['LOOK @ LINE NUMBER: ' num2str(l)]);
                disp(txtSol{l})
                disp('VS:')
                disp(txtStu{l})
                disp(['Progress: ' num2str(round(nf/length(solfiles)*100,1))])
                keyboard
                clc
                disp('Busy comparing SOLUTION files and assignments');
                break;
            end
        end
    end
    clc
    disp(['Checking the headers of assignments and solutions, Progress: ' num2str(round(nf/length(solfiles)*100,1)) ' %'])  
end

end

