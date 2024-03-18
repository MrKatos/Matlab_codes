clc; clear; close all;
s = tf('s');

%transmitacja oryginalna
G5 = 20/((s + 10)^2*(s+0.2)*(s+1));
%transmitacja zredukowana 1
G5z = 20/(100*(s+0.2)*(s+1));
%transmitacja zredukowana 2
G5zz = 20/(100*(s+0.2));
%transmitacja zredukowana 3
G5zzz = 1;

aproksymate(G5, 1);
aproksymate(G5z, 2);
k = evalfr(G5zz, 0); % wyznaczanie k
G_a = (k / (1 + s * 7.6));
subplot(3, 1, 3)
step(G5)
hold on;
step(G5zz)
hold on;
step(G_a)
hold on;
legend("G5", "G5z", "G5_a")
% % Wizualizacja odpowiedzi skokowej
% step(G5);
% hold on;
% % impulse(G5);
% % hold on;
% % plot(t(max_index), skok(max_index), 'ro');  % Punkty przegięcia
% % hold on;
% % plot(t, styczna, '--');  % Punkty przegięcia
% % hold on;
% step(G5_a);
% %plot(t, p, 'p');  % Punkty przegięcia
% xlabel('Czas');
% ylabel('Odpowiedź');
% title('Odpowiedź skokowa transmitancji G(s)');
% legend('Odpowiedź skokowa', 'Punkty przegięcia');

function aproksymate(G, num)
s = tf('s');
G5 = 20/((s + 10)^2*(s+0.2)*(s+1));
k = evalfr(G, 0); % wyznaczanie k wyliczając G(0)
t = 0:0.01:30;  % Wektor czasu
[skok, t] = step(G, t);  % Odpowiedź skokowa
[impuls, ~] = impulse(G, t);  % Odpowiedź impulsowa
[~, max_index] = max(impuls); %wyznazanie punktu chwili gdzie impuls = max
a = (skok(max_index + 1) - skok(max_index - 1))/0.02;
b = skok(max_index) - a*0.01*max_index;
%styczna = a*t + b;
To = -b/a;
T = (1-b)/a - To;
G_a = (k / (1 + s * T)) * exp(-s * To);
subplot(3, 1, num)
step(G5)
hold on;
step(G)
hold on;
step(G_a)
hold on;
legend("G5", "G5z", "G5_a")
end

