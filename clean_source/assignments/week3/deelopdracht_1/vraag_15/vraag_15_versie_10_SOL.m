%% Vraag 15
%
% Stelling 1:   De onderstaande code laat een figure zien met
%				2 subplots.                                  
%				                                             
%				======= Code =======                         
%				n = 10;                                      
%				t = -n:0.1:n;                                
%				y1 = t.^2;                                   
%				y2 = t.^3;                                   
%				subplot(2,1,1);                              
%				plot(t,y1);                                  
%				grid on                                      
%				grid minor                                   
%				subplot(2,1,1);                              
%				plot(t,y2);                                  
%				grid on                                      
%				grid minor                                   
%				======= Code =======                         
%
% Stelling 2:   De while-lus wordt niet uitgevoerd. Dat komt enkel en alleen
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
% A : stelling 1 is NIET-WAAR en stelling 2 is NIET-WAAR
% B : stelling 1 is NIET-WAAR en stelling 2 is WAAR
% C : stelling 1 is WAAR      en stelling 2 is NIET-WAAR
% D : stelling 1 is WAAR      en stelling 2 is WAAR
Antwoord = A;
