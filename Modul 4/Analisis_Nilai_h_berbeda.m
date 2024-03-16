clc; clear;
function f = fx(x)
    f = 2 * x^3 + 4 * x^2 + 6;
end

x0 = 3;
eksak = 78;

% Variasi nilai h
h_values = [0.1, 0.01, 0.001];

for j = 1:length(h_values)
    h = zeros(1, 10);
    error = zeros(1, 10);

    for i = 2:10
        h(i) = h(i-1) + h_values(j);
        diff = (fx(x0 + h(i)) - fx(x0 - h(i))) / (2 * h(i));
        error(i) = abs(diff - eksak) * 100 / diff;
    end

    % Plotting
    subplot(length(h_values), 1, j);
    plot(h, error, 'r--');
    title(['Error Derivatif untuk h = ', num2str(h_values(j))]);
    xlabel('h');
    ylabel('error');
    grid on;
end

