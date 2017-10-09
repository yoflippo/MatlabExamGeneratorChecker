clear all; clc;
c = 1;
for i = 3:15
    cnt = 1;
    for ind = 1:i-2
        for ind2 = ind+2:i
            randomFileIndexes(cnt) = ind; cnt = cnt + 1;
            randomFileIndexes(cnt) = ind2; cnt = cnt + 1;
        end
    end
    output(c,1:2) = [i length(randomFileIndexes)/2];
    c=c+1;   
    randomFileIndexes;
    clear randomFileIndexes;   
end
output