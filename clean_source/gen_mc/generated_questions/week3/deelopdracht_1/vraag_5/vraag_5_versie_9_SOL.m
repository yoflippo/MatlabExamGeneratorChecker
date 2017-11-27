%% Vraag 5
%
% Stelling 1:   De onderstaande code wordt niet correct uitgevoerd:
%				                                                   
%				======= Code =======                               
%				for nHerhaling = 1:10                              
%				   z(nHerhaling+1) = z(nHerhaling);                
%				end                                                
%				======= Code =======                               
%
% Stelling 2:   De onderstaande code wordt correct uitgevoerd:      
%				                                                    
%				======= Code =======                                
%				var = randn(1,100); %Genereren van random variabelen
%				for nHerhaling = 1:10                               
%				   z(nHerhaling+1) = var(2*nHerhaling);             
%				end                                                 
%				======= Code =======                                
%
% A : stelling 1 is NIET-WAAR en stelling 2 is NIET-WAAR
% B : stelling 1 is NIET-WAAR en stelling 2 is WAAR
% C : stelling 1 is WAAR      en stelling 2 is NIET-WAAR
% D : stelling 1 is WAAR      en stelling 2 is WAAR
Antwoord = B;
