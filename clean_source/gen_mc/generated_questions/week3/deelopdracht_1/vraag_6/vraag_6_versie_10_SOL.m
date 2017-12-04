%% Vraag 6
%
% Stelling 1:   De onderstaande code wordt niet correct uitgevoerd:                    
%				                                                                       
%				======= Code =======                                                   
%				randomWaardes = randn(1,20); %Genereren van random randomWaardesiabelen
%				for nR = 20:100                                                        
%				   z(nR) = randomWaardes(nR) + randomWaardes(nR+1);                    
%				end                                                                    
%				======= Code =======                                                   
%
% Stelling 2:   De onderstaande code wordt niet correct uitgevoerd:              
%				                                                                 
%				======= Code =======                                             
%				testValues = randn(1,10); %Het genereren van willekeurige wardes.
%				for nR = 2:10                                                    
%				   z(nR) = var(nR) + var(nR+1) / 2;                              
%				end                                                              
%				======= Code =======                                             
%
% A : stelling 1 is NIET-WAAR en stelling 2 is NIET-WAAR
% B : stelling 1 is NIET-WAAR en stelling 2 is WAAR
% C : stelling 1 is WAAR      en stelling 2 is NIET-WAAR
% D : stelling 1 is WAAR      en stelling 2 is WAAR
Antwoord = D;
