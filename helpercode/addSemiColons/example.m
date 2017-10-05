%% Lorum ipsum
% bullshit
% (hallo daar)

function example()
fullfile(mfilename('fullpath'))    %HIer moet het ook werken
vector = randn(1,10)  %Hier moet het ook werken

for i = 1:length(vector)
    if vector(i) > 0
        vector(i) = -vector(i)
    else
        vector(i) = vector(i)*23
    end
end

mfilename()
mfilename()   %HIer moet het ook werken
fullfile(mfilename('fullpath'))    %HIer moet het ook werken
ap = fullfile(mfilename('fullpath'))


end