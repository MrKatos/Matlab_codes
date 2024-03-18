clc; clear; close all;
%1.2
k = 2;
z = -25;
p = [-2, -3];
G1 = zpk(z, p, k);

k = 1000;
z = -0.01;
p = [-2, -3];
G2 = zpk(z, p, k);

k = 100;
z = [-1, -0.1];
p = [-2, -3];
G3 = zpk(z, p, k);

k = 100;
z = [-1, -0.1];
p = [-0.1, -0.2];
G4 = zpk(z, p, k);
%1.3
k = 50;
z = [];
p = [-2, -3];
G1z = zpk(z, p, k);

k = 10;
G2z = zpk(z, p, k);

k = 100;
z = -0.1;
G3z = zpk(z, p, k);

p = [-0.1, -0.2];
G4z = zpk(z, p, k);

% subplot(2,2,1)
% pzmap(G1)
% legend("G1");
% subplot(2,2,2)
% pzmap(G2)
% legend("G2");
% subplot(2,2,3)
% pzmap(G3)
% legend("G3");
% subplot(2,2,4)
% pzmap(G4)
% legend("G4");

figure
subplot(4, 2, 1)
step(G1)
hold on
step(G1z)
legend("G1", "G1z");
grid on;
hold on;
subplot(4, 2, 2)
nyquist(G1)
hold on
nyquist(G1z)
legend("G2", "G2z");

subplot(4, 2, 3)
step(G2)
hold on
step(G2z)
legend("G2", "G2z");
grid on;
hold on;
subplot(4, 2, 4)
nyquist(G2)
hold on;
nyquist(G2z)
legend("G2", "G2z");

subplot(4, 2, 5)
step(G3)
hold on;
step(G3z)
grid on;
legend("G3","G3z");
hold on;
subplot(4, 2, 6)
nyquist(G3)
hold on
nyquist(G3z)
legend("G3","G3z");

subplot(4, 2, 7)
step(G4)
hold on
step(G4z)
legend("G4", "G4z");
grid on;
hold on;
subplot(4, 2, 8)
nyquist(G4)
hold on
nyquist(G4z)
legend("G4", "G4z");