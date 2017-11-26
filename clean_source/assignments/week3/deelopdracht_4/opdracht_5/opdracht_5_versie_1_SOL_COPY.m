close all
phi = 30*pi/180:1*pi/180:pi;
L1 = 0.4;
L2 = 0.5;
L3 = zeros(size(phi));
for i = 1:size(phi,2)
    L3(i) = L1^2+L2^2-2*L1*L2*cos(phi(i));
end
figure
plot(phi,L3)
