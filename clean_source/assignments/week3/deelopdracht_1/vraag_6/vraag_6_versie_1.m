%% Vraag 6
%
% Stelling 1:   De onderstaande code wordt met foutmeldingen uitgevoerd:
%				                                                        
%				======= Code =======                                    
%				clc                                                     
%				clear variables                                         
%				var = randn(1,100); %Genereren van random variabelen    
%				for nRep = 2:10                                         
%				   z(nRep) = var(nRep-1) + var(nRep) / 2;               
%				end                                                     
%				======= Code =======                                    
%
% Stelling 2:   De while-lus stopt in het onderstaande voorbeeld met herhalen
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
% A : stelling 1 is NIET-WAAR en stelling 2 is NIET-WAAR
% B : stelling 1 is NIET-WAAR en stelling 2 is WAAR
% C : stelling 1 is WAAR      en stelling 2 is NIET-WAAR
% D : stelling 1 is WAAR      en stelling 2 is WAAR
Antwoord = NaN; % vul hier het juiste antwoord in A, B, C of D
