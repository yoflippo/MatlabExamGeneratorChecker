Zie het onderstaande code voorbeeld.
De input(-parameter) 'fake' wordt in de body van de functie 
gebruikt.

======= Code =======

function [text1 text2] = testfunctie(fullname,fake)
    %begin body van de functie
    everything = fullname(1:end);
    nothing = 'empty';
    text = everything;
    text2 = nothing;
    %eind body van de functie
end

======= Code =======