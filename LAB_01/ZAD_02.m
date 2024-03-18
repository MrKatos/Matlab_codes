clc; clear all; close all;
k = 1;
%2.1
Matrix = zeros(1, 4);
%a
Ga = tf(1, [1, 3, 2]);
Ra = tf(k);
Ha = tf(1);
Gg = series(Ra, Ga);
Go = series(Gg, Ha);
Gz = feedback(series(Ra, Ga), Ha, -1);

%b
Gb = tf(1, [1, 2, 0]);
Rb = tf(k);
Hb = tf(1, [1, 0.5]);
Ggb = series(Rb, Gb);
Gob = series(Ggb, Hb);
Gzb = feedback(series(Rb, Gb), Hb, -1);

%c
Gc = tf(10, [1, 2.5, 1]);
Rc = tf(k);
Hc = tf(1, [1, 1]);
Ggc = series(Rc, Gc);
Goc = series(Ggc, Hc);
Gzc = feedback(series(Rc, Gc), Hc, -1);

%d
Gd = tf(1, [1, -2, 1]);
Rd = tf([3*k, 1*k], 1);
Hd = tf(1);
Ggd = series(Rd, Gd);
God = series(Ggd, Hd);
Gzd = feedback(series(Rd, Gd), Hd, -1);

%e
Ge = tf([10, 1, 1], [1, 4, 5, 2, 0]);
Re = tf(k);
He = tf(1, [1, 0]);
Gge = series(Re, Ge);
Goe = series(Gge, He);
Gze = feedback(series(Re, Ge), He, -1);

%2.2
[L, M] = tfdata(God, 'v');
roots_Go = roots(M);
disp('Część rzeczywista:')
disp(real(roots_Go))

disp('Część urojona:')
disp(imag(roots_Go))



%2.3. sprawdzanie stabilności
if all(real(roots_Go) < 0)
    disp('Układ otwarty jest stabilny.');
else
    disp('Układ otwarty nie jest stabilny.');
end

%2.3.
if (any(imag(roots_Go) == 0)) && (all(real(roots_Go) < 0))
    disp('Uklad jest aperiodyczny')
elseif (any(imag(roots_Go) > 0)) && (all(real(roots_Go) <= 0))
    disp('Uklad jest oscylacyjny')
elseif any(real(roots_Go)) > 0
    disp('Uklad jest nieograniczony')
else
    disp('Inny rodzaj układu');
end

%2.4.

ltiview(God);

%2.5.

%nyquist(Gzd);

%Układ zamknięty jest strukturalnie stabilny

%2.6.

%ltiview(Gzd);

%tak

%2.7.

k = [0.25, 0.5, 1, 1.5, 5];
for ki = k
Ge = tf([10, 1, 1], [1, 4, 5, 2, 0]);
Re = tf(ki);
He = tf(1, [1, 0]);
Gge = series(Re, Ge);
Goe = series(Gge, He);
Gze = feedback(series(Re, Ge), He, -1);

    %ltiview(Gze);

    [L, M] = tfdata(Gze, 'v');
    roots_Gz = roots(M);

    if all(real(roots_Gz) < 0)
        disp(['Układ zamknięty dla k: ', num2str(ki), ' jest stabilny.']);
    else
        disp(['Układ zamknięty dla k: ', num2str(ki), ' nie jest stabilny.']);
    end
end
 %nie wpływa na stabilność
 %wpływa na stany przejściowe







