Zie de onderstaande code. De vector 'c' bestaat na het 
uitvoeren exact 11 verschillende waardes.

======= Code =======
clc
clear variables %workspace leegmaken
for a = 1:10
    for b = 1:10
        c(a) = a+b;
    end
end
======= Code =======