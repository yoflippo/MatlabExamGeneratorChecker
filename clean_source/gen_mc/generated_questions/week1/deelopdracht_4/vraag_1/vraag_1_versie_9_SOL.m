%% Vraag 1
%
% Stelling 1:   In de reader worden twee manieren van programmeren beschreven:
%				1 - Slordig                                                   
%				2 - Quick and Neat                                            
%
% Stelling 2:   Het code voorbeeld dat hieronder staat is een voorbeeld                   
%				van netjes werken:                                                        
%				======= Code =======                                                      
%				% Find studentnumbers                                                     
%				load(fullfile(NAMEASSIGNMENTFOLDER,STUDENTNUMBERMAT))                     
%				% Remove directories from folder, they contain unzipped files and they are
%				% unusable because you are running this script                            
%				addpath(genpath(fullfile(pwd,subWkFolder)))                               
%				removeDirectoriesFromFolder(fullfile(pwd,subWkFolder))                    
%				% Get files in the folder for analysis                                    
%				files = dir(subWkFolder);                                                 
%				======= Code =======                                                      
%
% A : stelling 1 is NIET-WAAR en stelling 2 is NIET-WAAR
% B : stelling 1 is NIET-WAAR en stelling 2 is WAAR
% C : stelling 1 is WAAR      en stelling 2 is NIET-WAAR
% D : stelling 1 is WAAR      en stelling 2 is WAAR
Antwoord = B;