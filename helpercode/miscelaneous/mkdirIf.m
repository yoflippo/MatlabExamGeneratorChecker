function mkdirIf( ap )
if ~exist(ap,'dir')
    mkdir(ap);
end
end

