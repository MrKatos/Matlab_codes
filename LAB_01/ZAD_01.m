clc; clear all; close all;

% Definicja transmitancji
G = tf(1, [1, 3, 2]);

% Tworzenie sinusa
t = linspace(0, 20, 1000); %od 0 do 1 w 200 częściach
w = 1.4;
s = sin(w*t);
[y, t] = lsim(G, s, t);

A_s = 2*max(s); % Amplituda Sinusa
A_y = 2*max(y); % Amplituda wyjścia
M = A_y/A_s;

Tx = 1.174; % Wyznaczone na oko, na podstawie wykresu
FI = (-1)*w*Tx;

plot(t, s)
grid on;
hold on;
plot(t, y)

wi = [0.002, 0.2, 0.5, 1.4, 2.5, 5];
A_i_FI = zeros(3, 6);
counter = 1;
t = linspace(0, 1000, 100000);
for element = wi   
    s = sin(element*t);
    % Odpowiedź na sinus
    [y, t] = lsim(G, s, t);
    f = fit(t, y, 'sin1');
    A_i_FI(1, counter) = f.a1;
    A_i_FI(2, counter) = f.c1;
    A_i_FI(3, counter) = element;
    counter = counter + 1;
end

points_possition = zeros(6, 2);
for i = 1:6
    points_possition(i, 1) = A_i_FI(1, i)*cos(A_i_FI(2, i)); % pozycja X super
    points_possition(i, 2) = A_i_FI(1, i)*sin(A_i_FI(2, i)); % pozycja Y
end

figure;
plotoptions=nyquistoptions('cstprefs');
plotoptions.ShowFullContour='off';
nyquist(G,plotoptions);
hold on;
scatter(points_possition(:,1), points_possition(:,2))




