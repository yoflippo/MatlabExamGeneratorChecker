function copy();
fullfile(mfilename('fullpath'));
vector = randn(1,10);
for i = 1:length(vector);
    if vector(i) > 0
        vector(i) = -vector(i);
    else
        vector(i) = vector(i)*23;
    end
end
mfilename();
mfilename();
fullfile(mfilename('fullpath'));
ap = fullfile(mfilename('fullpath'));
end
