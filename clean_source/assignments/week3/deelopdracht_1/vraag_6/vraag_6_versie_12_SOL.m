%% Vraag 6
%
% Stelling 1:   De while-lus stopt in het onderstaande voorbeeld met herhalen
%				omdat de variabele teller op een gegeven moment kleiner is   
%				dan 10.                                                      
%				                                                             
%				======= Code =======                                         
%				clc                                                          
%				clear variables                                              
%				blTest = false;                                              
%				teller = 0;                                                  
%				while teller < 10 && blTest == false                         
%				    disp(num2str(teller));                                   
%				    teller = teller + 1;                                     
%				end                                                          
%				======= Code =======                                         
%				                                                             
%
% Stelling 2:   De onderstaande code geeft tijdens het runnen een  
%				foutmelding:                                       
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
% A : stelling 1 is NIET-WAAR en stelling 2 is NIET-WAAR
% B : stelling 1 is NIET-WAAR en stelling 2 is WAAR
% C : stelling 1 is WAAR      en stelling 2 is NIET-WAAR
% D : stelling 1 is WAAR      en stelling 2 is WAAR
Antwoord = D;
