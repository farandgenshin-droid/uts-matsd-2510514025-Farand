% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 6.2e — Implementasi Gradient Descent (Plot Turunan pi'(x))
%  Nama  : Muhammad Farand Danendra
%  NIM   : 2510514025 
%  Parameter: N=25, a=2, b=5, K=8, theta0=85, alpha=0.006 
%  Tanggal:  28 April 2026 
% ===================================================== 

disp(['Tanggal & Waktu Eksekusi: ', datestr(now)])

% Inisialisasi Parameter
x0 = 1;
alpha = 0.006;
iter_max = 500;

% Fungsi profit (pi_f) dan turunannya (dpi)
pi_f = @(x) -3*x.^3 + 80*x.^2 + 100*x - 640;
dpi  = @(x) -9*x.^2 + 160*x + 100;

% Solusi Analitik (Akar persamaan kuadrat)
x_analitik = (-160 - sqrt(160^2 - 4*(-9)*(100))) / (2*(-9)); 
pi_analitik = pi_f(x_analitik);

% Inisialisasi Histori
x_hist   = zeros(iter_max + 1, 1);
pi_hist  = zeros(iter_max + 1, 1);
dpi_hist = zeros(iter_max + 1, 1);
x_curr = x0;

% Loop Iterasi Gradient Descent
for k = 1:iter_max+1
    x_hist(k)   = x_curr;
    pi_hist(k)  = pi_f(x_curr);
    dpi_hist(k) = dpi(x_curr);

    x_curr = x_curr + alpha * dpi(x_curr);
end

x_star   = x_hist(end);
pi_star  = pi_hist(end);

% Visualisasi 2x2
figure('Name', 'Analisis 6.2e', 'Position', [50, 50, 1100, 600]);
x_range = -2:0.1:25;

% [1] Kiri Atas: Lanskap Fungsi Profit
subplot(2, 2, 1); hold on; grid on;
plot(x_range, pi_f(x_range), 'k-', 'LineWidth', 1.5, 'DisplayName', 'Kurva \pi(x)');
plot(x0, pi_f(x0), 'mo', 'MarkerFaceColor', 'm', 'DisplayName', 'Start x_0');
plot(x_star, pi_star, 'bs', 'MarkerSize', 8, 'MarkerFaceColor', 'b', 'DisplayName', 'Akhir Iterasi x^*');
plot(x_analitik, pi_analitik, 'r*', 'MarkerSize', 8, 'DisplayName', 'Optimum Analitik');
title('Lanskap Fungsi Profit', 'FontSize', 11); ylabel('Profit \pi(x)'); legend('Location', 'southwest'); xlim([-2 25]); ylim([-1000 12000]);

% [2] Kanan Atas: Konvergensi Profit vs Iterasi
subplot(2, 2, 2); hold on; grid on;
plot(0:iter_max, pi_hist, 'b-', 'LineWidth', 2, 'DisplayName', 'Histori Profit');
yline(pi_analitik, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Max Profit (Analitik)');
title('Konvergensi Profit \pi(x_k)', 'FontSize', 11); ylabel('Nilai Profit'); xlabel('Iterasi (k)'); legend('Location', 'southeast'); ylim([-1000 12000]);

% [3] Kiri Bawah: Lanskap Fungsi Turunan
subplot(2, 2, 3); hold on; grid on;
plot(x_range, dpi(x_range), 'g-', 'LineWidth', 1.5, 'DisplayName', 'Kurva \pi''(x)');
yline(0, 'k-', 'LineWidth', 1, 'HandleVisibility', 'off');
plot(x_star, dpi_hist(end), 'bs', 'MarkerSize', 8, 'MarkerFaceColor', 'b', 'DisplayName', 'Akhir (Gradien \approx 0)');
plot(x_analitik, 0, 'r*', 'MarkerSize', 8, 'DisplayName', 'Akar Analitik');
title('Lanskap Turunan (Gradien)', 'FontSize', 11); ylabel('Gradien \pi''(x)'); xlabel('Harga (x)'); legend('Location', 'southwest'); xlim([-2 25]);

% [4] Kanan Bawah: Konvergensi Turunan vs Iterasi
subplot(2, 2, 4); hold on; grid on;
plot(0:iter_max, dpi_hist, 'g-', 'LineWidth', 2, 'DisplayName', 'Histori Gradien');
yline(0, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Target \pi''(x) = 0');
title('Konvergensi Turunan \pi''(x_k)', 'FontSize', 11); ylabel('Nilai Gradien'); xlabel('Iterasi (k)'); legend('Location', 'northeast');

% Perbandingan Analisis:
disp('--- HASIL OPTIMASI ---');
disp(['Solusi Analitik (x*)     : ', num2str(x_analitik)]);
disp(['Akhir 500 Iterasi (x*)   : ', num2str(x_star)]);