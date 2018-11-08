De while-lus stopt in het onderstaande voorbeeld met herhalen
omdat de variabele teller op een gegeven moment kleiner is
dan 10.

======= Code =======
clc
clear variables
blTest = false;
teller = 0;
while teller < 10 && blTest == false
    disp(num2str(teller));
    teller = teller + 1;
end
======= Code =======

