function rmdirIf( ap )
if exist(ap,'dir')
    rmdir(ap,'s');
end
end

