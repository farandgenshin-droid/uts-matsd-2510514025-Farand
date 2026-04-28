% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 6.2 (f) — Gradient Descent Manual (Plot Konvergensi)
%  Nama  : Muhammad Farand Danendra
%  NIM   : 2510514025 
%  Parameter: N=25, a=2, b=5, K=8, theta0=85, alpha=0.006 
%  Tanggal: 28 april 2026
% ===================================================== 

% Tampilkan timestamp
disp(['Tanggal & Waktu Eksekusi: ', datestr(now)])

% Fungsi profit dan turunan (Sesuai Parameter a=2, b=5, K=8)
% pi(x) = -3x^3 + 80x^2 + 100x - 640
pi_f = @(x) -3*x.^3 + 80*x.^2 + 100*x - 640;
dpi  = @(x) -9*x.^2 + 160*x + 100;

% Parameter
x0 = 1;                     % Titik awal
iter = 500;                 % Jumlah maksimal iterasi

% Learning rates (Sesuai Soal 6.2f)
alpha1 = 0.006;     % normal / optimal
alpha2 = 0.06;      % terlalu besar (10 * alpha optimal)
alpha3 = 0.0006;    % terlalu kecil (0.1 * alpha optimal)

% Inisialisasi Matriks Histori
x_hist1 = zeros(iter,1); pi_hist1 = zeros(iter,1);
x_hist2 = zeros(iter,1); pi_hist2 = zeros(iter,1);
x_hist3 = zeros(iter,1); pi_hist3 = zeros(iter,1);

% Inisialisasi Titik Awal
x1 = x0; x2 = x0; x3 = x0;

% Iterasi Gradient Descent
for k = 1:iter
    % alpha normal (optimal)
    x_hist1(k) = x1;
    pi_hist1(k) = pi_f(x1);
    x1 = x1 + alpha1 * dpi(x1);

    % alpha besar (divergen)
    x_hist2(k) = x2;
    pi_hist2(k) = pi_f(x2);
    x2 = x2 + alpha2 * dpi(x2);

    % alpha kecil (lambat)
    x_hist3(k) = x3;
    pi_hist3(k) = pi_f(x3);
    x3 = x3 + alpha3 * dpi(x3);
end

% =========================
% Plot hasil
% =========================
figure;
hold on; grid on;

% Plot ketiga kurva histori profit
plot(pi_hist1, 'b', 'LineWidth', 2)
plot(pi_hist2, 'r--', 'LineWidth', 2)
plot(pi_hist3, 'g-.', 'LineWidth', 2)

% Label dan Judul
xlabel('Iterasi (k)')
ylabel('Profit \pi(x_k)')
title('Perbandingan Konvergensi Gradient Descent (N=25)')

% Legend
legend('\alpha = 0.006 (optimal)', ...
    '\alpha = 0.06 (terlalu besar)', ...
    '\alpha = 0.0006 (terlalu kecil)', ...
    'Location', 'best')

% Titik awal & akhir (untuk kurva optimal)
plot(1, pi_hist1(1), 'ko', 'MarkerFaceColor', 'k')
plot(iter, pi_hist1(end), 'ks', 'MarkerFaceColor', 'y')

text(1, pi_hist1(1), '  Start', 'FontSize', 10, 'FontWeight', 'bold')
text(iter, pi_hist1(end), '  End (Max Profit)', 'FontSize', 10, 'FontWeight', 'bold')

% Batasi sumbu Y agar ledakan nilai pada alpha=0.06 tidak merusak seluruh grafik
ylim([-2000 12000]);

% Percantik ukuran font sumbu
set(gca, 'FontSize', 11);