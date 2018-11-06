%% Vraag 14
%
% Stelling 1:   In het Command Window wordt de 'Brachialis' afgedrukt:
%				                                                      
%				======= Code =======                                  
%				                                                      
%				spier = 6                                             
%				switch spier                                          
%				    case 1                                            
%				        'Brachialis'                                  
%				    case 2                                            
%				        'Rector femoris'                              
%				    case 3                                            
%				        'Quadriceps'                                  
%				    case 4                                            
%				        'Tibialis'                                    
%				    otherwise                                         
%				        'Geen spier'                                  
%				end                                                   
%				                                                      
%				======= Code =======                                  
%
% Stelling 2:   De twee code voorbeelden doen exact hetzelfde:
%				                                              
%				======= Code1 =======                         
%				spier = 1                                     
%				switch spier                                  
%				    case 1                                    
%				        'Brachialis'                          
%				    otherwise                                 
%				        'Geen spier'                          
%				end                                           
%				======= Code1 =======                         
%				                                              
%				                                              
%				======= Code2 =======                         
%				spier = 1                                     
%				if spier == 1                                 
%				    'Brachialis'                              
%				else                                          
%				    'Geen spier'                              
%				end                                           
%				======= Code2 =======                         
%
% A : stelling 1 is NIET-WAAR en stelling 2 is NIET-WAAR
% B : stelling 1 is NIET-WAAR en stelling 2 is WAAR
% C : stelling 1 is WAAR      en stelling 2 is NIET-WAAR
% D : stelling 1 is WAAR      en stelling 2 is WAAR
Antwoord = B;
