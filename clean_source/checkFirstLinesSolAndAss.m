%% Check if first lines of files are correct.

% function checkFirstLinesSolAndAss( )

if ~contains(pwd,'clean_source')
    error('Go the clean_source folder');
end

close all
postfix = '_SOL';
solfiles = dir(['**' filesep '*_SOL.m']);
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
    
    if ~contains(txtSol{1},'Opdracht') && ~contains(txtSol{1},'Stelling') && ...
            ~contains(txtStu{1},'Stelling') && ~contains(txtStu{1},'Vraag')
        disp('FIRST LINE IS WRONG MOFO!');
        edit(apSol)
        edit(apStu)
        keyboard
    end
    
    for l = 1:fin
        if ~isequal(txtSol{l},txtStu{l}) && length(txtSol{l})>1 && contains(txtSol{l}(1),'%')
            if ~contains(txtStu{l},'NaN')
                edit(apSol)
                edit(apStu)
                disp(['LOOK @ LINE NUMBER: ' num2str(l)]);
                disp(txtSol{l})
                disp('VS:')
                disp(txtStu{l})
                disp(['Progress: ' num2str(round(nf/length(solfiles)*100,1))])
                
                edtSvc  = com.mathworks.mlservices.MLEditorServices ;
                edtList = edtSvc.getEditorApplication.getOpenEditors.toArray ;
                edtList(end).bringToFront;
                endPosition = edtList(end).getDocument.getLength;
                edtList(end).setCaretPosition(endPosition);
                % Also set caret for second to last files
                endPosition = edtList(end-1).getDocument.getLength;
                edtList(end-1).setCaretPosition(endPosition);
                commandwindow
                if isequal(input('Do you want to close The opened scripts? Yes = 1, No = else '),1)
                    % Close opened scripts
                    edtSvc  = com.mathworks.mlservices.MLEditorServices ;
                    edtList = edtSvc.getEditorApplication.getOpenEditors.toArray ;
                    edtList(end).close;
                    edtList(end-1).close;
                end
                
                clc
                disp('Busy comparing SOLUTION files and assignments');
                break;
            end
        end
    end
    clc
    disp(['Checking the headers of assignments and solutions, Progress: ' num2str(round(nf/length(solfiles)*100,1)) ' %'])
end