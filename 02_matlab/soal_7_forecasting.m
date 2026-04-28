% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 7 — Deret Waktu, Pola Penjualan & Forecasting
%  Nama  : Muhammad Farand Danendra
%  NIM   : 2510514025 
%  Parameter: N=25, a=2, b=5, K=8, theta0=85, alpha=0.006 
%  Tanggal: 28 April 2026 
% ===================================================== 

% Tampilkan timestamp
disp(['Tanggal & Waktu Eksekusi: ', datestr(now)])

% --- Deklarasi Parameter Awal ---
N = 25;
a = floor(N/10);       % 2
b = mod(N,10);         % 5
K = a + b + 1;         % 8
theta0 = (a * 30) + (b * 5);  % 85
alpha_lr = 0.001 * (b + 1);   % 0.006

% --- 7.2 (c) Verifikasi Sigma ---
n_hist = 1:12;
% Rumus S_n sesuai persamaan
S_n = 50 + (K .* n_hist) + ((-1).^n_hist .* (a+1));

T1_matlab = sum(S_n);
T2_matlab = sum(S_n.^2);

fprintf('\n--- VERIFIKASI SIGMA ---\n');
fprintf('T1 Manual = 1224   | T1 MATLAB = %d\n', T1_matlab);
fprintf('T2 Manual = 134396 | T2 MATLAB = %d\n', T2_matlab);

% --- 1. Persiapan Data (Parameter) ---
t_hist = 1:12; 
S_hist = 50 + (K .* t_hist) + ((-1).^t_hist .* (a + 1));

% --- 2. Perhitungan 7.4 (e): Polyfit & Prediksi ---
coef = polyfit(t_hist, S_hist, 1);
slope = coef(1); intercept = coef(2);

t_pred = 13:18;
S_pred = polyval(coef, t_pred);
trend_hist = polyval(coef, t_hist);

% --- 3. Perhitungan 7.4 (f): Residual & MAE ---
residual = S_hist - trend_hist;
MAE = mean(abs(residual));

% Tampilkan ke Command Window
fprintf('--- Hasil 7.4 (e) ---\n');
fprintf('Persamaan Garis: S = %.4ft + %.4f\n', slope, intercept);
disp('Prediksi S13-S18:'); disp(S_pred);

fprintf('--- Hasil 7.4 (f) ---\n');
fprintf('Nilai MAE: %.3f\n', MAE);
disp('Residual (S_n - trend_n):'); disp(residual);

% ===================================================== 
% --- VISUALISASI BERDASARKAN SUB-SOAL ---
% ===================================================== 
figure('Name', 'Analisis Soal 7.4', 'Units', 'normalized', 'Position', [0.2 0.1 0.6 0.8]);

% --- Subplot Atas: Untuk 7.4 (e) ---
subplot(2, 1, 1);
hold on;
plot(t_hist, S_hist, 'b.', 'MarkerSize', 20, 'DisplayName', 'Data Historis (Biru, Titik)');
t_all = [t_hist, t_pred];
plot(t_all, polyval(coef, t_all), 'r--', 'LineWidth', 1.5, 'DisplayName', 'Garis Tren (Merah, Putus-putus)');
plot(t_pred, S_pred, 'g^', 'MarkerFaceColor', 'g', 'MarkerSize', 8, 'DisplayName', 'Prediksi (Hijau, Segitiga)');

title('7.4 (e) Forecasting Penjualan 6 Bulan ke Depan', 'FontSize', 12);
xlabel('Bulan ke- (n)'); ylabel('Penjualan (Juta Rp)');
xlim([0 19]); xticks(1:18); grid on;
legend('Location', 'northwest');
hold off;

% --- Subplot Bawah: Untuk 7.4 (f) ---
subplot(2, 1, 2);
hold on;
stem(t_hist, residual, 'filled', 'Color', [0.5 0 0.5], 'LineWidth', 1.5, 'DisplayName', 'Residual');
yline(0, 'k-', 'LineWidth', 1);

% Tambahkan teks nilai pada grafik residual
for i = 1:length(t_hist)
    text(t_hist(i), residual(i) + 0.3 * sign(residual(i)), sprintf('%+.1f', residual(i)), ...
        'HorizontalAlignment', 'center', 'FontSize', 9);
end

title(sprintf('7.4 (f) Analisis Pola Residual (MAE = %.3f)', MAE), 'FontSize', 12);
xlabel('Bulan ke- (n)'); ylabel('Error (S_n - Trend_n)');
xlim([0 13]); xticks(1:12); grid on;
hold off;