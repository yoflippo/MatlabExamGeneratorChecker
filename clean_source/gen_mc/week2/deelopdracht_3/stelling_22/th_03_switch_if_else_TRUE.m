De twee code voorbeelden doen exact hetzelfde:

======= Code1 =======
spier = 1
switch spier
    case 1
        'Brachialis'
    otherwise
        'Geen spier'
end
======= Code1 =======


======= Code2 =======
spier = 1
if spier == 1
    'Brachialis'
else
    'Geen spier'
end
======= Code2 =======