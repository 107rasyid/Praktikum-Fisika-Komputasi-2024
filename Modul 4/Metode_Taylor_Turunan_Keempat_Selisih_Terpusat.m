clc; clear;
function f = fx(x)
    f = 10 * x^5 + 18 * x^4 + 28*x^3 + 7*x^2 + 6;
end

h(1) = 0;
x0 = 3;
eksak = 4032;
nilai_h = 0.1;
for i = 2:10
    h(i) = h(i-1) + nilai_h;
    diff = (fx(x0 - 2 * h(i)) - 4 * fx(x0 - h(i)) + 6 * fx(x0) - 4 * fx(x0 + h(i)) + fx(x0 + 2 * h(i))) / (h(i)^4);
    error(i) = abs(diff - eksak) * 100 / diff;
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

