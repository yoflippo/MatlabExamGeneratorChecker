In de onderstaande for-loop is de variabele vectorA 
een vector:

----------code-----------
VectorB = 0:1:10;
VectorC = 10:1:20;

for i = 1:length(VectorC)
    
    VectorA(i) = VectorB(1) + VectorC(i);
    
end
----------code-----------