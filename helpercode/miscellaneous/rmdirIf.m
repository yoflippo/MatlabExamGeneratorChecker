function rmdirIf( ap )
if ~exist(ap,'dir')
    rmdir(ap);
end
end

