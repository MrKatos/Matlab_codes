clc; clear; close all;


% 2.1 - 2.4
s = tf('s');
G5 = 20/((s + 10)^2*(s+0.2)*(s+1));
G6 = 6.25 / ((s + 5)*(s^2 + s + 1.25));
G7 = 0.0625/((s + 0.05)*(s^2 + s + 1.25));
G8 = 5/((s+10)*(s^2 + 10.05*s + 0.5));
G9 = 5/(s*(s+5));
G10 = 10000/((s + 10)^2*(s - 100));

%Zredukowane 

G5z = 20/(100*(s+0.2)*(s+1));
G6z = 6.25 /(5*(s^2 + s + 1.25));
G7z = 0.0625/(1.25*(s + 0.05));
G8z = 5/(100*(s+0.05));
G9z = 5/(5*(s));
G10z = 10000/(-100*(s + 10)^2);

%Rysowanie (2.1 & 2.5)
plot_roots_step_nyquist(G5, G5z, G6, G6z, G7, G7z, G8, G8z, G9, G9z, G10, G10z);

%2.6
kp = 2;
R = kp;
G6z = 20 /(s^2 + s + 1.25);

G6 = 6.25 / ((s + 5)*(s^2 + s + 1.25));
G6o2 = series(R, G6);
URA2 = feedback(G6o2, 1, -1);

kp = 20;
R = kp;
G6o20 = series(R, G6);
URA20 = feedback(G6o20, 1, -1);

figure;
step(URA20);
hold on;
step(URA2);
legend("kp = 20", "kp = 2");

figure;
bode(G6o20);
hold on;
bode(G6o2);
legend("kp = 20", "kp = 2");

figure;
nyquist(G6o20);
hold on;
nyquist(G6o2);
legend("kp = 20", "kp = 2");


%pierwsza kropka -> można, na wykresie bodego wykres fazowy schodzi poniżej
%270 stopni, co oznacza, że na wykresie Nyquista przecinamy oś
%rzeczywistych. W takim układzie rzeczy, większe wzmocnienie może wpływać
%na objęcie przez charakterystykę punku (-1,0j) wpływając na utratę
%stabilności

function plot_roots_step_nyquist(G5, G5z, G6, G6z, G7, G7z, G8, G8z, G9, G9z, G10, G10z)

%bieguny 
[~, M] = tfdata(G5, 'v');
roots_G5 = real(roots(M));
roots_G5_IMG = imag(roots(M));

[~, M] = tfdata(G6, 'v');
roots_G6 = real(roots(M));
roots_G6_IMG = imag(roots(M));

[~, M] = tfdata(G7, 'v');
roots_G7 = real(roots(M));
roots_G7_IMG = imag(roots(M));

[~, M] = tfdata(G8, 'v');
roots_G8 = real(roots(M));
roots_G8_IMG = imag(roots(M));

[~, M] = tfdata(G9, 'v');
roots_G9 = real(roots(M));
roots_G9_IMG = imag(roots(M));

[~, M] = tfdata(G10, 'v');
roots_G10 = real(roots(M));
roots_G10_IMG = imag(roots(M));

% 2.3 Wykresy rozmieszczenia biegunów
figure;
subplot(2, 3, 1);
scatter(roots_G5, roots_G5_IMG, "blue x");
title("G5");
grid on;

subplot(2, 3, 2);
scatter(roots_G6, roots_G6_IMG, "blue x");
title("G6");

subplot(2, 3, 3);
scatter(roots_G7, roots_G7_IMG, "blue x");
title("G7");

subplot(2, 3, 4);
scatter(roots_G8, roots_G8_IMG, "blue x");
title("G8");

subplot(2, 3, 5);
scatter(roots_G9, roots_G9_IMG, "blue x");
title("G9");

subplot(2, 3, 6);
scatter(roots_G10, roots_G10_IMG, "blue x");
title("G10");

% 2.4 Wykresy odpowiedzi skokowej

figure;
subplot(2, 3, 1)
step(G5)
title("G5 & G5z");
hold on;
step(G5z)
legend("G5", "G5z");

subplot(2, 3, 2)
step(G6)
title("G6 & G6z");
hold on;
step(G6z)
legend("G6", "G6z");

subplot(2, 3, 3)
step(G7)
title("G7 & G7z");
hold on;
step(G7z)
legend("G7", "G7z");

subplot(2, 3, 4)
step(G8)
title("G8 & G8z");
hold on;
step(G8z)
legend("G8", "G8z");

subplot(2, 3, 5)
step(G9)
title("G9 & G9z");
hold on;
step(G9z)
legend("G9", "G9z");

subplot(2, 3, 6)
step(G10)
title("G10 & G10z");

hold on;
step(G10z)
legend("G10", "G10z");
% 2.5 Wykresy Nyquista

figure;
subplot(2, 3, 1)
nyquist(G5)
hold on;
nyquist(G5z)
legend("G5", "G5z");

subplot(2, 3, 2)
nyquist(G6)
hold on;
nyquist(G6z)
legend("G6", "G6z");

subplot(2, 3, 3)
nyquist(G7)
hold on;
nyquist(G7z)
legend("G7", "G7z");

subplot(2, 3, 4)
nyquist(G8)
hold on;
nyquist(G8z)
legend("G8", "G8z");

subplot(2, 3, 5)
nyquist(G9)
hold on;
nyquist(G9z)
legend("G9", "G9z");

subplot(2, 3, 6)
nyquist(G10)
hold on;
nyquist(G10z)
legend("G10", "G10z");

end







