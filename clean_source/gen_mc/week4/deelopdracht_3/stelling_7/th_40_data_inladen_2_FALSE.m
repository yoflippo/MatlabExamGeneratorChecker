Je kan met deze code probleemloos CSV files inladen in Matlab.

------------code--------------
 
[FileName, Pathname] = uigetfile('.csv');
data = dlmread([filename, pathname])

------------code--------------