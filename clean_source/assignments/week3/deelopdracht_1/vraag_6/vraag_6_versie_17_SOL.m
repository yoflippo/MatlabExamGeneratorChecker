%% Vraag 6
%
% Stelling 1:   De onderstaande code wordt zonder foutmelding uitgevoerd:
%				                                                         
%				======= Code =======                                     
%				clc                                                      
%				clear variables                                          
%				%Genereren van random variabelen                         
%				randomWaardes = randn(1,20);                             
%				for nR = 20:100                                          
%				   z(nR) = randomWaardes(nR) + randomWaardes(nR+1);      
%				end                                                      
%				======= Code =======                                     
%
% Stelling 2:   De onderstaande code wordt niet correct uitgevoerd omdat
%				je in de for-lus op een bepaalt moment een element van  
%				de vector selecteert die buiten de vector ligt.         
%				                                                        
%				======= Code =======                                    
%				clc                                                     
%				clear variables                                         
%				testValues = randn(1,10);                               
%				for nR = 10:1                                           
%				   z(nR) = var(nR-2) + var(nR-1) / 2;                   
%				end                                                     
%				======= Code =======                                    
%
% A : stelling 1 is NIET-WAAR en stelling 2 is NIET-WAAR
% B : stelling 1 is NIET-WAAR en stelling 2 is WAAR
% C : stelling 1 is WAAR      en stelling 2 is NIET-WAAR
% D : stelling 1 is WAAR      en stelling 2 is WAAR
Antwoord = A;
