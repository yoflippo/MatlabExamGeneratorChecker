De onderstaande code wordt niet zonder foutmeldingen 
uitgevoerd omdat een vector geen negatieve index
kan hebben.

======= Code =======
clc
clear variables %workspace leegmaken
for z = -1:10
    VECTOR(z+1) = z;
end
======= Code =======