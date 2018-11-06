%% Vraag 15
%
% Stelling 1:   De while-lus wordt niet uitgevoerd. Dat komt enkel en alleen
%				doordat blTest gelijk is aan false.                         
%				                                                            
%				======= Code =======                                        
%				blTest = false;                                             
%				teller = 0;                                                 
%				while teller < 0 && blTest                                  
%				    disp(num2str(teller));                                  
%				    teller = teller + 1;                                    
%				end                                                         
%				======= Code =======                                        
%				                                                            
%
% Stelling 2:   De onderstaande code laat een plot zien met een beperkte
%				y-as.                                                   
%				                                                        
%				======= Code =======                                    
%				t = -n:0.1:n;                                           
%				Y1 = t.^2;                                              
%				                                                        
%				figure;                                                 
%				plot(t,Y1,'r');                                         
%				ylim([1 2])                                             
%				======= Code =======                                    
%
% A : stelling 1 is NIET-WAAR en stelling 2 is NIET-WAAR
% B : stelling 1 is NIET-WAAR en stelling 2 is WAAR
% C : stelling 1 is WAAR      en stelling 2 is NIET-WAAR
% D : stelling 1 is WAAR      en stelling 2 is WAAR
Antwoord = B;
