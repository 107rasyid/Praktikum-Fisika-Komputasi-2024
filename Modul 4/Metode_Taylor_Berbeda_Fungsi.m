clc; clear;
function f = fx(x)
    f = x^5;
end

h(1) = 0;
x0 = 3;
eksak = 324;
for i = 2:10
    h(i) = h(i-1) + 0.01;
    diff = (fx(x0 + h(i)) - fx(x0 - h(i))) / (2 * h(i));
    error(i) = abs(diff - eksak) * 100 / abs(eksak);
    hasil_turunan(i) = diff;
    display(['nilai turunan dengan h = ', num2str(h(i)), ' adalah ', num2str(hasil_turunan(i))])
    %display(['nilai error dengan h = ', num2str(h(i)), ' adalah ', num2str(error(i))])
end

subplot(2,1,1); %plot nilai turunan dari iterasi nilai h
plot(h, hasil_turunan, 'b-');
title('Nilai Turunan Numerik');
xlabel('h');
ylabel('Nilai Turunan');

subplot(2,1,2); %plot nilai error dari iterasi nilai h
plot(h, error, 'r--');
title('Grafik Error Derivatif Kedua dari f = 2x^3 + 4x^2 + 6');
xlabel('h');
ylabel('Error');
