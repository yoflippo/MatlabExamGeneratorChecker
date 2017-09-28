txt{1} = 'line 1';
txt{2} = 'alsdkfjaskldfjaklsdjfkalsdfklja';
txt{3} = '';
txt{4} = 'lastline';
nameFile = 'testCombinedShit';
makeMFileFromCells(nameFile,txt);
open([nameFile '.m']);

txt{1} = '%% dit is een test regel 1';
txt{2} = '% grote smurf!!!';
txt{3} = '';
txt{4} = 'lastline = 1;';
nameFile = 'testCombinedShit2';
makeMFileFromCells(nameFile,txt);
open([nameFile '.m']);

% delete([nameFile '.m']);