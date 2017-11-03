De onderstaande code wordt niet correct uitgevoerd:

======= Code =======
testValues = randn(1,10); %Het genereren van willekeurige wardes.
for nR = 2:10
   z(nR) = var(nR) + var(nR+1) / 2;
end
======= Code =======