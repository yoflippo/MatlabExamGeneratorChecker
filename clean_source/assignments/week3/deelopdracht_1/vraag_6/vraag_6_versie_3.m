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
Antwoord = NaN; % vul hier het juiste antwoord in A, B, C of D
