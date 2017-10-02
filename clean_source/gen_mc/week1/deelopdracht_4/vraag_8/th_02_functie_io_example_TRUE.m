Zie het onderstaande code voorbeeld.
De functie heeft twee outputs.

======= Code =======

function [text1 text2] = testfunctie(fullname,fake)
    everything = fullname(1:end);
    nothing = 'empty';
    text = everything;
    text2 = nothing;
end

======= Code =======