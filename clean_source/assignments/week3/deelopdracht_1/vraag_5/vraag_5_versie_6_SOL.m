%% Vraag 5
%
% Stelling 1:   De vector z krijgt bij elke herhaling een grotere lengte.
%				                                                         
%				======= Code =======                                     
%				for a = 1:10                                             
%				   z(a) = a.^2;                                          
%				end                                                      
%				======= Code =======                                     
%
% Stelling 2:   De onderstaande code wordt niet correct uitgevoerd: 
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
Antwoord = C;