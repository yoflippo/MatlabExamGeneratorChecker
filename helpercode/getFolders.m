function [ folders ] = getFolders(directory)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
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

