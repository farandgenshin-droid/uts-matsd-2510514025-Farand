% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 6.2 (e) — Implementasi Gradient Descent MATLAB
%  Nama  : Muhammad Farand Danendra
%  NIM   : 2510514025 
%  Parameter: N=25, a=2, b=5, K=8, theta0=85, alpha=0.006 
%  Tanggal : 28 April 2026
% ===================================================== 

% Tampilkan timestamp
disp(['Tanggal & Waktu Eksekusi: ', datestr(now)])

%% 1. Inisialisasi Parameter dan Fungsi
x0 = 1;
alpha = 0.006;
iter_max = 500;

% Definisi fungsi profit dan turunannya (menggunakan operator elemen-wise untuk plot)
pi_f = @(x) -3*x.^3 + 80*x.^2 + 100*x - 640;
dpi  = @(x) -9*x.^2 + 160*x + 100;

%% 2. Solusi Analitik (Pencarian Akar dengan Rumus ABC)
% -9x^2 + 160x + 100 = 0
x_analitik = (-160 - sqrt(160^2 - 4*(-9)*(100))) / (2*(-9)); 
pi_analitik = pi_f(x_analitik);

%% 3. Proses Iterasi Gradient Descent
x_hist = zeros(iter_max + 1, 1);
pi_hist = zeros(iter_max + 1, 1);

x_curr = x0;
x_hist(1) = x_curr;
pi_hist(1) = pi_f(x_curr);

for k = 1:iter_max
    % Update Rule
    x_curr = x_curr + alpha * dpi(x_curr);

    % Simpan histori
    x_hist(k+1) = x_curr;
    pi_hist(k+1) = pi_f(x_curr);
end

% Ekstrak titik akhir dari iterasi
x_star = x_hist(end);
pi_star = pi_hist(end);

%% 4. Visualisasi (Plotting)
figure('Name', '6.2(e) Gradient Descent Optimization', 'Position', [100, 100, 1100, 500]);

% --- Subplot 1: Lanskap Kurva Profit pi(x) ---
subplot(1, 2, 1);
x_range = -5:0.1:25;
plot(x_range, pi_f(x_range), 'k-', 'LineWidth', 1.5); hold on; grid on;

% Plot Titik-titik Penting
plot(x0, pi_f(x0), 'mo', 'MarkerSize', 8, 'MarkerFaceColor', 'm', 'DisplayName', 'Titik Awal (x_0 = 1)');
plot(x_star, pi_star, 'bs', 'MarkerSize', 10, 'MarkerFaceColor', 'b', 'DisplayName', 'Titik Akhir Iterasi (x^*)');
plot(x_analitik, pi_analitik, 'r*', 'MarkerSize', 10, 'DisplayName', 'Solusi Analitik');

title('Kurva Profit \pi(x) dan Titik Optimasi', 'FontSize', 12);
xlabel('Harga Produk x', 'FontSize', 11);
ylabel('Profit \pi(x)', 'FontSize', 11);
legend('Kurva \pi(x)', 'Titik Awal', 'Titik Akhir (Iterasi)', 'Titik Analitik', 'Location', 'southwest');

% --- Subplot 2: Kurva Konvergensi pi(x_k) vs k ---
subplot(1, 2, 2);
plot(0:iter_max, pi_hist, 'b-', 'LineWidth', 2); hold on; grid on;

% Garis referensi target analitik
yline(pi_analitik, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Target Max Profit (Analitik)');
plot(0, pi_hist(1), 'mo', 'MarkerSize', 8, 'MarkerFaceColor', 'm', 'DisplayName', 'Start');

title('Konvergensi \pi(x_k) vs Iterasi (k)', 'FontSize', 12);
xlabel('Iterasi ke-k', 'FontSize', 11);
ylabel('Nilai Profit \pi(x_k)', 'FontSize', 11);
legend('Histori Konvergensi', 'Target Analitik', 'Titik Awal', 'Location', 'southeast');
ylim([-1000 12000]); % Memastikan batas Y terlihat proporsional

%% 5. Tampilkan Hasil ke Command Window
fprintf('--- HASIL OPTIMASI ---\n');
fprintf('Solusi Analitik (Eksak)  : x = %.6f | Profit = %.6f\n', x_analitik, pi_analitik);
fprintf('Titik Akhir (500 Iterasi): x = %.6f | Profit = %.6f\n', x_star, pi_star);