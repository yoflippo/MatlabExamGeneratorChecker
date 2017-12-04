%% Vraag 8
%
% Stelling 1:   Zie het onderstaande code voorbeeld.                       
%				In de code is een functie te zien met 2 inputs en 1 output.
%				                                                           
%				======= Code =======                                       
%				                                                           
%				function [o1 o2] = testfunctie(i1,i2)                      
%				    % Hier gebeurt vanalles                                
%				end                                                        
%				                                                           
%				======= Code =======                                       
%
% Stelling 2:   Zie het onderstaande code voorbeeld.                        
%				De input(-parameter) 'fake' wordt in de body van de functie 
%				gebruikt.                                                   
%				                                                            
%				======= Code =======                                        
%				                                                            
%				function [text1 text2] = testfunctie(fullname,fake)         
%				    %begin body van de functie                              
%				    everything = fullname(1:end);                           
%				    nothing = 'empty';                                      
%				    text = everything;                                      
%				    text2 = nothing;                                        
%				    %eind body van de functie                               
%				end                                                         
%				                                                            
%				======= Code =======                                        
%
% A : stelling 1 is NIET-WAAR en stelling 2 is NIET-WAAR
% B : stelling 1 is NIET-WAAR en stelling 2 is WAAR
% C : stelling 1 is WAAR      en stelling 2 is NIET-WAAR
% D : stelling 1 is WAAR      en stelling 2 is WAAR
Antwoord = A;
