De onderstaande code wordt niet correct uitgevoerd omdat
de variabele z nog niet is gedefinieerd als de je in de
for-lus komt.

======= Code =======
clc
clear variables
for nHerhaling = 1:10
   z(nHerhaling+1) = z(nHerhaling);
end
======= Code =======