clear all; close all; clc;

output = generateUniqueFilename('test1',2);
if output.UniqueName ~= 'test1_77096e47409badb1fc9c1051aed7ed50.m'
    error('Test Failed');
end

output = generateUniqueFilename('test1',3);
if output.UniqueName ~= 'test1_1869f39f6e58a4ef25ae8c11b60ab4e1.m'
    error('Test Failed');
end

output = generateUniqueFilename('hottentottententententoonstellingsterrein',2017);
if output.UniqueName ~= 'hottentottententententoonstellingsterrein_654fba132d10270f9ad87c81174b7aed.m'
    error('Test Failed');
end