
%% DELETE THIS FUNCTION AS SEARCHING FOR QUESTION TYPE IS A BETTER OPTION
% HOWEVER, THIS FILE TAKES ORDER IN TO ACCOUNT
function [ folders ] = getFolders(directory)
folderData = dir(directory);
folders = {};
folderCnt = 1;
for i=1:length(folderData)
    if folderData(i).isdir
        if ~isequal(folderData(i).name,'.') && ~isequal(folderData(i).name,'..')
            folders{folderCnt} = folderData(i).name;
            folderCnt = folderCnt + 1;
        end
    end
end

