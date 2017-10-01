% Bereken van percentage als alle weekopdrachten een 1 zijn en het tentamen
% cijfer een zes of hoger is.
clear all; close all; clc;
syms p tt w_ass mingrade nw_ass
tt = 6.0; % tentamen cijfer
w_ass = 1.0;
mingrade = 5.5;
nw_ass = 4;
assume(p<1)
pans = solve((1-p)*nw_ass*w_ass + p*tt == mingrade, p);
double(pans)

