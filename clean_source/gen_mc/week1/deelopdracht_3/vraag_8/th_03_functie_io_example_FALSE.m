Zie het onderstaande code voorbeeld.
De input(-parameter) 'fake' wordt in de onderstaande code
niet gebruikt.

======= Code =======

function [text1 text2] = testfunctie(fullname,fake)
    everything = fullname(1:end);
    nothing = 'empty';
    text = everything;
    text2 = nothing;
end

======= Code =======