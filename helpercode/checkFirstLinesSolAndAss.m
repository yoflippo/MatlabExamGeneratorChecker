function checkFirstLinesSolAndAss( )
postfix = '_SOL';
solfiles = dirmf(postfix);

for nf = 1:solfiles
   apSol = fullfile(solfiles(nf).folder,solfiles(nf).name);
   apStu = replace(apSol,postfix,'');
   txtSol = readTxtFile(apSol);
   txtStu = readTxtFile(apStu);
   
   for l = 1:10
      if ~isequal(txtSol{l},txtStu{l})
          keyboard
          edit(apSol)
          edit(apStu)
      end 
   end
end
end

